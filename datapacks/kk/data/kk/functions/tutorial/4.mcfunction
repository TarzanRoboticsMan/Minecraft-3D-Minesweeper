# Called by
# - 13 52 -1

setblock -4 111 -8 magenta_wool
data merge block 15 48 -4 {Command:"execute as @p run teleport @s 0 108.0 0 151.5 -13"}
tellraw @p ["\nSame with this ",{"color":"dark_green","text":"2"},"."]
setblock -3 111 -8 magenta_wool
