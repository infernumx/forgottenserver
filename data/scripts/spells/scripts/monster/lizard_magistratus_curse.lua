local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local damage = math.random(74, 107)
	for _, target in ipairs(combat:getTargets(creature, variant)) do
		creature:addDamageCondition(target, CONDITION_CURSED, DAMAGELIST_EXPONENTIAL_DAMAGE, damage)
	end
	return true
end

spell:name("lizard magistratus curse")
spell:words("###13")
spell:needTarget(true)
spell:needLearn(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:register()
