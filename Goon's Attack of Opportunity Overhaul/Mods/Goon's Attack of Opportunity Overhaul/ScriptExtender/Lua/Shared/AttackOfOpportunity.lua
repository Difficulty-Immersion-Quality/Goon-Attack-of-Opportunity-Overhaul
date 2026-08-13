local U = Ext.Require("Shared/Utility.lua")

local M = {}

M.MCM_SETTING_ID = "Goon_CriticalMissAoO_Enabled"

-- Extracted to be available both client and server-side
-- Need the entries pre-patching to restore with the toggle
-- Needs a pass to double check

local PatchTargets = {
	-- Passive
	AttackOfOpportunity = {
		Fields = {
			Description = {
				-- Automatically attack an enemy when they move out of your reach or roll a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "h499b92e3gd78cg4436gb1f9g8ee659fc4e93;1",
				off = "hcc220960g681dg4db6g8cbag2c055807eed3;7",
			},
		},
	},

	-- Interrupts
	Goon_Interrupt_AttackOfOpportunity = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				-- Attack an enemy moving out of your reach.
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "Goon_AttackOfOpportunityConditions(false) or (Goon_AttackOfOpportunityConditions(true) and Goon_InAttackRange())",
				off = "Goon_AttackOfOpportunityConditions(false)",
			},
		},
	},

	Interrupt_WarCaster = {
		Fields = {
			Description = {
				-- Cast &lt;LSTag Type="Spell" Tooltip="Target_ShockingGrasp"&gt;Shocking Grasp&lt;/LSTag&gt; enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "had3e80e7g81f6g4fedg9938g5dd0a0f4be2e;1",
				-- Cast &lt;LSTag Type="Spell" Tooltip="Target_ShockingGrasp"&gt;Shocking Grasp&lt;/LSTag&gt; at an enemy that moves out of your reach.
				off = "hb1a5b720ga19fg4c9eg9d2dg940bc896c299;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "(Goon_AttackOfOpportunityConditions(false) or (Goon_AttackOfOpportunityConditions(true) and Goon_InAttackRange())) and not HasSpellCastBlocked(context.Observer)",
				off = "Goon_AttackOfOpportunityConditions(false) and not HasSpellCastBlocked(context.Observer)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Mainhand = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				-- Attack an enemy moving out of your reach.
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "Goon_AttackOfOpportunityConditions(false) or (Goon_AttackOfOpportunityConditions(true) and Goon_InAttackRange(false,false))",
				off = "Goon_AttackOfOpportunityConditions(false)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Offhand = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				-- Attack an enemy moving out of your reach.
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "Goon_AttackOfOpportunityConditions(false) or (Goon_AttackOfOpportunityConditions(true) and Goon_InAttackRange(false,true))",
				off = "Goon_AttackOfOpportunityConditions(false)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_RangedMainhand = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				-- Attack an enemy moving out of your reach.
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "Goon_AttackOfOpportunityConditions(false) or (Goon_AttackOfOpportunityConditions(true) and Goon_InAttackRange(true,false))",
				off = "Goon_AttackOfOpportunityConditions(false) and Goon_InAttackRange(true,false)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_RangedOffhand = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				-- Attack an enemy moving out of your reach.
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "Goon_AttackOfOpportunityConditions(false) or (Goon_AttackOfOpportunityConditions(true) and Goon_InAttackRange(true,true))",
				off = "Goon_AttackOfOpportunityConditions(false) and Goon_InAttackRange(true,true)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Unarmed = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				-- Attack an enemy moving out of your reach.
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "Goon_AttackOfOpportunityConditions(false) or (Goon_AttackOfOpportunityConditions(true) and Goon_InAttackRange())",
				off = "Goon_AttackOfOpportunityConditions(false)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Shove = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				-- Attack an enemy moving out of your reach.
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "(Goon_AttackOfOpportunityConditions(false) or (Goon_AttackOfOpportunityConditions(true) and Goon_InAttackRange())) and (not Self() and CanShoveWeight() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not (not Player(context.Source) and Combat(context.Source) and Character() and not (Enemy() or HasStatus('SG_Unconscious'))) and not Tagged('CANT_SHOVE_THROW'))",
				off = "Goon_AttackOfOpportunityConditions(false) and (not Self() and CanShoveWeight() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not (not Player(context.Source) and Combat(context.Source) and Character() and not (Enemy() or HasStatus('SG_Unconscious'))) and not Tagged('CANT_SHOVE_THROW'))",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Grapple = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				-- Attack an enemy moving out of your reach.
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "(Goon_AttackOfOpportunityConditions(false) or (Goon_AttackOfOpportunityConditions(true) and Goon_InAttackRange())) and (not Self() and CanGrappleTargetSize() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not HasStatus('SG_Unconscious') and not Tagged('CANT_SHOVE_THROW'))",
				off = "Goon_AttackOfOpportunityConditions(false) and (not Self() and CanGrappleTargetSize() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not HasStatus('SG_Unconscious') and not Tagged('CANT_SHOVE_THROW'))",
			},
		},
	},
}

--- Enabled by default if MCM isn't loaded, anti-MCMers get bent.
function M.IsFeatureEnabled()
	if MCM == nil then return true end
	return MCM.Get(M.MCM_SETTING_ID)
end

function M.Apply(enabled)
	U.Debug("Apply(%s)", tostring(enabled))

	for statName, target in pairs(PatchTargets) do
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
