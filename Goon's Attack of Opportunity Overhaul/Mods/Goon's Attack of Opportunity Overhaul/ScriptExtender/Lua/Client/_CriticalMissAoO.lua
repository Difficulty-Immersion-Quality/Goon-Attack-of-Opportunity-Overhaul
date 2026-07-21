local CM = Ext.Require("Shared/CriticalMiss.lua")

Ext.Events.StatsLoaded:Subscribe(function()
	CM.Apply(CM.IsFeatureEnabled())
end)
