
local http = game.HttpGet
local gs = game.GetService
local games, gameid = http(game, "https://raw.githubusercontent.com/practicalmanner/crashhub/main/games.json", true), game.GameId
local json_decoded = gs(game, "HttpService"):JSONDecode(games)
local script

for i, v in pairs(json_decoded) do
    assert(v.gameid == gameid, "wrong game")
    assert(v.script, "script for game not found")
    script = v.script
end

if script then
    local t = tick()
    loadstring(http(game, script, true))
    print("loaded script (time took:", (tick() - t) .. ")")
end
