local AoO = Ext.Require("Shared/AttackOfOpportunity.lua")
local PAM = Ext.Require("Shared/PolearmMaster.lua")

if MCM then
	Ext.ModEvents.BG3MCM['MCM_Setting_Saved']:Subscribe(function(payload)
		if not payload or payload.modUUID ~= ModuleUUID then return end

		if payload.settingId == AoO.MCM_SETTING_ID then
			AoO.Apply(payload.value)
		elseif payload.settingId == PAM.MCM_SETTING_ID then
			PAM.Apply(payload.value)
		end
	end)
end
