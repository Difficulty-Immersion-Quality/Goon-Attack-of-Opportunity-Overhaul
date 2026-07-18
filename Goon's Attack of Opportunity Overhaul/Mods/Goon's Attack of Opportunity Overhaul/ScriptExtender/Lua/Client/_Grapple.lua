local DEBUG = false

local function IsGrapplingFrameworkLoaded()
    return Ext.Mod.IsModLoaded("239127c3-1efe-493d-85d3-8518c8d8819b") -- Dr. Kekyll's Grappling Framework
end

local function ApplyGrappleBoost()
    if not IsGrapplingFrameworkLoaded() then
        if DEBUG then
            Ext.Utils.Print("GrappleAoOBoost: Grappling Framework not loaded, skipping")
        end
        return
    end

    local stat = Ext.Stats.Get("AttackOfOpportunity")
    if not stat then
        Ext.Utils.PrintWarning("GrappleAoOBoost: AttackOfOpportunity passive not found")
        return
    end

    -- Guard against appending twice (e.g. if StatsLoaded ever fires more than
    -- once, or the boost is already present in the .txt for some reason).
    if stat.Boosts:find("UnlockInterrupt(Goon_Interrupt_AttackOfOpportunity_Grapple)", 1, true) then
        if DEBUG then
            Ext.Utils.Print("GrappleAoOBoost: Boost already present, skipping")
        end
        return
    end

    if DEBUG then
        Ext.Utils.Print("GrappleAoOBoost: Boosts before=" .. stat.Boosts)
    end

    stat.Boosts = stat.Boosts .. ";" .. "UnlockInterrupt(Goon_Interrupt_AttackOfOpportunity_Grapple)"
    Ext.Stats.Sync("AttackOfOpportunity")

    if DEBUG then
        Ext.Utils.Print("GrappleAoOBoost: Boosts after=" .. stat.Boosts)
    end
end

Ext.Events.StatsLoaded:Subscribe(ApplyGrappleBoost)