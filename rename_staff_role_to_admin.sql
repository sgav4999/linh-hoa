-- Renames the "staff" role to "admin" everywhere it's stored or checked.
-- Run this whole file in one go in the Supabase SQL Editor, in "without RLS" mode.
-- It runs as one transaction: if anything fails (e.g. a check constraint
-- on profiles.role you have that I don't know about), everything rolls
-- back cleanly and nothing is left half-changed — just paste back the error.

-- === Part 1: re-point the 13 policies at 'admin' instead of 'staff' ===

drop policy "Staff can delete submissions" on public.contact_submissions;
create policy "Admin can delete submissions" on public.contact_submissions
  for delete
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can read submissions" on public.contact_submissions;
create policy "Admin can read submissions" on public.contact_submissions
  for select
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can update submissions" on public.contact_submissions;
create policy "Admin can update submissions" on public.contact_submissions
  for update
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can delete lessons" on public.lessons;
create policy "Admin can delete lessons" on public.lessons
  for delete
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can insert lessons" on public.lessons;
create policy "Admin can insert lessons" on public.lessons
  for insert
  with check (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can update lessons" on public.lessons;
create policy "Admin can update lessons" on public.lessons
  for update
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can delete modules" on public.modules;
create policy "Admin can delete modules" on public.modules
  for delete
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can insert modules" on public.modules;
create policy "Admin can insert modules" on public.modules
  for insert
  with check (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can update modules" on public.modules;
create policy "Admin can update modules" on public.modules
  for update
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can delete questions" on public.practice_questions;
create policy "Admin can delete questions" on public.practice_questions
  for delete
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can insert questions" on public.practice_questions;
create policy "Admin can insert questions" on public.practice_questions
  for insert
  with check (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can update questions" on public.practice_questions;
create policy "Admin can update questions" on public.practice_questions
  for update
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

drop policy "Staff can read all profiles" on public.profiles;
create policy "Admin can read all profiles" on public.profiles
  for select
  using (((auth.jwt() -> 'app_metadata'::text) ->> 'role'::text) = 'admin'::text);

-- === Part 2: migrate the two accounts already promoted under the old name ===

update auth.users
set raw_app_meta_data = raw_app_meta_data || '{"role": "admin"}'::jsonb
where email in ('damshane73@gmail.com', '9999winningteam@gmail.com')
  and (raw_app_meta_data ->> 'role') = 'staff';

update public.profiles
set role = 'admin'
where email in ('damshane73@gmail.com', '9999winningteam@gmail.com')
  and role = 'staff';
