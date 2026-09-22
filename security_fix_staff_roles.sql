-- Fixes a privilege-escalation hole: every "Staff can ..." policy below
-- currently checks auth.jwt() -> 'user_metadata', which any signed-in
-- user can set on themselves via the signup form or supabase.auth.updateUser().
-- This rewrites them to check 'app_metadata' instead, which only an
-- admin (via this SQL editor, or the service-role key) can set.
--
-- Run this whole file in one go in the Supabase SQL Editor, in "without RLS" mode.

-- === Part 1: rewrite policies to trust app_metadata instead of user_metadata ===

drop policy "Staff can delete submissions" on public.contact_submissions;
create policy "Staff can delete submissions" on public.contact_submissions
  for delete
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can read submissions" on public.contact_submissions;
create policy "Staff can read submissions" on public.contact_submissions
  for select
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can update submissions" on public.contact_submissions;
create policy "Staff can update submissions" on public.contact_submissions
  for update
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can delete lessons" on public.lessons;
create policy "Staff can delete lessons" on public.lessons
  for delete
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can insert lessons" on public.lessons;
create policy "Staff can insert lessons" on public.lessons
  for insert
  with check (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can update lessons" on public.lessons;
create policy "Staff can update lessons" on public.lessons
  for update
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can delete modules" on public.modules;
create policy "Staff can delete modules" on public.modules
  for delete
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can insert modules" on public.modules;
create policy "Staff can insert modules" on public.modules
  for insert
  with check (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can update modules" on public.modules;
create policy "Staff can update modules" on public.modules
  for update
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can delete questions" on public.practice_questions;
create policy "Staff can delete questions" on public.practice_questions
  for delete
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can insert questions" on public.practice_questions;
create policy "Staff can insert questions" on public.practice_questions
  for insert
  with check (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can update questions" on public.practice_questions;
create policy "Staff can update questions" on public.practice_questions
  for update
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

drop policy "Staff can read all profiles" on public.profiles;
create policy "Staff can read all profiles" on public.profiles
  for select
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'staff'::text);

-- === Part 2: stop a user from setting their own profiles.role, even ===
-- === though "Users can update own profile" doesn't restrict columns ===

create or replace function public.prevent_role_self_escalation()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if new.role is distinct from old.role and auth.role() <> 'service_role' then
    new.role := old.role;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_prevent_role_self_escalation on public.profiles;
create trigger trg_prevent_role_self_escalation
  before update on public.profiles
  for each row
  execute function public.prevent_role_self_escalation();

-- === Part 3: bootstrap the first real staff accounts ===
-- After this, self-service signup no longer offers a staff option, and
-- app_metadata can't be set by users themselves — so these two accounts
-- need to be promoted directly here to start with. Anyone else can be
-- promoted afterward from the Enrolled Students page (staff-only) once
-- the set-staff-role Edge Function is deployed.

update auth.users
set raw_app_meta_data = coalesce(raw_app_meta_data, '{}'::jsonb) || '{"role": "staff"}'::jsonb
where email in ('damshane73@gmail.com', '9999winningteam@gmail.com');

update public.profiles
set role = 'staff'
where email in ('damshane73@gmail.com', '9999winningteam@gmail.com');
