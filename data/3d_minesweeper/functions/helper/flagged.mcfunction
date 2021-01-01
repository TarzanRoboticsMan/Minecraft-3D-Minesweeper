# Helper function for when a tile is mined
# Called by flag_target
setblock ~ ~ ~ redstone_block

scoreboard players remove @a Bombs 1

execute as @e[distance=0.1..1.8,tag=tile,tag=!bomb] run scoreboard players remove @s bombsMinusFlags 1
execute as @e[distance=0.1..1.8, scores={bombsMinusFlags=0, bombCount=1..}, tag=!bomb] at @s run function 3d_minesweeper:helper/neighbor_changed
