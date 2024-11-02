-- config.lua
Config = {}

-- Configuration des différents types de gilets
Config.Vests = {
    kevlar_vest = {
        durability = 6,            -- Durabilité maximale du gilet
        damageReduction = 0.3,      -- Réduit les dégâts de 30%
        appearance = {
            component = 9,          -- componentId pour le gilet
            drawable = 6,           -- drawableId pour l'apparence
            texture = 0,            -- textureId pour la texture
            palette = 0             -- paletteId pour la palette de couleurs
        }
    },
    ceramic_vest = {
        durability = 4,
        damageReduction = 0.65,     -- Réduit les dégâts de 65%
        appearance = {
            component = 9,
            drawable = 15,
            texture = 0,
            palette = 0
        }
    },
    steel_vest = {
        durability = 8,
        damageReduction = 0.5,      -- Réduit les dégâts de 50%
        appearance = {
            component = 9,
            drawable = 22,
            texture = 9,
            palette = 0
        }
    }
}