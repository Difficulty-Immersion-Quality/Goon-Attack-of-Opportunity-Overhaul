local MCM_SETTING_ID = "Goon_CriticalMissAoO_Enabled"
local DEBUG = false

local patchTargets = {
    AttackOfOpportunity = {
        Fields = {
            -- Automatically attack an enemy when they move out of your reach or roll a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
            Description = "h499b92e3gd78cg4436gb1f9g8ee659fc4e93;1",
        }
    },
    Interrupt_WarCaster = {
        Fields = {
            -- Cast &lt;LSTag Type="Spell" Tooltip="Target_ShockingGrasp"&gt;Shocking Grasp&lt;/LSTag&gt; enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
            Description = "had3e80e7g81f6g4fedg9938g5dd0a0f4be2e;1",
            InterruptContext = { "OnLeaveAttackRange", "OnCastHit" },
            Conditions = "((Goon_AttackOfOpportunityConditions() and not IsAttack()) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(false,true,context.Source))) and not HasSpellCastBlocked(context.Observer)",
        }
    },
    Goon_Interrupt_AttackOfOpportunity_Mainhand = {
        Fields = {
            -- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
            Description = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
            InterruptContext = { "OnLeaveAttackRange", "OnCastHit" },
            Conditions = "((Goon_AttackOfOpportunityConditions() and not IsAttack()) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(false,true,context.Source))) and Goon_HasWeaponTypeInSlot(false,false,context.Observer)",
        }
    },
    Goon_Interrupt_AttackOfOpportunity_Offhand = {
        Fields = {
            -- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
            Description = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
            InterruptContext = { "OnLeaveAttackRange", "OnCastHit" },
            Conditions = "((Goon_AttackOfOpportunityConditions() and not IsAttack()) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(true,true,context.Source))) and Goon_HasWeaponTypeInSlot(false,true,context.Observer)",
        }
    },
    Goon_Interrupt_AttackOfOpportunity_RangedMainhand = {
        Fields = {
            -- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
            Description = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
            InterruptContext = { "OnLeaveAttackRange", "OnCastHit" },
            Conditions = "((Goon_AttackOfOpportunityConditions() and Goon_InRangedAttackRange(false,true) and not IsAttack()) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InRangedAttackRange(false,true,context.Source))) and Goon_HasWeaponTypeInSlot(true,false,context.Observer)",
        }
    },
    Goon_Interrupt_AttackOfOpportunity_RangedOffhand = {
        Fields = {
            -- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
            Description = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
            InterruptContext = { "OnLeaveAttackRange", "OnCastHit" },
            Conditions = "((Goon_AttackOfOpportunityConditions() and Goon_InRangedAttackRange(true,true) and not IsAttack()) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InRangedAttackRange(true,true,context.Source))) and Goon_HasWeaponTypeInSlot(true,true,context.Observer)",
        }
    },
    Goon_Interrupt_AttackOfOpportunity_Unarmed = {
        Fields = {
            -- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
            Description = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
            InterruptContext = { "OnLeaveAttackRange", "OnCastHit" },
            Conditions = "(Goon_AttackOfOpportunityConditions() and not IsAttack()) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(nil,true,context.Source))",
        }
    },
    Goon_Interrupt_AttackOfOpportunity_Shove = {
        Fields = {
            -- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
            Description = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
            InterruptContext = { "OnLeaveAttackRange", "OnCastHit" },
            Conditions = "((Goon_AttackOfOpportunityConditions() and not IsAttack()) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(nil,true,context.Source))) and (not Self() and CanShoveWeight() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not HasStatus('SG_Unconscious') and not Tagged('CANT_SHOVE_THROW'))",
        }
    },
    Goon_Interrupt_AttackOfOpportunity_Grapple = {
        Fields = {
            -- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
            Description = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
            InterruptContext = { "OnLeaveAttackRange", "OnCastHit" },
            Conditions = "((Goon_AttackOfOpportunityConditions() and not IsAttack()) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(nil,true,context.Source))) and (not Self() and CanGrappleTargetSize() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not HasStatus('SG_Unconscious') and not Tagged('CANT_SHOVE_THROW'))",
        }
    },
}

--- Reads the current MCM toggle value. Enabled by default if MCM isn't loaded, anti-MCMers get bent.
local function IsFeatureEnabled()
    if MCM == nil then return true end
    return MCM.Get(MCM_SETTING_ID) == true
end

local function ApplyCriticalMissPatch()
    if not IsFeatureEnabled() then
        if DEBUG then
            Ext.Utils.Print("CriticalMissMCM: Feature disabled, skipping patch")
        end
        return
    end

    if DEBUG then
        Ext.Utils.Print("CriticalMissMCM: ApplyCriticalMissPatch called")
    end

    for statName, target in pairs(patchTargets) do
        local stat = Ext.Stats.Get(statName)

        if not stat then
            Ext.Utils.PrintWarning("CriticalMissMCM: stat entry not found: " .. statName)
        else
            for fieldName, value in pairs(target.Fields) do
                if DEBUG then
                    Ext.Utils.Print("CriticalMissMCM: " .. statName .. "." .. fieldName ..
                        " before=" .. tostring(stat[fieldName]))
                end

                stat[fieldName] = value

                if DEBUG then
                    Ext.Utils.Print("CriticalMissMCM: " .. statName .. "." .. fieldName ..
                        " after=" .. tostring(stat[fieldName]))
                end
            end

            Ext.Stats.Sync(statName)
        end
    end
end

local function OnStatsLoaded()
    ApplyCriticalMissPatch()
end
Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)

-- Only bother listening for MCM changes if MCM is actually loaded, if it's not then IsFeatureEnabled().
if MCM ~= nil then
        Ext.ModEvents.BG3MCM['MCM_Setting_Saved']:Subscribe(function(payload)
        -- Validate payload
        if not payload or payload.modUUID ~= ModuleUUID or not payload.settingId then
            return
        end
    end)
end
