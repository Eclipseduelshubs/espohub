-- espohubantilag.lua — DISABLED
-- Disabilitato il 2026-07-03 su richiesta del proprietario del repository.
-- Il file originale era obfuscato e potenzialmente non sicuro; questo stub impedisce l'esecuzione del codice.
-- Per ripristinare, consultare la cronologia dei commit e ripristinare la versione precedente.

local espohubantilag = {}
espohubantilag.__disabled = true

function espohubantilag.run(player, ...)
    if player and player.Parent then
        player:Kick("this script got disabled by the owner")
    end
    return nil
end

return espohubantilag
