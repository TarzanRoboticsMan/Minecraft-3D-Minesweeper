# Called by
# - 2 48 -4

clear @p
scoreboard players set @p mode -1
execute at @e[x=0.5,y=225,z=0.5,distance=..40] if block ~ ~-150 ~ brown_wool if block ~ ~-120 ~ purple_wool run setblock ~ ~-120 ~ blue_wool
execute at @e[x=0.5,y=225,z=0.5,distance=..40] if block ~ ~-150 ~ brown_wool if block ~ ~-120 ~ white_wool run setblock ~ ~-120 ~ brown_wool
function kk:lost/explode
