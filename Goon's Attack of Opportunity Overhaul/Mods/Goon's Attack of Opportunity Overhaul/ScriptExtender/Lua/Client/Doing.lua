-- Client.lua
local AoO = Ext.Require("Shared/CriticalMiss.lua")
local PAM = Ext.Require("Shared/PolearmMaster.lua")

Ext.Events.StatsLoaded:Subscribe(function()
	AoO.Apply(AoO.IsFeatureEnabled())
	PAM.Apply(PAM.GetSelectedPolearmMasterRuleset())
end)