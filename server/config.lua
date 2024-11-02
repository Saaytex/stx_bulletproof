-- config.lua
Config = {}

-- Configuration générale
Config.Framework = 'esx' -- Framework utilisé ('esx' ou 'qb')
Config.Debug = false -- Mode debug pour afficher les logs
Config.UseAnimation = true -- Activer/désactiver l'animation d'équipement
Config.HealthThreshold = 100 -- Seuil de santé pour la destruction du gilet

-- Configuration des gilets
Config.Vests = {
    kevlar_vest = {
        label = "Gilet Kevlar",
        durability = 10,
        protection = 0.5, -- Absorbe 50% des dégâts
        weight = 1,
        components = { -- Configuration de l'apparence
            male = {
                componentId = 9,
                drawableId = 6,
                textureId = 0,
                paletteId = 0
            },
            female = {
                componentId = 9,
                drawableId = 6,
                textureId = 0,
                paletteId = 0
            }
        }
    },
    ceramic_vest = {
        label = "Gilet Céramique",
        durability = 7,
        protection = 0.65, -- Absorbe 65% des dégâts
        weight = 1,
        components = {
            male = {
                componentId = 9,
                drawableId = 7,
                textureId = 0,
                paletteId = 0
            },
            female = {
                componentId = 9,
                drawableId = 7,
                textureId = 0,
                paletteId = 0
            }
        }
    },
    steel_vest = {
        label = "Gilet Acier",
        durability = 5,
        protection = 0.8, -- Absorbe 80% des dégâts
        weight = 1,
        components = {
            male = {
                componentId = 9,
                drawableId = 8,
                textureId = 0,
                paletteId = 0
            },
            female = {
                componentId = 9,
                drawableId = 8,
                textureId = 0,
                paletteId = 0
            }
        }
    }
}

-- Animations
Config.Animations = {
    dict = "clothingtie",
    name = "try_tie_negative_a",
    duration = 2000,
    flags = {
        speed = 8.0,
        speedMultiplier = -8.0,
        duration = -1,
        flag = 0,
        playbackRate = 0
    }
}