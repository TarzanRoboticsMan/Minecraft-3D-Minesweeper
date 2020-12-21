# Called by
# - start/ez
# - start/medium
# - start/hard

gamemode adventure @a
clear @a
teleport @p 0 108.0 0

scoreboard players set @p kMines 0
scoreboard players set @p badMines 0
tag @p remove generated
kill @e[type=armor_stand,name=NewPhill]
kill @e[type=armor_stand,name=Phill]

function kk:generate
