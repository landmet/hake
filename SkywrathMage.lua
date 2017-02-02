local SkyWRTH = {}

SkyWRTH.optionEnable = Menu.AddOption({"Hero Specific", "Skywrath Mage"}, "Combo", "Auto Ability, Item Usage")
SkyWRTH.optionKey = Menu.AddKeyOption({"Hero Specific", "Skywrath Mage"}, "Key", Enum.ButtonCode.KEY_SPACE)


function SkyWRTH.OnUpdate()

	if not Menu.IsEnabled(SkyWRTH.optionEnable) then return end
    if not Menu.IsKeyDown(SkyWRTH.optionKey) then return end

	local myHero = Heroes.GetLocal()
	if NPC.GetUnitName(myHero) ~= "npc_dota_hero_skywrath_mage" then return end
	local myTeam = Entity.GetTeamNum(myHero)

	local msPos = Input.GetWorldCursorPos()
	local myMana = NPC.GetMana(myHero)

	local arcBolt = NPC.GetAbilityByIndex(myHero, 0)
	local conShot = NPC.GetAbilityByIndex(myHero, 1)
    local ancSeal = NPC.GetAbilityByIndex(myHero, 2)
    local mysFlare = NPC.GetAbilityByIndex(myHero, 3)

	for i = 1, Heroes.Count() do
		local hero = Heroes.Get(i)
		local sameTeam = Entity.GetTeamNum(hero) == myTeam
		if not sameTeam and not NPC.IsDormant(hero) and Entity.GetHealth(hero) > 0 then
			local pos = NPC.GetAbsOrigin(hero)

			if Menu.IsKeyDown(SkyWRTH.optionKey) then
 
            local veil = NPC.GetItem( myHero, "item_veil_of_discord", true)
			local orchid = NPC.GetItem( myHero, "item_orchid", true)

            if NPC.IsEntityInRange(hero, myHero, Ability.GetCastRange(ancSeal, arcBolt, conShot, mysFlare, orchid, veil) - 10) then

			if	Ability.IsCastable( ancSeal or arcBolt or conShot or mysFlare or veil or orchid, myMana) then
				Ability.CastPosition(veil, msPos)
				Ability.CastTarget(orchid, hero)
				Ability.CastTarget(ancSeal, hero)
             	Ability.CastTarget(arcBolt, hero)
				Ability.CastNoTarget(conShot)
	    		Ability.CastPosition(mysFlare, msPos)
				

		else if Ability.IsCastable(conShot, myMana) then
				Ability.CastNoTarget(conShot)

		else if Ability.IsCastable(arcBolt, myMana) then
				Ability.CastTarget(arcBolt, hero)

	  	else if Ability.IsCastable(ancSeal, myMana) then
				Ability.CastTarget(ancSeal, hero)
				
		else if Ability.IsCastable(mysFlare, myMana) then
				Ability.CastPosition(mysFlare, msPos)
	  
	  
	   
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