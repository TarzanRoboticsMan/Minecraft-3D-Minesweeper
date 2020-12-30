# Helper function to find the block a player is looking at
# Called by main, with @s being an armor stand with tag "flagBearer"

# teleport forward a little. With larger steps we begin to miss blocks if
#	the player was selecting a corner
tp ^ ^ ^0.01
scoreboard players add @s hundredthsMoved 1
execute if block ~ ~ ~ stone run setblock ~ ~ ~ redstone_block

# destroys after placing redstone or after encountering an already placed redstone
execute unless block ~ ~ ~ air run tag @s add selfDestruct

# 5 is a players reach, so if I've already tried mining at 5 blocks out,
#	self destruct
execute if score @s hundredthsMoved matches 500.. run tag @s add selfDestruct

execute as @s[tag=!selfDestruct] at @s run function 3d_minesweeper:helper/flag_target
execute as @s[tag=selfDestruct] run kill @s

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# ~								DEVELOPMENT NOTES							  ~
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#
# Previously, I ran kill @s when I had traveled 5+ blocks but did not check
#	anything in the recursive call. Apparently, the function continues to run,
#	and @s will be killed after it completes. Don't trust kill to stop functions
