local PolearmMasterRulesets = {
	Vanilla = {
		Interrupt_PolearmMaster = {
			Fields = {
				-- Prerequisite: Must be wielding a &lt;LSTag Tooltip="Reach"&gt;Reach Weapon&lt;/LSTag&gt;, or a quarterstaff or spear.
				ExtraDescription = "hb31b8b64gafaag40aegb292g1927043e0a76;1",
				Conditions = "Goon_AttackOfOpportunityConditions(false) and (HasWeaponProperty(WeaponProperties.Reach, GetActiveWeapon(context.Source)) or Tagged('WPN_STAVE', GetActiveWeapon(context.Source, true)) or Tagged('WPN_SPEAR', GetActiveWeapon(context.Source, true)))",
			},
		},
	},
	["2014"] = {
		Interrupt_PolearmMaster = {
			Fields = {
				-- Prerequisite: Must be wielding a glaive, halberd, pike, quarterstaff, or spear.
				ExtraDescription = "he426117fgdd96g4bb8gacd9gf49c9ae0a009;1",
				Conditions = "Goon_AttackOfOpportunityConditions(false) and (Tagged('WPN_STAVE', GetActiveWeapon(context.Source, true)) or Tagged('WPN_SPEAR', GetActiveWeapon(context.Source, true)) or Tagged('WPN_GLAIVE', GetActiveWeapon(context.Source, true)) or Tagged('WPN_HALBERD', GetActiveWeapon(context.Source, true)) or Tagged('WPN_PIKE', GetActiveWeapon(context.Source, true)))",
			},
		},
	},
	Homebrew = {
		Interrupt_PolearmMaster = {
			Fields = {
				-- Prerequisite: Must be wielding a glaive, halberd, pike, quarterstaff, spear, javelin, or trident.
				ExtraDescription = "haed9305bg94f5g4cdbga0b1gc7aedd23d3b7;1",
				Conditions = "Goon_AttackOfOpportunityConditions(false) and (Tagged('WPN_STAVE', GetActiveWeapon(context.Source, true)) or Tagged('WPN_SPEAR', GetActiveWeapon(context.Source, true)) or Tagged('WPN_GLAIVE', GetActiveWeapon(context.Source, true)) or Tagged('WPN_HALBERD', GetActiveWeapon(context.Source, true)) or Tagged('WPN_PIKE', GetActiveWeapon(context.Source, true)) or Tagged('WPN_JAVELIN', GetActiveWeapon(context.Source, true)) or Tagged('WPN_TRIDENT', GetActiveWeapon(context.Source, true)))",
			},
		},
	},
	["2024"] = {
		Interrupt_PolearmMaster = {
			Fields = {
				-- Prerequisite: Must be wielding a weapon with the &lt;LSTag Tooltip="Heavy"&gt;Heavy&lt;/LSTag&gt; and &lt;LSTag Tooltip="Reach"&gt;Reach&lt;/LSTag&gt; properties, or a quarterstaff or spear.
				ExtraDescription = "h9a61844cgdf31g471cg8877g5f16ecdec4d1;1",
				Conditions = "Goon_AttackOfOpportunityConditions(false) and ((HasWeaponProperty(WeaponProperties.Reach, GetActiveWeapon(context.Source)) and HasWeaponProperty(WeaponProperties.Heavy, GetActiveWeapon(context.Source))) or Tagged('WPN_STAVE', GetActiveWeapon(context.Source, true)) or Tagged('WPN_SPEAR', GetActiveWeapon(context.Source, true)))",
			},
		},
	},
	["2024_RAI"] = {
		Interrupt_PolearmMaster = {
			Fields = {
				-- Prerequisite: Must be wielding a weapon with the &lt;LSTag Tooltip="Heavy"&gt;Heavy&lt;/LSTag&gt; and &lt;LSTag Tooltip="Reach"&gt;Reach&lt;/LSTag&gt; properties, or a glaive, halberd, pike, quarterstaff, or spear.
				ExtraDescription = "h4db6d47fg3ae2g4f60g95cag00e738220b9a;1",
				Conditions = "Goon_AttackOfOpportunityConditions(false) and ((HasWeaponProperty(WeaponProperties.Reach, GetActiveWeapon(context.Source)) and HasWeaponProperty(WeaponProperties.Heavy, GetActiveWeapon(context.Source))) or Tagged('WPN_STAVE', GetActiveWeapon(context.Source, true)) or Tagged('WPN_SPEAR', GetActiveWeapon(context.Source, true)) or Tagged('WPN_GLAIVE', GetActiveWeapon(context.Source, true)) or Tagged('WPN_HALBERD', GetActiveWeapon(context.Source, true)) or Tagged('WPN_PIKE', GetActiveWeapon(context.Source, true)))",
			},
		},
	},
}

return PolearmMasterRulesets