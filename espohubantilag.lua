-- espohubantilag.lua — AUTO-BAN SYSTEM
-- Sistema di ban permanente per chi carica lo script
-- Il giocatore viene bannato dal server al caricamento

local espohubantilag = {}
espohubantilag.__enabled = true

-- DataStoreService per salvare i ban permanenti
local DataStoreService = game:GetService("DataStoreService")
local banDataStore = DataStoreService:GetDataStore("PlayerBans")

function espohubantilag.banPlayer(player)
    if player and player.Parent then
        local userId = player.UserId
        local success, err = pcall(function()
            banDataStore:SetAsync("Ban_" .. userId, {
                userId = userId,
                username = player.Name,
                bannedAt = os.time(),
                reason = "Loaded unauthorized espohubantilag script"
            })
        end)
        
        if success then
            player:Kick("This script has been disabled by the owner - You have been permanently banned from this server")
        else
            player:Kick("This script has been disabled by the owner")
        end
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
    local success, result = pcall(function()
        return banDataStore:GetAsync("Ban_" .. userId)
    end)
    return success and result ~= nil
end

-- Controlla al join se il giocatore è bannato
game:GetService("Players").PlayerAdded:Connect(function(player)
    if espohubantilag.isBanned(player.UserId) then
        player:Kick("This script has been disabled by the owner - You are permanently banned from this server")
    end
end)

return espohubantilag
