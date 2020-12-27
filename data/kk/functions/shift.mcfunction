# Called by
# - main

execute at @s[x=-6.5,y=103,z=-6.5,dx=16,dy=11,dz=16,scores={mode=-1..},tag=!shift] run setblock ~ ~-1 ~ air
execute as @s[x=-6.5,y=103,z=-6.5,dx=16,dy=11,dz=16,scores={mode=-1..},tag=!shift] at @s run teleport ~ ~-1 ~
tag @s add shift
scoreboard players remove @s shift 1
