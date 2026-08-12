local U = Ext.Require("Shared/Utility.lua")
local AoO = Ext.Require("Shared/AttackOfOpportunity.lua")
local PAM = Ext.Require("Shared/PolearmMaster.lua")

local GRAPPLING_FRAMEWORK = "239127c3-1efe-493d-85d3-8518c8d8819b" -- Dr. Kekyll's Grappling Framework

local function ApplyGrappleBoost()
	if not Ext.Mod.IsModLoaded(GRAPPLING_FRAMEWORK) then
		U.Debug("Grappling Framework not loaded, skipping")
		return
	end

	local stat = Ext.Stats.Get("AttackOfOpportunity")
	if not stat then
		U.Debug("AttackOfOpportunity passive not found")
		return
	end

	stat.Boosts = stat.Boosts .. ";UnlockInterrupt(Goon_Interrupt_AttackOfOpportunity_Grapple)"
end

Ext.Events.StatsLoaded:Subscribe(function()
	AoO.Apply(AoO.IsFeatureEnabled())
	PAM.Apply(PAM.GetSelectedPolearmMasterRuleset())
	ApplyGrappleBoost()
end)
