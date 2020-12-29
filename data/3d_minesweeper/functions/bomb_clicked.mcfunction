# End game because a bomb was mined
# Called by helper/mined when a bomb has been mined

playsound minecraft:entity.ender_dragon.death master @a
data merge entity @s {CustomNameVisible:1}
