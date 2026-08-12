local C = Ext.Require("Shared/Constants.lua")
local U = Ext.Require("Shared/Utility.lua")

local M = {}

M.MCM_SETTING_ID = "Goon_PolearmMasterConditions"

function M.GetSelectedPolearmMasterRuleset()
	if MCM == nil then return "2014" end
	return MCM.Get(M.MCM_SETTING_ID)
end

function M.Apply(polearmMasterRuleset)
	U.Debug("Apply(%s)", tostring(polearmMasterRuleset))

	local target = C.PolearmMaster[polearmMasterRuleset]
	if not target then
		U.Debug("Unknown polearmMasterRuleset: %s", tostring(polearmMasterRuleset))
		return
	end

	for statName, entry in pairs(target) do
		local stat = Ext.Stats.Get(statName)
		if not stat then
			U.Debug("Stat entry not found: %s", statName)
		else
			for fieldName, value in pairs(entry.Fields) do
				stat[fieldName] = value
			end
			-- Stats only need to be synced post StatsLoaded and from the server
			if Ext.IsServer() then stat:Sync() end
		end
	end
end

return M
