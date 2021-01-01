# Helper function for tile being mined to update neighbors (for count hiding)
# Called by helper/mined on neighbors with noMoreBombsButCountVisible

tag @s add processing

# If theres no nearby stone, the count no longer provides useful information
execute as @e[distance=0.1..1.8,tag=tile,tag=!mined] at @s if block ~ ~ ~ stone as @e[tag=processing,limit=1] run tag @s add cancel
execute as @e[distance=0.1..1.8,tag=tile,tag=!mined] at @s if block ~ ~ ~ stone run say im stone

execute as @s[tag=!cancel] run data merge entity @s {CustomNameVisible:0}
execute as @s[tag=cancel] run say canceled :(
execute as @s[tag=cancel] run tag @s remove cancel

tag @s remove processing
