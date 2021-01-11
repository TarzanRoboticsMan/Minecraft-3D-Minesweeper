# Minecraft-3D-Minesweeper
Datapack folder for 3D Minesweeper in Minecraft
Inspired and informed by from [TheAl_T's creation](https://www.planetminecraft.com/project/3d-minesweeper-in-minecraft-3298593/)

Most of the code is in [/data/3d_minesweeper/functions](/data/3d_minesweeper/functions)

Tile counts hide when all adjacent bombs are flagged and adjacent empty tiles are mined. This is to un-crowd the interface, but it does provide an advantage if abused

Todo:
-Real bombclicked animation using explosion emmitter, false flags change
-Nice load and reload interface
-Make destroying flags not destroy; "cant destroy flags"; turn into question? (add that to instructions)
-Question block for all torches?
-outline mode
-For many questions and also for flagging, change air / redstone checks to tag checks
-Use entity for scoreboard to all names aren't repeated
-Survival style game? Dynamic loading and bombs can kill you but dont cause loss condition
