# Called by
# - main

clear @p
difficulty peaceful
gamemode adventure @a

scoreboard players set @p mode -1
scoreboard players set @p flyBool 0
scoreboard players set @p boolBool 0

tag @p add items
function kk:items/give_basic

title @p title {"color":"dark_blue","text":"3D Minesweeper"}
title @p subtitle [{"color":"dark_blue","text":"By "},{"color":"gold","text":"TheAl_T"}]
# Welcome message
summon area_effect_cloud 0.5 48.5 -9.5 {Age:-10,Particle:"block air",Tags:["delay2"]}

kill @e[type=area_effect_cloud,tag=fly]
data merge block 0 48 -13 {auto:1b}
