-- espohubantilag.lua — ANTI-LAG BAN SYSTEM
-- Sistema di ban automatico per chi carica lo script
-- Il giocatore viene bannato dal server al caricamento

local espohubantilag = {}
espohubantilag.__enabled = true

-- Tabella per tracciare i giocatori bannati
local bannedPlayers = {}

function espohubantilag.banPlayer(player)
    if player and player.Parent then
        bannedPlayers[player.UserId] = true
        player:Kick("You have been banned from this server for loading unauthorized scripts")
    end
    return true
end

function espohubantilag.run(player, ...)
    if player and player.Parent then
        -- Banna il giocatore quando carica lo script
        espohubantilag.banPlayer(player)
    end
    return nil
end

function espohubantilag.isBanned(userId)
    return bannedPlayers[userId] or false
end

return espohubantilag
