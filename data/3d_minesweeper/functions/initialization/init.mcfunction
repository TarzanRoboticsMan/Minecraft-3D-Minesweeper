# Initialize the board
# Called by main when user presses [Yes] button from initalization/pressed_start
#	Called as user but at 3dmsController

scoreboard players set @s spawnboard 0
scoreboard players enable @a spawnboard
tellraw @a [{"text":"> ","color":"#FF3333"},{"text":"Loading new board! ","color":"white"}, {"text":"[New Board]","color":"#FFAA00", "hoverEvent":{"action":"show_text","value":"Spawn new board"},"clickEvent":{"action":"run_command","value":"/trigger spawnboard"}}]

kill @e[tag=3dmsHelper]
execute as @e[tag=3dmsController] at @s if block ~ ~-1 ~ structure_block run clone ~ ~-2 ~ ~ ~-2 ~ ~ ~-1 ~

# Kill old stands
kill @e[tag=tile]
gamerule commandBlockOutput false
stopsound @a master
schedule clear

# Fill an 8x8 cube with command blocks, which immediately summon stands
# The tile tag is a shorter target selector and protects non-datapack armor stands
execute at @e[tag=3dmsController] run fill ~ ~ ~ ~9 ~9 ~9 air
execute at @e[tag=3dmsController] run fill ~1 ~1 ~1 ~8 ~8 ~8 command_block{Command:"summon armor_stand ~ ~-0.4 ~ {Tags:[\"tile\"], Marker:1, Invisible:1, CustomName:\"{\\\"text\\\":\\\"\\\"}\"}", auto:1, TrackOutput:0}
# thanks to https://gaming.stackexchange.com/a/254573 for helping me realize
#	how to do that horrid "\\\\\\\"

# The command blocks will not summon stands until the next tick,
#	so we'll finish initializing in 2 ticks
execute at @e[tag=3dmsController] run schedule function 3d_minesweeper:initialization/init2 2


# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# ~								DEVELOPMENT NOTES							  ~
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#
# area_effect_clouds are much more lag friendly, but armor stands have a "Marker"
#	tag which puts the name tag just above the base plate. Otherwise I'd have to
#	offset the clouds, and the nametag's dimming effect would be based on the
#	block underneath them
# in my rudimentary tests, 1024 armor stands was where I started to lag (~10^3),
#	compared to 5096 clouds (~16^3)
# marker, in addition to lowering name, removes the hitbox and disables gravity
#
# disabling TrackOutput on the command blocks is meant to help with lag
#
# Small: 1 makes debugging stands nicer
#
# tp ~ ~-0.4 ~ is about the perfect height to make the name tags appear in the middle
