local CM = Ext.Require("Shared/CriticalMiss.lua")

if MCM then
	Ext.ModEvents.BG3MCM['MCM_Setting_Saved']:Subscribe(function(payload)
		if not payload or payload.modUUID ~= ModuleUUID or payload.settingId ~= CM.MCM_SETTING_ID then
			return
		end
		CM.Apply(payload.value)
	end)
end
