# Called by
# - flag/events

execute at @e[type=armor_stand,name=Unflag] run setblock ~ ~30 ~ white_wool
tag @p remove unflag
execute as @e[type=armor_stand,name=Unflag] at @s if block ~ ~ ~ brown_wool run tag @p add unflag
execute as @p[tag=unflag] run scoreboard players remove @p kMines 1
execute as @p[tag=!unflag] run scoreboard players remove @p badMines 1
scoreboard players add @p fakeMines 1
execute at @e[type=armor_stand,name=Unflag] run setblock ~ ~ ~-18 glass
kill @e[type=armor_stand,name=Unflag]
