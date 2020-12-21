# Called by
# - 13 49 -1

fill -2 110 -8 -8 116 -5 andesite replace white_wool
fill -3 111 -8 -8 116 -6 cyan_wool replace andesite
clone 40 103 -9 38 105 -9 -5 111 -8
data merge block 15 48 -4 {Command:"execute as @p run teleport @s 0 108.0 0 146 -24"}
data merge block 15 48 -4 {auto:1b}
tellraw @p ["\nHere you can see an uncovered part of the board. The ",{"color":"blue","text":"1"}," that you are looking at means there is only one mine next to it. Since there is only one covered tile, we can flag it."]
