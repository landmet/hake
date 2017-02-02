local SkyWRTH = {}

SkyWRTH.optionEnable = Menu.AddOption({ "Hero Specific","Skywrath Mage"}, "Enabled", "")
SkyWRTH.optionKey = Menu.AddKeyOption({ "Hero Specific","Skywrath Mage"}, "Combo Key", Enum.ButtonCode.KEY_SPACE)


function SkyWRTH.OnUpdate()
    if not Menu.IsEnabled(SkyWRTH.optionEnable) then return true end
    AbilityCombo()
end

function AbilityCombo()

if not Menu.IsKeyDown(SkyWRTH.optionKey) then return true end

local myHero = Heroes.GetLocal()
if NPC.GetUnitName(myHero) ~= "npc_dota_hero_skywrath_mage" then return true end

local arcBolt = NPC.GetAbilityByIndex(myHero, 0)
local conShot = NPC.GetAbilityByIndex(myHero, 1)
local ancSeal = NPC.GetAbilityByIndex(myHero, 2)
local mFlare = NPC.GetAbilityByIndex(myHero, 3)

local veil = NPC.GetItem( myHero, "item_veil_of_discord", true)
local hex = NPC.GetItem( myHero, "item_sheepstick", true)
local bloth = NPC.GetItem( myHero, "item_bloodthorn", true)
local eblade = NPC.GetItem( myHero, "item_ethereal_blade", true)
local orchid = NPC.GetItem( myHero, "item_orchid", true)
local refresh = NPC.GetItem( myHero, "item_refresher", true)



local mousePos = Input.GetWorldCursorPos()
local myMana = NPC.GetMana(myHero)

local hero = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
if veil ~= nil and Ability.IsCastable(veil, myMana) then 
    Ability.CastPosition(veil, mousePos)
else
if hex ~= nil and Ability.IsCastable(hex, myMana) then 
    Ability.CastTarget(hex, hero)
    else
if bloth ~= nil and Ability.IsCastable(bloth, myMana) then 
    Ability.CastTarget(bloth, hero)
    else
if eblade ~= nil and Ability.IsCastable(eblade, myMana) then 
    Ability.CastTarget(eblade, hero)
    else
if orchid ~= nil and Ability.IsCastable(orchid, myMana) then 
    Ability.CastTarget(orchid, hero)
    else
if Ability.IsReady(ancSeal) and NPC.GetMana(myHero) > Ability.GetManaCost(ancSeal) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(ancSeal) - 10) then
					Ability.CastTarget(ancSeal, hero)
    else		
if Ability.IsReady(arcBolt) and NPC.GetMana(myHero) > Ability.GetManaCost(arcBolt) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(arcBolt) - 10) then
					Ability.CastTarget(arcBolt, hero)
    else
if Ability.IsReady(conShot) and NPC.GetMana(myHero) > Ability.GetManaCost(conShot) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(conShot) - 10) then
					Ability.CastNoTarget(conShot)
    else                  
if Ability.IsReady(mFlare) and NPC.GetMana(myHero) > Ability.GetManaCost(mFlare) and NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(mFlare) - 10) then
                    Ability.CastPosition(mFlare, mousePos)
   else
if refresh ~= nil and Ability.IsCastable(refresh, myMana) then 
    Ability.CastNoTarget(refresh)


end
end
end
end
end
end
end
end
end
end
end
return SkyWRTH