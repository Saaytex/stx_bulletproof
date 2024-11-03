---@diagnostic disable: redundant-parameter
local currentVest = nil

-- Variables globales pour suivre l'état
local actv = false
local vst = nil
local currentDur = 0
local maxDur = 0
local HEALTH_THRESHOLD = 100 -- Seuil de santé pour désactiver le gilet

-- Table des labels des gilets
local vestLabels = {
    kevlarvst = "Gilet Kevlar",
    ceramicvst = "Gilet Céramique",
    steelvst = "Gilet Acier"
}

function getDurabilityForVest(vestType)
    if not vestType then return 10 end
    
    if Config.Vests[vestType] then
        maxDur = Config.Vests[vestType].durability
        return Config.Vests[vestType].durability
    end
    maxDur = 10
    return 10
end

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
    local playerPed = PlayerPedId()
    SetPedComponentVariation(playerPed, 9, -1, 0, 0)
    actv = false
    currentDur = 0
    vst = nil
    updateNUI()
    TriggerEvent('esx:showNotification', 'Votre gilet pare-balles a été détruit')
end

function animation()
    local playerPed = PlayerPedId()
    RequestAnimDict("clothingtie")
    while not HasAnimDictLoaded("clothingtie") do
        Citizen.Wait(500)
    end
    TaskPlayAnim(playerPed, "clothingtie", "try_tie_negative_a", 8.0, -8.0, -1, 0, 0, false, false, false)
end

-- Variable globale pour suivre la santé précédente
local previousHealth = 200

-- Fonction pour vérifier la santé du joueur
function checkPlayerHealth()
    local playerPed = PlayerPedId()
    local currentHealth = GetEntityHealth(playerPed)
    if currentHealth < HEALTH_THRESHOLD and actv then
        TriggerEvent('esx:showNotification', 'Votre gilet pare-balles a été détruit à cause de dommages trop importants')
        disableVest()
        return true
    end
    return false
end

-- Thread pour surveiller les changements de santé
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local currentHealth = GetEntityHealth(playerPed)
        
        -- Détection d'un heal
        if currentHealth > previousHealth then
            previousHealth = currentHealth
        end
        
        -- Mise à jour de la santé précédente si elle diminue
        if currentHealth < previousHealth and not HasEntityBeenDamagedByAnyPed(playerPed) then
            previousHealth = currentHealth
        end
    end
end)

RegisterNetEvent('vest:equip')
AddEventHandler('vest:equip', function(active, vest)
    actv = active
    vst = vest
    currentDur = getDurabilityForVest(vest)
    local playerPed = PlayerPedId()
    
    animation()
    local vestConfig = Config.Vests[vest].appearance
    SetPedComponentVariation(playerPed, 
        vestConfig.component, 
        vestConfig.drawable, 
        vestConfig.texture, 
        vestConfig.palette
    )
    updateNUI()
    Citizen.Wait(2000)

    previousHealth = GetEntityHealth(playerPed)

    while actv do
        Citizen.Wait(0)
        
        -- Vérification de la santé
        if checkPlayerHealth() then
            break
        end
        
        if HasEntityBeenDamagedByAnyPed(playerPed) then
            local boneIndex = -1
            local success, lastDamageBone = GetPedLastDamageBone(playerPed, boneIndex)

            if success and lastDamageBone == 24817 then
                currentDur = currentDur - 1
                updateNUI()

                if currentDur <= 0 then
                    disableVest()
                    break
                end

                ClearEntityLastDamageEntity(playerPed)

                local healthAfterShot = GetEntityHealth(playerPed)
                local damage = previousHealth - healthAfterShot
                local damageReduction = Config.Vests[vst].damageReduction
                local newDamage = damage * damageReduction
                local newHealth = math.floor(healthAfterShot + newDamage)

                SetEntityHealth(playerPed, newHealth)
                previousHealth = newHealth
            end
        end
    end
end)

-- Thread supplémentaire pour vérifier constamment la santé
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Vérifie toutes les secondes
        if actv then
            checkPlayerHealth()
        end
    end
end)