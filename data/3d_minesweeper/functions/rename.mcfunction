# Helper function to rename an individual grid
# Called by init2

tag @s add renaming
data merge block ~ ~ ~ {Text1:"{\"score\":{\"objective\":\"bombCount\", \"name\":\"@e[tag=renaming,limit=1]\"}}"}
data modify entity @s CustomName set from block ~ ~ ~ Text1
tag @s remove renaming
