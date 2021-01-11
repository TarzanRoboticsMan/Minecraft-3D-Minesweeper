# Help with ripple effect at the end of the game
# Called when end/bomb_clicked schedules end/start_lose_animation,
#	but called by main, with @s as an unmined tile

# this makes everything too crowded
#execute as @s[tag=!mined,tag=!bomb, tag=!flagged] run setblock ~ ~ ~ glass

execute as @s[tag=flagged, tag=!bomb] run setblock ~ ~ ~ red_stained_glass
execute as @s[tag=flagged, tag=!bomb] run data merge entity @s {CustomNameVisible:1}

execute as @s[tag=bomb, tag=!flagged, tag=!animator] at @s run setblock ~ ~ ~ light_gray_stained_glass
execute as @s[tag=bomb, tag=!flagged] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 0.5
execute as @s[tag=bomb, tag=!flagged] run particle explosion_emitter
execute as @s[tag=bomb, tag=!flagged] run data merge entity @s {CustomNameVisible:1}

execute if score @s bombCount matches 0 run setblock ~ ~ ~ air

tag @s add lost
execute at @s as @e[distance=..1.1,tag=tile] run tag @s add losing
