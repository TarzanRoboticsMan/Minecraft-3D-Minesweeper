# Continue to initialize the board
# Called by init

# delete command blocks, fill area with stone and bombs
execute as @e[tag=grid] at @s run setblock ~ ~ ~ stone
execute as @e[tag=grid,sort=random,limit=10] run tag @s add bomb
execute as @e[tag=bomb] run data merge entity @s {CustomNameVisible:1, CustomName:"{\"text\":\"BOMB\",\"color\":\"dark_red\"}"}

# setup the counts
scoreboard objectives add bombCount dummy
# for every bomb, increment bombCount for every nearby grid
execute as @e[tag=bomb] at @s run execute as @e[tag=grid,tag=!bomb,distance=..1.8] run scoreboard players add @s bombCount 1
setblock ~ ~ ~ crimson_sign
execute as @e[tag=grid,tag=!bomb,scores={bombCount=1..}] run function 3d_minesweeper:rename
setblock ~ ~ ~ air

# hard coding colors
#execute as @e[scores={bombCount:1}] run data merge entity @s CustomName:"{\"color\":\"blue\"}"}
#execute as @e[scores={bombCount:2}] run data merge entity @s CustomName:"{\"text\":\"2\",\"color\":\"blue\"}"}
execute as @e[tag=grid,scores={bombCount=1..}] run data merge entity @s {CustomNameVisible:1}
#custom names are visible through blocks, so I need a way
#	to make names visible only after players mine blocks
#also


# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# ~								DEVELOPMENT NOTES							  ~
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#
# JSON text formatting is a headache to work with.
#	Working examples documented in helpful_commands.txt
#
