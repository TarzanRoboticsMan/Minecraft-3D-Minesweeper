# Called by
# - main

scoreboard players operation @s lastTime = @s time
scoreboard players set @s mode -1
playsound minecraft:entity.player.levelup master @s
title @s subtitle {"color":"dark_green","text":"You have found all ","extra":[{"color":"gold","score":{"objective":"kMines","name":"@s"}}," mines in ",{"color":"gold","score":{"objective":"lastTime","name":"@s"}}," seconds"]}
title @s title {"color":"dark_green","text":"You won!"}
clear @s
function kk:highscores
tellraw @p [{"color":"gray","text":"You can view your last score ("},{"color":"gold","score":{"objective":"lastTime","name":"@s"}},{"color":"gray","text":") by pressing tab.\n"},"If you have a better score (and a video proof), feel free to send me a ",{"hoverEvent":{"action":"show_text","value":"Click!"},"text":"message","clickEvent":{"action":"open_url","value":"http://www.planetminecraft.com/project/3d-minesweeper-in-minecraft-3298593/"},"underlined":"true","color":"blue"}," and your name will be here."]
function kk:items/give_basic
