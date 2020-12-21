# Called by
# - main

clear @p
teleport @p 0 108.0 0
scoreboard players set @p mode 3
scoreboard players set @p fillBool 0
scoreboard players set @p fakeMines 9001
kill @e[type=armor_stand,name=Phill]
kill @e[type=armor_stand,name=NewPhill]
fill -8 100 -8 8 116 8 white_wool hollow
setblock -9 68 -27 redstone_block
setblock -9 68 9 redstone_block
