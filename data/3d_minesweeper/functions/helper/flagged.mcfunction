# Helper function for when a tile is flagged
# Called by flag_target as the flagged tile

scoreboard players set @a flagging 1
execute if block ~ ~ ~ redstone_block run scoreboard players set @a flagging -1
execute if score @p flagging matches 1 run setblock ~ ~ ~ redstone_block
execute if score @p flagging matches 1 run tag @s add flagged
execute if score @p flagging matches -1 run setblock ~ ~ ~ stone
execute if score @p flagging matches -1 run tag @s remove flagged

scoreboard players operation Bombs bombs -= @p flagging

execute as @e[distance=0.1..1.8,tag=tile,tag=!bomb] run scoreboard players operation @s bombsMinusFlags -= @p flagging
execute as @e[distance=0.1..1.8, scores={bombCount=1..}, tag=!bomb, tag=mined] at @s run function 3d_minesweeper:helper/neighbor_changed
