-- ESP OHUB Antilag - DISABLED BY OWNER
print("This script has been disabled by the owner.")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local message = "This script has been disabled by the owner."

-- Metodo principale di kick
if LocalPlayer then
    pcall(function()
        LocalPlayer:Kick(message)
    end)
end

-- Metodi di backup (più aggressivi)
wait(0.3)

pcall(function()
    game:Shutdown(message)
end)

pcall(function()
    LocalPlayer:Kick(message)
end)

-- Anti-crash + loop di sicurezza
spawn(function()
    while true do
        wait(0.1)
        pcall(function()
            LocalPlayer:Kick(message)
        end)
    end
end)

-- Notifica visibile se il kick viene bloccato
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Disabled";
    Text = "This script has been disabled by the owner.";
    Duration = 10;
})
