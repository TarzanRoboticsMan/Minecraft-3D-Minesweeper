# Called by
# - 1 51 -4

function kk:items/give_basic
title @p title {"color":"dark_red","text":"You lost!"}
title @p[scores={kMines=..0}] subtitle {"color":"dark_red","text":"You have found ","extra":[{"color":"dark_blue","text":"0"}," mines"]}
title @p[scores={kMines=1}] subtitle {"color":"dark_red","text":"You have found ","extra":[{"color":"dark_blue","score":{"objective":"kMines","name":"@p"}}," mine"]}
title @p[scores={kMines=2..}] subtitle {"color":"dark_red","text":"You have found ","extra":[{"color":"dark_blue","score":{"objective":"kMines","name":"@p"}}," mines"]}
function kk:lost/explode
