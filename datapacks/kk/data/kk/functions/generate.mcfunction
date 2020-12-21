# Called by
# - start/init
# - first_click

# Ensure no duplicate bombs
execute as @e[type=area_effect_cloud,tag=Mine] at @s positioned ~-0.5 ~-0.5 ~-0.5 store result score @s boolBool if entity @e[dx=0.5,dy=0.5,dz=0.5]
execute at @e[x=-22,y=100,z=-39,dx=45,dy=15,dz=30,scores={boolBool=..1}] run setblock ~ ~-1 ~ air

spreadplayers 0 -72 2 22 false @e[x=-21.5,y=100,z=-38.5,dx=45,dy=15,dz=30,scores={boolBool=2..}]
execute at @e[x=-22,y=100,z=-39,dx=45,dy=15,dz=30] run setblock ~ ~-1 ~ glass

# REEEE if still duplicate bombs
execute as @e[type=area_effect_cloud,tag=Mine] at @s positioned ~-0.5 ~-0.5 ~-0.5 store result score @s boolBool if entity @e[dx=0.5,dy=0.5,dz=0.5]
execute as @e[x=-22,y=100,z=-39,dx=45,dy=15,dz=30,scores={boolBool=2..}] at @s run tellraw @p ["There was an error while generating the board. Please start the game again"]

# Spawn board
fill -8 100 -8 8 116 8 white_wool hollow
setblock -9 68 -27 redstone_block
setblock -9 68 -9 redstone_block

# Tp the bombs
execute as @e[x=-22,y=100,z=-79,dx=14,dy=1,dz=14] at @s run teleport ~15 86 ~72
execute as @e[x=-22,y=100,z=-64,dx=14,dy=1,dz=14] at @s run teleport ~15 70 ~57
execute as @e[x=-7,y=100,z=-64,dx=14,dy=15,dz=14] at @s run teleport 8 ~-30 ~57
execute as @e[x=8,y=100,z=-79,dx=14,dy=15,dz=14] at @s run teleport -8 ~-30 ~72
execute as @e[x=-7,y=100,z=-79,dx=14,dy=15,dz=14] at @s run teleport ~ ~-30 -8
execute as @e[x=8,y=100,z=-64,dx=14,dy=15,dz=14] at @s run teleport ~-15 ~-30 8
execute at @e[type=area_effect_cloud,tag=Mine] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ brown_wool
execute as @e[type=area_effect_cloud,tag=Mine] at @s run teleport ~ ~0.5 ~

# Reset and prepare stuff
execute as @e[name=Carl,tag=pig] at @s run teleport -8 ~ ~
execute as @e[name=Bob,tag=pig] at @s run teleport ~ 70.0 ~

tag @p remove stop
# kk:generate_r
summon area_effect_cloud 0.5 48.5 -0.5 {Age:-2,Particle:"block air",Tags:["delay2"]}
