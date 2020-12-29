# Continue to initialize the board
# Called by init

# delete command blocks, fill area with stone and bombs
execute as @e[tag=tile] at @s run setblock ~ ~ ~ stone
execute as @e[tag=tile,sort=random,limit=50] run tag @s add bomb
execute as @e[tag=bomb] run data merge entity @s {CustomName:"{\"text\":\"BOMB\", \"color\":\"dark_red\"}"}

# setup the counts
scoreboard objectives add bombCount dummy
# for every bomb, increment bombCount for every nearby tile
execute as @e[tag=tile,tag=!bomb] run scoreboard players set @s bombCount 0
# 1.8 is just over the diagonal distance to a tile at ~1 ~1 ~1
execute as @e[tag=bomb] at @s run execute as @e[distance=..1.8,tag=tile,tag=!bomb] run scoreboard players add @s bombCount 1

# hard coding colors and numbers
execute as @e[scores={bombCount=1}] run data merge entity @s {CustomName:"{\"text\":\"1\",\"color\":\"#2222FF\"}"}
execute as @e[scores={bombCount=2}] run data merge entity @s {CustomName:"{\"text\":\"2\",\"color\":\"dark_green\"}"}
execute as @e[scores={bombCount=3}] run data merge entity @s {CustomName:"{\"text\":\"3\",\"color\":\"#FF0000\"}"}

# remaining colors & numbers
setblock ~ ~ ~ crimson_sign
execute as @e[tag=tile,tag=!bomb,scores={bombCount=4..}] run function 3d_minesweeper:helper/rename
setblock ~ ~ ~ air

# we will use this later in main -> findTarget
scoreboard objectives add distanceTraveled dummy

# for debugging:
#execute as @e[tag=tile,scores={bombCount=1..}] run data merge entity @s {CustomNameVisible:1}


# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# ~								DEVELOPMENT NOTES							  ~
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#
# JSON text formatting is a headache to work with.
#	Working examples documented in helpful_commands.txt
#
# for some reason, distance=1 doesnt work as expected in all directions
#
# conduits obscure name tags?????
