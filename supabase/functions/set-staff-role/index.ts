// Promotes or demotes a user's admin role. Deployed as a Supabase Edge
// Function so the write to app_metadata always happens with the service
// role key — a value the browser never has access to. This is the only
// legitimate way to grant admin access; nothing in the client can do it.
//
// Only an already-admin caller (verified from their own session token,
// not from anything the request body claims) may call this.
//
// The deployed function name ("set-staff-role") is unchanged from when
// the role was called "staff" — it's just an internal endpoint slug,
// never shown anywhere, so there was no reason to redeploy under a new
// name. Only the role value below ("admin") actually matters.

import { createClient } from "https://esm.sh/@supabase/supabase-js@2.45.4";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

function json(body, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const authHeader = req.headers.get("Authorization") || "";
    const callerToken = authHeader.replace(/^Bearer\s+/i, "");
    if (!callerToken) {
      return json({ error: "Missing Authorization header" }, 401);
    }

    const adminClient = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    // Verify the caller from their own token — never trust a role claim
    // sent in the request body.
    const { data: callerData, error: callerErr } = await adminClient.auth.getUser(callerToken);
    if (callerErr || !callerData || !callerData.user) {
      return json({ error: "Invalid session" }, 401);
    }
    const caller = callerData.user;
    const callerRole = caller.app_metadata && caller.app_metadata.role;
    if (callerRole !== "admin") {
      return json({ error: "Only admins can change roles" }, 403);
    }

    const { email, action } = await req.json();
    if (!email || !["promote", "demote"].includes(action)) {
      return json({ error: "email and action ('promote'|'demote') are required" }, 400);
    }

    const { data: profile, error: profileErr } = await adminClient
      .from("profiles")
      .select("id")
      .eq("email", email)
      .single();
    if (profileErr || !profile) {
      return json({ error: "No account found with that email" }, 404);
    }

    if (action === "demote" && profile.id === caller.id) {
      return json({ error: "You can't demote yourself. Have another admin do it." }, 400);
    }

    const newRole = action === "promote" ? "admin" : "student";

    // Merge into the target's existing app_metadata rather than replacing
    // it outright, so we don't clobber fields Supabase manages itself
    // (like OAuth provider info).
    const { data: targetData, error: getTargetErr } = await adminClient.auth.admin.getUserById(profile.id);
    if (getTargetErr || !targetData || !targetData.user) {
      return json({ error: "Could not load that account" }, 404);
    }
    const mergedAppMetadata = { ...(targetData.user.app_metadata || {}), role: newRole };

    const { error: updateAuthErr } = await adminClient.auth.admin.updateUserById(profile.id, {
      app_metadata: mergedAppMetadata,
    });
    if (updateAuthErr) {
      return json({ error: updateAuthErr.message }, 500);
    }

    const { error: updateProfileErr } = await adminClient
      .from("profiles")
      .update({ role: newRole })
      .eq("id", profile.id);
    if (updateProfileErr) {
      return json({ error: updateProfileErr.message }, 500);
    }

    return json({ success: true, role: newRole });
  } catch (e) {
    return json({ error: (e && e.message) || "Unexpected error" }, 500);
  }
});
