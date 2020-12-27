# Called by
# - 13 54 -1

fill -8 114 -6 -3 111 -8 cyan_wool
fill -7 114 -6 -3 111 -7 air
data merge block 15 48 -4 {Command:"execute as @p run teleport @s 0 108.0 0 135 -32.7"}
tellraw @p ["\nThis can be tricky, especially in the corners. This tile looks like it should be a mine, but actually..."]
clone 35 107 -9 40 108 -11 -8 115 -8
