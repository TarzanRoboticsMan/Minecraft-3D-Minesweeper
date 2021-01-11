# Helper function for when a tile is mined
# Called by main

tag @s add mined

# setblock air without tagging the tile as mined causes main to run
#	mined.mcfunction in the next tick, creating a ripple out effect
execute if score @s bombCount matches 0 as @e[distance=0.1..1.8, tag=tile, tag=!mined] at @s run setblock ~ ~ ~ air

execute if score @s bombCount matches 1.. run data merge entity @s {CustomNameVisible:1}

# only run if we didn't just mine a bomb - want users to be able to tell where
#	they went wrong!
# ..1.8 calls the function on @s as well, as desired
execute as @s[tag=!bomb] as @e[distance=..1.8,scores={bombsMinusFlags=0, bombCount=1..}] at @s run function 3d_minesweeper:helper/neighbor_changed

# kill tiles with nothing to display, cut down on lag
execute if score @s bombCount matches 0 run kill @s

execute at @s[tag=bomb] run function 3d_minesweeper:end/bomb_clicked
