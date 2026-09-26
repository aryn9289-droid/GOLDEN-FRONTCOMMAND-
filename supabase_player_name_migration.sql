-- GOLDEN FRONT: COMMAND 3.1.0
ALTER TABLE public.online_country_claims
ADD COLUMN IF NOT EXISTS player_name TEXT;

DROP POLICY IF EXISTS online_country_claims_update_own ON public.online_country_claims;
GRANT UPDATE ON public.online_country_claims TO authenticated;
CREATE POLICY online_country_claims_update_own
ON public.online_country_claims
FOR UPDATE TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);
