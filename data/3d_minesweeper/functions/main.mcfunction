# Main function
# Called every tick by tick.json

# if a player mines a block, or helper/mined does, process that tile
execute as @e[tag=tile,tag=!mined] at @s if block ~ ~ ~ air run function 3d_minesweeper:helper/mined

# if holding the flag object, start flagging process
execute as @a[nbt={SelectedItem:{id:"minecraft:conduit"}}] at @s anchored eyes run summon armor_stand ^ ^ ^-0.01 {Tags:["flagBearer"], Invisible:1, Marker:1}
# at every player for whom we have just started flagging, rotate nearest stand
execute as @e[tag=flagBearer] at @s run teleport @s ~ ~ ~ facing entity @p eyes
execute as @e[tag=flagBearer] at @s run teleport ^ ^ ^0.01
execute as @e[tag=flagBearer] at @s run function 3d_minesweeper:helper/flag_target
