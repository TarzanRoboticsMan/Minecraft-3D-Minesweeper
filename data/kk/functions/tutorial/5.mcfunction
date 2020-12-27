# Called by
# - 13 53 -1

clone 37 103 -8 35 106 -6 -8 111 -8
tellraw @p ["\nThe numbers work cross-edges as well."]
data merge block 15 48 -4 {Command:"execute as @p run teleport @s 0 108.0 0 135 -17.6"}
