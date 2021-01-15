# Minecraft-3D-Minesweeper
Datapack folder for 3 dimensional Minesweeper in Minecraft
Inspired and informed by from [TheAl_T's creation](https://www.planetminecraft.com/project/3d-minesweeper-in-minecraft-3298593/)

Most of the code is in [/data/3d_minesweeper/functions](/data/3d_minesweeper/functions)

Tile counts hide when all adjacent bombs are flagged and adjacent empty tiles are mined. This is to un-crowd the interface, but it does provide an advantage

### Todo:
- Make bomb clicked animation go slower
  - "popcorn" style, use random values so it happens slowly over a few seconds
- Win animation!
- Make destroying flags give warning instead of destroying
  - Maybe they should turn into a question flag, which can be broken
  - Allow user to say "dont show this warning again"
- "Question flag"
  - Maybe torches and soul torches can each have unique flags
- Outline mode to help players see grid
- Change air / redstone checks (mostly when flagging target) to tag checks
  - Cleaner code
  - Could help with question mark feature
- Add delay to count hiding to make it less of an advantage
- Difficulties

### Larger Feature Ideas
- Survival style game
  - Dynamic loading of tiles (8x8x8 is already approaching laggy)
  - Mining bombs causes explosions which can chain and might kill you
  - Get resources for mining / flagging bomb dense areas

### Forsaken Feature Ideas
