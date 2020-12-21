# Called by
# - 14 58 -1

clone 36 102 -7 51 93 -8 -7 101 -8
data merge block 15 48 -4 {auto:0b}
tellraw @p ["\nThat should be all. Here is a part of the board solved. Take a look at it and when you think you have got the concept, use the book to start a new game."]
clone 40 103 -8 35 106 -6 -8 111 -8
execute as @p at @s run teleport @s ~ ~ ~ 180 19
function kk:tutorial/end
