# Called by
# - 13 50 -1

setblock -4 112 -8 purple_wool
data merge block 15 48 -4 {Command:"execute as @p run teleport @s 0 108.0 0 152 -24.6"}
tellraw @p ["\nYou can say the same about this ",{"color":"dark_green","text":"2"},"."]
