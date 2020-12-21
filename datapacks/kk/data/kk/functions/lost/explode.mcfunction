# Called by
# - lost/1
# - 2 49 -4
# - 2 50 -4
# - lost/2

execute as @p at @s run playsound entity.generic.explode master @s
execute at @p run particle explosion_emitter ~ ~ ~ 2 2 2 1 10 force
execute at @p run particle large_smoke ~-1 ~-1 ~-1 3 3 3 0 50 force
