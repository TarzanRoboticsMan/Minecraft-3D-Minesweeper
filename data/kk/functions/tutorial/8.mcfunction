# Called by
# - 13 56 -1

clone 41 103 -8 51 107 -7 -2 111 -8
data merge block 15 48 -4 {Command:"execute as @p run teleport @s 0 108.0 0 180 -28"}
tellraw @p ["\nThis is one of the tile formations in which you know exactly where the mines are; ",{"color":"red","text":"3"}," with a wall. The wall tiles are always mines."]
