# Helper function to find the block a player is looking at
# Called by main, with @s being an armor stand with tag "flagBearer"

# teleport forward a little. With larger steps we begin to miss blocks if
#	the player was selecting a corner
tp ^ ^ ^0.01
scoreboard players add @s hundredthsMoved 1

execute if block ~ ~ ~ redstone_torch run setblock ~ ~ ~ air
execute if block ~ ~ ~ redstone_wall_torch run setblock ~ ~ ~ air

# sets to selfDestruct right before running helper/flagged
execute if block ~ ~ ~ stone run tag @s add foundTargetOrTimedOut
execute if block ~ ~ ~ redstone_block run tag @s add foundTargetOrTimedOut
# this -0.4 matches the -0.4 all stands are lowered by in init - now we can use
#	sort=nearest to find the armor stand representing our tile
# the 0.9 is half of the typical 1.8 - basically, within half a block accounting
#	for diagonals. Otherwise flagging stone under the board flags nearby tiles
execute as @s[tag=foundTargetOrTimedOut] positioned ~ ~-0.4 ~ as @e[tag=tile,sort=nearest,limit=1,distance=..0.9] at @s run function 3d_minesweeper:helper/flagged

# 5 is a players reach, so if I've already tried mining at 5 blocks out,
#	self destruct
execute if score @s hundredthsMoved matches 500.. run tag @s add foundTargetOrTimedOut

execute as @s[tag=!foundTargetOrTimedOut] at @s run function 3d_minesweeper:helper/flag_target
execute as @s[tag=foundTargetOrTimedOut] run kill @s

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# ~								DEVELOPMENT NOTES							  ~
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#
# Previously, I ran kill @s when I had traveled 5+ blocks but did not check
#	anything in the recursive call. Apparently, the function continues to run,
#	and @s will be killed after it completes. Don't trust kill to stop functions
#
# I don't store stoneMinusFlagsAndAir (instead of bombsMinusFlags) because
#	setting that initial score would be intense (every tile talks to every
#	neighbor), or involve hard coding the edge pieces. I figure checking
#	bombsMinusFlags=0 is a decent solution, flagging is relatively uncommon and
#	its likely the user will quickly mine out the nearby stone of bMF=0 tiles
#	if they're playing the game well, so I won't have to check many entities
