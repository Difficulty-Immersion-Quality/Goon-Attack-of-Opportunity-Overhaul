-- Extracted to be available both client and server-side
-- Need the entries pre-patching to restore with the toggle
-- Needs a pass to double check

local PatchTargets = {
	AttackOfOpportunity = {
		Fields = {
			Description = {
				-- Automatically attack an enemy when they move out of your reach or roll a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "h499b92e3gd78cg4436gb1f9g8ee659fc4e93;1",
				off = "hcc220960g681dg4db6g8cbag2c055807eed3;7",
			},
		},
	},

	Interrupt_WarCaster = {
		Fields = {
			Description = {
				-- Cast &lt;LSTag Type="Spell" Tooltip="Target_ShockingGrasp"&gt;Shocking Grasp&lt;/LSTag&gt; enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "had3e80e7g81f6g4fedg9938g5dd0a0f4be2e;1",
				off = "hb1a5b720ga19fg4c9eg9d2dg940bc896c299;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "((Goon_AttackOfOpportunityConditions() and not IsAttack()) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(false,true,context.Source))) and not HasSpellCastBlocked(context.Observer)",
				off = "Goon_AttackOfOpportunityConditions() and not HasSpellCastBlocked(context.Observer)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Mainhand = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "(Goon_AttackOfOpportunityConditions() or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(false,true,context.Source))) and Goon_HasWeaponTypeInSlot(false,false,context.Observer)",
				off = "Goon_AttackOfOpportunityConditions() and Goon_HasWeaponTypeInSlot(false,false,context.Observer)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Offhand = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "(Goon_AttackOfOpportunityConditions() or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(true,true,context.Source))) and Goon_HasWeaponTypeInSlot(false,true,context.Observer)",
				off = "Goon_AttackOfOpportunityConditions() and Goon_HasWeaponTypeInSlot(false,true,context.Observer)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_RangedMainhand = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "((Goon_AttackOfOpportunityConditions() and Goon_InRangedAttackRange(false,true)) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InRangedAttackRange(false,true,context.Source))) and Goon_HasWeaponTypeInSlot(true,false,context.Observer)",
				off = "Goon_AttackOfOpportunityConditions() and Goon_InRangedAttackRange(false,true) and Goon_HasWeaponTypeInSlot(true,false,context.Observer)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_RangedOffhand = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "((Goon_AttackOfOpportunityConditions() and Goon_InRangedAttackRange(true,true)) or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InRangedAttackRange(true,true,context.Source))) and Goon_HasWeaponTypeInSlot(true,true,context.Observer)",
				off = "Goon_AttackOfOpportunityConditions() and Goon_InRangedAttackRange(true,true) and Goon_HasWeaponTypeInSlot(true,true,context.Observer)",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Unarmed = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "Goon_AttackOfOpportunityConditions() or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(nil,true,context.Source))",
				off = "Goon_AttackOfOpportunityConditions()",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Shove = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "(Goon_AttackOfOpportunityConditions() or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(nil,true,context.Source))) and (not Self() and CanShoveWeight() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not HasStatus('SG_Unconscious') and not Tagged('CANT_SHOVE_THROW'))",
				off = "Goon_AttackOfOpportunityConditions() and (not Self() and CanShoveWeight() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not (not Player(context.Source) and Combat(context.Source) and Character() and not (Enemy() or HasStatus('SG_Unconscious'))) and not Tagged('CANT_SHOVE_THROW'))",
			},
		},
	},

	Goon_Interrupt_AttackOfOpportunity_Grapple = {
		Fields = {
			Description = {
				-- Attack an enemy that moves out of your reach or rolls a &lt;LSTag Tooltip="CriticalMiss"&gt;Critical Miss&lt;/LSTag&gt; when attacking you.
				on = "hc3131359g5a0ag4c0agbe13gb6b30826c824;1",
				off = "h3e87bdfcg0860g468eg9a8eg1bd073914fee;1",
			},
			InterruptContext = {
				on = { "OnLeaveAttackRange", "OnCastHit" },
				off = { "OnLeaveAttackRange" },
			},
			Conditions = {
				on = "(Goon_AttackOfOpportunityConditions() or (Goon_AttackOfOpportunityConditions_CriticalMiss() and Goon_InMeleeAttackRange(nil,true,context.Source))) and (not Self() and CanGrappleTargetSize() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not HasStatus('SG_Unconscious') and not Tagged('CANT_SHOVE_THROW'))",
				off = "Goon_AttackOfOpportunityConditions() and (not Self() and CanGrappleTargetSize() and IsMovable() and not Grounded() and not Tagged('GASEOUS_FORM') and not HasStatus('SG_Unconscious') and not Tagged('CANT_SHOVE_THROW'))",
			},
		},
	},
}

return { PatchTargets = PatchTargets }
