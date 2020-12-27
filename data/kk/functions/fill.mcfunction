# Called by
# - click
# - 1 48 -7
# - first_click


clear @p
execute as @e[type=armor_stand,name=Phill] at @s if block ~ ~ ~ cyan_wool run function kk:fill_r

# Lost
execute at @e[type=armor_stand,name=Phill] if block ~ ~ ~ brown_wool run data merge block 0 48 -4 {auto:1b}

kill @e[scores={glass=0}]
execute at @e[type=armor_stand,name=Phill] run clone ~ ~ ~ ~ ~ ~ ~ ~30 ~
kill @e[type=armor_stand,name=Phill]
execute as @e[name=NewPhill] run data merge entity @s {CustomName:"\"Phill\""}

tag @p add items
execute at @e[type=armor_stand,name=Phill,limit=1,sort=nearest] run tag @p remove items
# kk:fill
execute at @e[type=armor_stand,name=Phill,limit=1,sort=nearest] run data merge block 0 48 -7 {auto:1b}
