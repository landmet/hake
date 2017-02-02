local SkyWRTH = {}

SkyWRTH.optionEnable = Menu.AddOption({ "Hero Specific","Skywrath Mage" }, "Enabled", "")
SkyWRTH.optionKey = Menu.AddKeyOption({ "Hero Specific","Skywrath Mage" }, "Combo Key", Enum.ButtonCode.KEY_SPACE)

function SkyWRTH.OnUpdate()
    if not Menu.IsEnabled(SkyWRTH.optionEnable) then return true end

    SkyWRTH.AbilityCombo()
end

function SkyWRTH.AbilityCombo()
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

    local mousePos = Input.GetWorldCursorPos()
    local myMana = NPC.GetMana(myHero)

    if veil and Ability.IsCastable(veil, myMana) then Ability.CastPosition(veil, heroPos); return end
    if hex and Ability.IsCastable(hex, myMana) then Ability.CastTarget(hex, hero); return end
    if bloth and Ability.IsCastable(bloth, myMana) then Ability.CastTarget(bloth, hero); return end
    if eblade and Ability.IsCastable(eblade, myMana) then Ability.CastTarget(eblade, hero); return end
    if orchid and Ability.IsCastable(orchid, myMana) then Ability.CastTarget(orchid, hero); return end
    if Ability.IsCastable(ancSeal, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(ancSeal) - 10) then Ability.CastTarget(ancSeal, hero); return end
    if Ability.IsCastable(arcBolt, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(arcBolt) - 10) then Ability.CastTarget(arcBolt, hero); return end
    if Ability.IsCastable(conShot, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(conShot) - 10) then Ability.CastNoTarget(conShot); return end
    if Ability.IsCastable(mFlare, myMana) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(mFlare) - 10) then Ability.CastPosition(mFlare, heroPos); return end
    if refresh and Ability.IsCastable(refresh, myMana) then Ability.CastNoTarget(refresh); return end
end

return SkyWRTH
