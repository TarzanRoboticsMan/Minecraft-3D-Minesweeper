# Confirm board loading
# Called by main when user presses [Start] button from initialiation/load

scoreboard players set @s start 0
scoreboard players enable @s start
scoreboard players enable @s spawnboard

kill @e[tag=3dmsHelper]
execute as @e[tag=3dmsController] at @s if block ~ ~-1 ~ structure_block run clone ~ ~-2 ~ ~ ~-2 ~ ~ ~-1 ~

tp @e[tag=3dmsController] @s

clone ~ ~-1 ~ ~ ~-1 ~ ~ ~-2 ~
setblock ~ ~-1 ~ structure_block{mode:"SAVE", posY:1, sizeX:10, sizeY:10, sizeZ:10}
gamemode creative

execute align xyz run summon minecraft:area_effect_cloud ~5 ~10 ~5 {Radius:5,Duration:1200,Particle:"ash",Tags:["3dmsHelper"]}
execute align xyz run summon minecraft:area_effect_cloud ~5 ~ ~5 {Radius:5,Duration:1200,Particle:"mycelium",Tags:["3dmsHelper"]}
execute align xyz run particle mycelium ~5 ~5 ~5 2 2 2 1 10000 force

tellraw @s [{"text":"Spawn board in the highlighted area? "},{"text":"[Yes]","color":"green","hoverEvent":{"action":"show_text","value":"Spawn board"},"clickEvent":{"action":"run_command","value":"/trigger spawnboard"}},{"text":" "},{"text":"[No, try here]","color":"red","hoverEvent":{"action":"show_text","value":"Click to restart"},"clickEvent":{"action":"run_command","value":"/trigger start"}}]
