# Called by
# - 1 48 -1

execute as @e[tag=pig] at @s positioned ~-2 ~-1 ~-2 store result score @s pigSearch if entity @e[dx=3,dy=2,dz=3,type=area_effect_cloud,tag=Mine]

execute at @e[scores={pigSearch=1},tag=pig] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ orange_wool
execute at @e[scores={pigSearch=2},tag=pig] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ magenta_wool
execute at @e[scores={pigSearch=3},tag=pig] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ light_blue_wool
execute at @e[scores={pigSearch=4},tag=pig] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ yellow_wool
execute at @e[scores={pigSearch=5},tag=pig] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ lime_wool
execute at @e[scores={pigSearch=6},tag=pig] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ pink_wool
execute at @e[scores={pigSearch=7},tag=pig] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ gray_wool
execute at @e[scores={pigSearch=8},tag=pig] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ light_gray_wool

execute as @e[tag=pig] at @s if block ~ ~1 ~ glass run tag @p add stop

execute as @e[name=Carl,tag=pig] at @s run teleport ~1 ~ ~
execute as @e[name=Bob,tag=pig] at @s run teleport ~ ~1 ~

execute as @p[tag=!stop] at @s run function kk:generate_r
