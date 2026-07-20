local C = Ext.Require("Shared/Constants.lua")
local U = Ext.Require("Shared/Utility.lua")

local M = {}

M.MCM_SETTING_ID = "Goon_CriticalMissAoO_Enabled"

--- Enabled by default if MCM isn't loaded, anti-MCMers get bent.
function M.IsFeatureEnabled()
	if MCM == nil then return true end
	return MCM.Get(M.MCM_SETTING_ID)
end

function M.Apply(enabled)
	U.Debug("Apply(%s)", tostring(enabled))

	for statName, target in pairs(C.PatchTargets) do
		local stat = Ext.Stats.Get(statName)

		if not stat then
			U.Debug("Stat entry not found: %s", statName)
		else
			for fieldName, spec in pairs(target.Fields) do
				stat[fieldName] = enabled and spec.on or spec.off
			end
			-- Stats only need to be synced post StatsLoaded and from the server
			if Ext.IsServer() then stat:Sync() end
		end
	end
end

return M
