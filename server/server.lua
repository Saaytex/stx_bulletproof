ESX.RegisterUsableItem('kevlar_vest', function(source)
    local vest = 'kevlar_vest'
    useitem(vest, source)
end)

ESX.RegisterUsableItem('ceramic_vest', function(source)
    local vest = 'ceramic_vest'
    useitem(vest, source)
end)

ESX.RegisterUsableItem('steel_vest', function(source)
    local vest = 'steel_vest'
    useitem(vest, source)
end)

function useitem(vest, source)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(vest).count
    
    if item > 0 then
        xPlayer.removeInventoryItem(vest, 1)
        TriggerClientEvent('vest:equip', source, true, vest)
    else
        print('not enought bulletproof')
    end
end