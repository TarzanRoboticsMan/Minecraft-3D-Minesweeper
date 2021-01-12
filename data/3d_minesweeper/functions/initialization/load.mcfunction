# Master load function
# Called upon server loading or /reload by load.json

# clean up from previous commands
kill @e[tag=3dmsHelper]
execute unless entity @e[tag=3dmsController] run summon armor_stand ~ ~256 ~ {Tags:["3dmsController"], Marker:1, Invisible:1}

scoreboard objectives add start trigger
scoreboard players reset @a start
scoreboard players enable @a start

scoreboard objectives add spawnboard trigger
scoreboard players set @a spawnboard 0

scoreboard objectives add mistakes trigger
scoreboard players reset @a mistakes

execute as @a[nbt=!{Inventory:[{id:"minecraft:redstone_torch", tag:{display:{Name:"[{\"text\":\"Flag / Unflag\",\"italic\":false,\"color\":\"#FF8822\"}]"}}}]}] run give @s redstone_torch{display:{Name:"[{\"text\":\"Flag / Unflag\",\"italic\":false,\"color\":\"#FF8822\"}]",Lore:["[{\"text\":\"Use on tiles to mark or\",\"italic\":false}]","[{\"text\":\"unmark them as bombs\",\"italic\":false}]"]}} 1

# empty string needed or else hover/click actions apply to whole line
#	(only happens when hover/click is the first text in the list)
tellraw @a [{"text":""},{"text":"<cobyrocks> ","color":"#FF3333","hoverEvent":{"action":"show_text","value":"Click me!"},"clickEvent":{"action":"open_url","value":"https://cobysontag.com"}},{"text":"Hey! Welcome to 3D Minesweeper :)","color":"white"}]
tellraw @a ""

tellraw @a [{"text":"   - To spawn a board, click the "}, {"text":"[Start]", "color":"#44FF44","hoverEvent":{"action":"show_text","value":"Click to start"},"clickEvent":{"action":"run_command","value":"/trigger start"}},{"text":" button","color":"white"}]

tellraw @a [{"text":"   - Use your "},{"text":"Redstone Torch ", "color":"#FF8822", "clickEvent":{"action":"run_command", "value":"/give @s redstone_torch{display:{Name:\'[{\"text\":\"Flag / Unflag\",\"italic\":false,\"color\":\"#FF8822\"}]\',Lore:[\'[{\"text\":\"Use on tiles to mark or\",\"italic\":false}]\',\'[{\"text\":\"unmark them as bombs\",\"italic\":false}]\']}} 1"},"hoverEvent":{"action":"show_item", "contents":{"id":"redstone_torch","count":1,"tag":"{display:{Name:\'[{\"text\":\"Flag / Unflag\",\"italic\":false,\"color\":\"#FF8822\"}]\',Lore:[\'[{\"text\":\"Use on tiles to mark or\",\"italic\":false}]\',\'[{\"text\":\"unmark them as bombs\",\"italic\":false}]\']}}"}}}, {"text":"to flag and unflag bombs","color":"white"}]

tellraw @a [{"text":"   - If you need this message again, just type "},{"text":"/reload", "hoverEvent":{"action":"show_text","value":"Click to reload"},"clickEvent":{"action":"run_command","value":"/reload"},"color":"#33FFDD"}]
tellraw @a ""

#tellraw @a "Blocks display the number of nearby mines"
#tellraw @a "Try to flag all the bombs and mine out everything else"

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
# ~								DEVELOPMENT NOTES							  ~
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#
# I realized why TheAl_T uses triggers (/trigger <objective>)
#	Its because op mode is needed for direct commands.
#	gamerule sendCommandFeedback hides the trigger feedback
# I'm gonna leave commandFeedback so one can mess around with other commands
