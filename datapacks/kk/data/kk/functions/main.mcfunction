# Called by
# - tick.json

# Setup
teleport @p[scores={death=..49}] 0 108.0 0 0 0
execute as @p[scores={death=50}] run function kk:init_player
tag @p[gamemode=adventure] remove cheater
tellraw @p[gamemode=!adventure,scores={death=51..},tag=!cheater] {"color":"yellow","text":"TheAl_T joined the game\n","extra":[{"color":"white","text":"<"},{"color":"gold","text":"TheAl_T"},{"color":"white","text":"> You cheater! =D\n"},"TheAl_T left the game"]}
tag @p[gamemode=!adventure] add cheater

# Triggers
scoreboard players enable @p trigger
execute as @p[scores={trigger=1}] run function kk:start/ez
execute as @p[scores={trigger=2}] run function kk:start/medium
execute as @p[scores={trigger=3}] run function kk:start/hard
execute as @p[scores={trigger=4}] run function kk:tutorial/init
execute as @p[scores={trigger=5}] run function kk:bonus
execute as @p[scores={trigger=6}] run function kk:tutorial/end
scoreboard players set @p trigger 0

# Auto-fly
execute as @p[nbt={SelectedItem:{id:"minecraft:barrier"}}] run data merge block 2 48 -13 {auto:0b}
execute as @p[nbt=!{SelectedItem:{id:"minecraft:barrier"}}] run data merge block 2 48 -13 {auto:1b}

# Shift
tag @p[scores={shift=..0}] remove shift
execute as @p[scores={shift=1..}] at @s run function kk:shift

# Fly
execute as @p[x=-6.5,y=102,z=-6.5,dx=16,dy=10,dz=16] at @s run function kk:fly_barrier

# Give items
execute as @p[scores={mode=0..},tag=items,nbt=!{SelectedItem:{id:"minecraft:written_book"}}] run function kk:items/give

# Register items
execute as @e[type=item] at @s run function kk:items/register

# Events
execute as @p[scores={button=1..}] at @s run function kk:flag/button
execute at @e[scores={glass=1}] run summon armor_stand ~ ~-30 ~ {Marker:1,Invisible:1,CustomName:"\"Phill\"",NoGravity:1}
execute at @p[tag=generated] as @e[scores={glass=1}] run function kk:click
scoreboard players set @p[tag=!generated] timer 0
execute at @p[tag=!generated] as @e[scores={glass=1}] run function kk:first_click

# Timer
scoreboard players add @p timer 1
scoreboard players operation @p time = @p timer
scoreboard players operation @p time /= twenty constant
title @p[scores={mode=0..2}] actionbar ["Time: ",{"score":{"objective":"time","name":"@p"}}," seconds"]

# Endgame
execute as @p[scores={badMines=..0,kMines=170..,mode=0}] run function kk:endgame
execute as @p[scores={badMines=..0,kMines=210..,mode=1}] run function kk:endgame
execute as @p[scores={badMines=..0,kMines=280..,mode=2}] run function kk:endgame

execute as @p[scores={mode=0..}] run kill @e[type=item]
