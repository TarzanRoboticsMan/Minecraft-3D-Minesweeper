# Helper function to find the block a player is looking at
# Called by main, with @s being an armor stand with tag "flagBearer"

# teleport to the next block over. Sometimes this will be the same block
#	due to diagonals, but it will never skip over a block
tp ^ ^ ^1
scoreboard players add @s distanceTraveled 1
execute if block ~ ~ ~ stone run tag @s add foundTarget

execute at @s[tag=foundTarget] run setblock ~ ~ ~ redstone_block
execute at @s[tag=foundTarget] run tag @s add selfDestruct

# 5 is a players reach, so if I've already tried mining at 5, self destruct
execute if score @s distanceTraveled matches 5.. run tag @s add selfDestruct

execute as @s[tag=!selfDestruct] at @s run function 3d_minesweeper:helper/flag_target
execute as @s[tag=selfDestruct] run kill @s

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# ~								DEVELOPMENT NOTES							  ~
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#
# Previously, I ran kill @s when I had traveled 5+ blocks but did not check
#	anything in the recursive call. Apparently, the function continues to run,
#	and @s will be killed after it completes. Don't trust kill to stop functions
