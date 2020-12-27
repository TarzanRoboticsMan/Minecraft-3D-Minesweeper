# Called by
# - main

clear @p
execute at @e[type=armor_stand,name=Phill] run setblock ~ ~ ~-18 air
tag @p remove click
execute as @e[type=armor_stand,name=Phill] at @s if block ~ ~ ~ brown_wool run tag @p add click

# Lost
execute as @p[tag=click] run data merge block 0 48 -4 {auto:1b}

execute as @p[tag=!click] at @s run function kk:fill
