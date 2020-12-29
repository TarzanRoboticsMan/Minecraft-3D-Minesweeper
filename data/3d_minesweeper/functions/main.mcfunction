# Main function
# Called every tick by tick.json

execute as @e[tag=tile,tag=!mined] at @s if block ~ ~ ~ air run function 3d_minesweeper:helper/mined
