# Called by
# - main
# - 14 48 -7

clear @p
tag @p remove items
tag @p remove click
execute at @e[type=armor_stand,name=Phill] if block ~ ~ ~ cyan_wool run tag @p add click

tag @p[tag=click] add generated
execute as @p[tag=click] run tag @p add items
execute as @p[tag=click] at @s run function kk:fill

execute as @p[tag=!click] run teleport @e[type=area_effect_cloud,tag=Mine] 0.5 253.0 0.5
execute as @p[scores={mode=0},tag=!click] run spreadplayers 0 -72 1.5 22 false @e[type=area_effect_cloud,tag=Mine,limit=170,sort=nearest]
execute as @p[scores={mode=1},tag=!click] run spreadplayers 0 -72 1.5 22 false @e[type=area_effect_cloud,tag=Mine,limit=210,sort=nearest]
execute as @p[scores={mode=2},tag=!click] run spreadplayers 0 -72 1.0 22 false @e[type=area_effect_cloud,tag=Mine,limit=280,sort=nearest]
execute as @p[tag=!click] run function kk:generate
# kk:first_click
execute as @p[tag=!click] run summon area_effect_cloud 15.5 48.5 -6.5 {Age:-4,Particle:"block air",Tags:["delay2"]}
