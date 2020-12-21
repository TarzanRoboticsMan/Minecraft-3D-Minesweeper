# Called by
# - main

teleport @e[type=area_effect_cloud,tag=Mine] 0.5 253.0 0.5
scoreboard players set @p mode 2
spreadplayers 0 -72 1 22 false @e[type=area_effect_cloud,tag=Mine,limit=280,sort=nearest]
scoreboard players set @p fakeMines 280
function kk:start/init
