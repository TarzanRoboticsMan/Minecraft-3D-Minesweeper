# Initialize the board

# Kill old stands
kill @e[tag=tile]
gamerule commandBlockOutput false
stopsound

# Fill an 8x8 cube with command blocks, which immediately summon stands
# The tile tag is a shorter target selector and protects non-datapack armor stands
fill ~ ~ ~ ~9 ~9 ~9 air
fill ~1 ~1 ~1 ~8 ~8 ~8 command_block{Command:"summon armor_stand ~ ~-0.4 ~ {Tags:[\"tile\"], Marker:1, Invisible:1}", auto:1, TrackOutput:0}

# The command blocks will not summon stands until the next tick,
#	so we'll finish initializing in 2 ticks
schedule function 3d_minesweeper:init2 2


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
