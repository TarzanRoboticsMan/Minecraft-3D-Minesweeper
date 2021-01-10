# Master load function
# Called upon server loading or /reload by load.json

tellraw @a [{"text":"<cobyrocks> ","color":"#FF3333","hoverEvent":{"action":"show_text","value":"Click me!"},"clickEvent":{"action":"open_url","value":"https://packingpenguin.vercel.app"}},{"text":"Hey! Welcome to 3D Minesweeper :)","color":"white"}]

tellraw @a [{"text":"   - To spawn a board, click the "}, {"text":"[Start]", "color":"#44FF44","hoverEvent":{"action":"show_text","value":"Click to start"}},{"text":" button","color":"white"}]

tellraw @a [{"text":"   - Use your "},{"text":"Redstone Torch ", "color":"#FF8822", "clickEvent":{"action":"run_command", "value":"/give @s redstone_torch{display:{Name:\'[{\"text\":\"Flag / Unflag\",\"italic\":false,\"color\":\"#FF8822\"}]\',Lore:[\'[{\"text\":\"Use on tiles to mark or\",\"italic\":false}]\',\'[{\"text\":\"unmark them as bombs\",\"italic\":false}]\']}} 1"},"hoverEvent":{"action":"show_item", "contents":{"id":"redstone_torch","count":1,"tag":"{display:{Name:\'[{\"text\":\"Flag / Unflag\",\"italic\":false,\"color\":\"#FF8822\"}]\',Lore:[\'[{\"text\":\"Use on tiles to mark or\",\"italic\":false}]\',\'[{\"text\":\"unmark them as bombs\",\"italic\":false}]\']}}"}}}, {"text":"to flag and unflag bombs","color":"white"}]

tellraw @a [{"text":"   - If you need this message again, just type "},{"text":"/reload", "hoverEvent":{"action":"show_text","value":"click to reload"},"clickEvent":{"action":"run_command","value":"/reload"},"color":"#33FFDD"}]
#tell them to say reload to resummon the commands (WITH INSERTION)

#tellraw @a "Blocks display the number of nearby mines"
#tellraw @a "Try to flag all the bombs and mine out everything else"
