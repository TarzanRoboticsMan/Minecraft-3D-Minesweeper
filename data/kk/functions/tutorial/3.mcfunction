# Called by
# - 13 51 -1

setblock -3 112 -8 purple_wool
data merge block 15 48 -4 {Command:"execute as @p run teleport @s 0 108.0 0 146 -18"}
tellraw @p ["\nOnce the number of flags around a number is equal to the number (like this ",{"color":"blue","text":"1"},"), you can safely click all of the surrounding tiles."]
