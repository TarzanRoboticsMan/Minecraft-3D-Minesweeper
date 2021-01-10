# Helper function for tile being mined to update neighbors (for count hiding)
# Called by helper/mined on mined neighbors with bombsCount >= 1

tag @s add processing

execute if score @s bombsMinusFlags matches 0 run data merge entity @s {CustomNameVisible:0}

# If theres nearby stone, the count still provides useful info
execute as @e[distance=0.1..1.8,tag=tile,tag=!mined] at @s if block ~ ~ ~ stone as @e[tag=processing,limit=1] run data merge entity @s {CustomNameVisible:1}
#debugging: execute as @e[distance=0.1..1.8,tag=tile,tag=!mined] at @s if block ~ ~ ~ stone run say im stone


tag @s remove processing
