-- Déclarer la table bulletproof comme variable locale
local bulletproof = {
    {material = "kevlarvst", durability = 10},
    {material = "ceramicvst", durability = 7},
    {material = "steelvst", durability = 5}
}

-- Variables globales pour suivre l'état
local actv = false
local vst = nil
local currentDur = 0
local maxDur = 0
local playerPed = PlayerPedId()

-- Table des labels des gilets
local vestLabels = {
    kevlarvst = "Gilet Kevlar",
    ceramicvst = "Gilet Céramique",
    steelvst = "Gilet Acier"
}

function getDurabilityForVest(vestType)
    if not vestType then return 10 end -- Protection contre les valeurs nil
    
    for _, vest in ipairs(bulletproof) do
        if vest.material == vestType then
            maxDur = vest.durability
            return vest.durability
        end
    end
    maxDur = 10
    return 10
end

-- Le reste de votre code reste identique
function updateNUI()
    if actv and vst then
        SendNUIMessage({
            type = "updateVest",
            display = true,
            vestLabel = vestLabels[vst],
            durability = currentDur,
            maxDurability = maxDur
        })
    else
        SendNUIMessage({
            type = "updateVest",
            display = false
        })
    end
end

function disableVest()
    SetPedComponentVariation(playerPed, 9, -1, 0, 0)
    actv = false
    currentDur = 0
    vst = nil
    updateNUI()
end

function animation()

    print("annimation lancer")

    RequestAnimDict("clothingtie")
    while not HasAnimDictLoaded("clothingtie") do
        Citizen.Wait(500)
    end

    local playerPed = PlayerPedId()
    TaskPlayAnim(playerPed, "clothingtie", "try_tie_negative_a", 8.0, -8.0, -1, 0, 0, false, false, false)
end

RegisterNetEvent('vest:equip')
AddEventHandler('vest:equip', function(active, vest)
    actv = active
    vst = vest
    currentDur = getDurabilityForVest(vest)
    local playerPed = PlayerPedId()
    
    animation()
    SetPedComponentVariation(playerPed, 9, 1, 0, 0)
    updateNUI()
    Citizen.Wait(2000)

    local previousHealth = GetEntityHealth(PlayerPedId())

    while actv do
        Citizen.Wait(0)

        if HasEntityBeenDamagedByAnyPed(playerPed) then
            local boneIndex = -1
            local success, lastDamageBone = GetPedLastDamageBone(playerPed, boneIndex)

            if success and lastDamageBone == 24817 then
                currentDur = currentDur - 1
                updateNUI()
                print("Durabilité restante: " .. currentDur)

                if currentDur <= 0 then
                    disableVest()
                    break
                end

                ClearEntityLastDamageEntity(playerPed)

                local healthAfterShot = GetEntityHealth(playerPed)
                local damage = previousHealth - healthAfterShot
                local newDamage = damage * 0.5
                local newHealth = math.floor(healthAfterShot + newDamage)

                SetEntityHealth(playerPed, newHealth)
                previousHealth = newHealth
            end
        end
    end
end)