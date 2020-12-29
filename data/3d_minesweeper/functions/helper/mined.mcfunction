# Helper function for when a tile is mined
# Called by main

tag @s add mined

# setblock air without tagging the tile as mined causes main to run
#	mined.mcfunction in the next tick, creating a ripple out effect
execute if score @s bombCount matches 0 as @e[distance=..1.8,tag=tile,tag=!mined] at @s run setblock ~ ~ ~ air

execute if score @s bombCount matches 1.. run data merge entity @s {CustomNameVisible:1}
# kill tiles with nothing to display, cut down on lag
execute if score @s bombCount matches 0 run kill @s

execute at @s[tag=bomb] run function 3d_minesweeper:bomb_clicked
