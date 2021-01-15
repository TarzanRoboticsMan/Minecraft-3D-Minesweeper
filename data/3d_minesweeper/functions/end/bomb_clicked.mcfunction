# End game because a bomb was mined
# Called by helper/mined when a bomb has been mined, with @s as that bomb

playsound minecraft:entity.ender_dragon.death master @a ~ ~ ~ 0.5
data merge entity @s {CustomNameVisible:1}
tag @s add animator
schedule function 3d_minesweeper:end/prime_lose_animation 260

scoreboard players enable @a mistakes
scoreboard players enable @a spawnboard

tag @e[tag=3dmsController] remove playing

tellraw @a [{"text":"> ","color":"#FF3333"},{"text":"[Start Again]","color":"#FFAA00", "hoverEvent":{"action":"show_text","value":"Spawn new board"}, "clickEvent":{"action":"run_command","value":"/trigger spawnboard"}}, {"text":", or see ","color":"white"}, {"text":"your mistakes", "color":"#BBBBBB", "hoverEvent":{"action":"show_text","value":"Click to see bombs now"}, "clickEvent":{"action":"run_command","value":"/trigger mistakes"}}]
#tellraw @a ""
