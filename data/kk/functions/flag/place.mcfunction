# Called by
# - flag/events

execute at @e[type=armor_stand,name=Flag] run setblock ~ ~30 ~ purple_wool
tag @p remove flag
execute as @e[type=armor_stand,name=Flag] at @s if block ~ ~ ~ brown_wool run tag @p add flag
execute as @p[tag=flag] run scoreboard players add @p kMines 1
execute as @p[tag=!flag] run scoreboard players add @p badMines 1
scoreboard players remove @p fakeMines 1
execute at @e[type=armor_stand,name=Flag] run setblock ~ ~ ~-18 air
kill @e[type=armor_stand,name=Flag]
