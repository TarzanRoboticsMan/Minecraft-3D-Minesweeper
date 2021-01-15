# Main function
# Called every tick by tick.json

# if a player mines a block, or helper/mined does, process that tile
execute as @e[tag=tile,tag=!mined] at @s if block ~ ~ ~ air run function 3d_minesweeper:helper/mined

# ripplig process like mined for ending animation
execute as @e[tag=losing,tag=!lost] at @s run function 3d_minesweeper:end/lose_animation

# if just used the flag object, start flagging process
execute as @a[scores={flags=1..}] at @s anchored eyes run summon armor_stand ^ ^ ^-0.01 {Tags:["flagBearer"], Invisible:1, Marker:1}
execute as @a[scores={flags=1..}] run scoreboard players set @s flags 0
# at every player for whom we have just started flagging, rotate nearest stand
execute as @e[tag=flagBearer] at @s run teleport @s ~ ~ ~ facing entity @p eyes
execute as @e[tag=flagBearer] at @s run teleport ^ ^ ^0.01
execute as @e[tag=flagBearer] at @s run function 3d_minesweeper:helper/flag_target

# check if our users have pressed any buttons
execute as @a[scores={start=1}] at @s run function 3d_minesweeper:initialization/pressed_start
execute as @a[scores={spawnboard=1}] at @e[tag=3dmsController] run function 3d_minesweeper:initialization/init
execute as @a[scores={mistakes=1}] run schedule function 3d_minesweeper:end/prime_lose_animation 1

scoreboard players add Time ticks 1
execute as @e[tag=3dmsController,tag=playing] if score Time ticks matches 20.. run scoreboard players add Time 3dms 1
execute as @e[tag=3dmsController,tag=playing] if score Time ticks matches 20.. run scoreboard players reset Time ticks
