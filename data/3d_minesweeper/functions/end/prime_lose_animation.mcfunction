# Helper function to play priming noise then schedule start_lose_animation
# Called by end/bomb_clicked as server

scoreboard players reset @a mistakes
stopsound @a master minecraft:entity.ender_dragon.death
execute as @e[tag=animator] at @s run playsound minecraft:entity.tnt.primed block @a ~ ~ ~ 1 1.5
schedule function 3d_minesweeper:end/start_lose_animation 40
