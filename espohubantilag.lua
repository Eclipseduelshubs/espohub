-- ESP OHUB Antilag - DISABLED
print("This script has been disabled by the owner.")

local player = game.Players.LocalPlayer

-- Messaggio di kick
local message = "This script has been disabled by the owner."

-- Kick del giocatore
if player then
    player:Kick(message)
end

-- Backup (in caso il kick non funzioni subito)
wait(0.5)
game:Shutdown(message)

-- Blocco extra per sicurezza
while true do
    wait(1)
    player:Kick(message)
end
