-----------------------------------------
-- ID: 4487
-- Item: colored_egg
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 20
-- Magic 20
-- Attack 3
-- Ranged Attack 2
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4487);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_ATT, 3);
    target:addMod(MOD_RATT, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_ATT, 3);
    target:delMod(MOD_RATT, 2);
end;
