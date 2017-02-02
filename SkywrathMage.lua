local SkyWRTH = {}

SkyWRTH.optionEnable = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Enabled", "Supported Items: veil, hex, eblade, orchid, refresher, bloodthorn. Supported Abilitys: All")
SkyWRTH.optionKey = Menu.AddKeyOption({ "Hero Specific","Skywrath Mage"}, "Fist Chain Key", Enum.ButtonCode.KEY_P)
SkyWRTH.optionEnableVeil = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Item Veil Of Discord", "")
SkyWRTH.optionEnableHex = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Item Scythe Of Vyse", "")
SkyWRTH.optionEnableBloth = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Item Bloodthorn ", "")
SkyWRTH.optionEnableEblade = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Item Ethereal Blade", "")
SkyWRTH.optionEnableOrchid = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Item Orchid Malevolence", "")
SkyWRTH.optionEnableRefresher = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Item Refresher Orb", "")
SkyWRTH.optionEnableRoA = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Item Rod Of Atos", "")

SkyWRTH.optionEnableArcBolt = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Ability Arcane Bolt", "")
SkyWRTH.optionEnableConShot = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Ability Concussive Shot", "")
SkyWRTH.optionEnableAncSeal = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Ability Ancient Seal", "")
SkyWRTH.optionEnableMFlare = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Use Ability Mystic Flare", "")

function SkyWRTH.OnUpdate()
    if not Menu.IsEnabled(SkyWRTH.optionEnable) then return true end

    SkyWRTH.ITABcombo()
end

function SkyWRTH.ITABcombo()
    if not Menu.IsKeyDown(SkyWRTH.optionKey) then return end

    local myHero = Heroes.GetLocal()

    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_skywrath_mage" then return end

    local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)

    if not hero then return end

    local heroPos = NPC.GetAbsOrigin(hero)

    local arcBolt = NPC.GetAbilityByIndex(myHero, 0)
    local conShot = NPC.GetAbilityByIndex(myHero, 1)
    local ancSeal = NPC.GetAbilityByIndex(myHero, 2)
    local mFlare = NPC.GetAbilityByIndex(myHero, 3)

    local veil = NPC.GetItem(myHero, "item_veil_of_discord", true)
    local hex = NPC.GetItem(myHero, "item_sheepstick", true)
    local bloth = NPC.GetItem(myHero, "item_bloodthorn", true)
    local eblade = NPC.GetItem(myHero, "item_ethereal_blade", true)
    local orchid = NPC.GetItem(myHero, "item_orchid", true)
    local refresh = NPC.GetItem(myHero, "item_refresher", true)
    local RoA = NPC.GetItem(myHero, "item_rod_of_atos", true)

    local mousePos = Input.GetWorldCursorPos()
    local myMana = NPC.GetMana(myHero)

    if Menu.IsEnabled(SkyWRTH.optionEnableVeil) then
    if veil and Ability.IsCastable(veil, myMana) then Ability.CastPosition(veil, heroPos); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableRoA) then
    if RoA and Ability.IsCastable(RoA, myMana) then Ability.CastTarget(RoA, hero); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableHex) then
    if hex and Ability.IsCastable(hex, myMana) then Ability.CastTarget(hex, hero); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableBloth) then
    if bloth and Ability.IsCastable(bloth, myMana) then Ability.CastTarget(bloth, hero); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableEblade) then
    if eblade and Ability.IsCastable(eblade, myMana) then Ability.CastTarget(eblade, hero); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableOrchid) then
    if orchid and Ability.IsCastable(orchid, myMana) then Ability.CastTarget(orchid, hero); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableAncSeal) then
    if Ability.IsCastable(ancSeal, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(ancSeal) - 10) then Ability.CastTarget(ancSeal, hero); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableArcBolt) then
    if Ability.IsCastable(arcBolt, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(arcBolt) - 10) then Ability.CastTarget(arcBolt, hero); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableConShot) then
    if Ability.IsCastable(conShot, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(conShot) - 10) then Ability.CastNoTarget(conShot); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableMFlare) then
    if Ability.IsCastable(mFlare, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(mFlare) - 10) then Ability.CastPosition(mFlare, heroPos); return end end

    if Menu.IsEnabled(SkyWRTH.optionEnableRefresher) then
    if refresh and Ability.IsCastable(refresh, myMana) then Ability.CastNoTarget(refresh); return end end
end

return SkyWRTH
