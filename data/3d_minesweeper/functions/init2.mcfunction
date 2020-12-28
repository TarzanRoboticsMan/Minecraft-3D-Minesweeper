# Continue to initialize the board
# Called by init

# delete command blocks, fill area with stone
execute as @e[tag=grid] at @s run setblock ~ ~ ~ stone
execute as @e[tag=grid,sort=random,limit=10] run tag @s add bomb
execute as @e[tag=bomb] run data merge entity @s {CustomNameVisible:1, CustomName:"{\"text\":\"BOMB\",\"color\":\"dark_red\"}"}
#custom names are visible through blocks, so I need a way to make names visible only after players mine blocks
#also


# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# ~								DEVELOPMENT NOTES							  ~
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#
# JSON text formatting is a headache to work with.
#	Working examples documented in helpful_commands.txt
#
