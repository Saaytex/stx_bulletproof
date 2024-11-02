# FiveM Bulletproof Vest System [EN]
A realistic bulletproof vest system for FiveM with user interface and durability system.

## 📺 Preview
[Watch on YouTube](https://youtu.be/lB8A9YSvpiU)

## Description
A realistic bulletproof vest system for FiveM offering three different protection levels, each with its own durability and protection characteristics. The script includes an intuitive user interface showing vest durability and a realistic damage system.

## Features
- 3 different types of vests (Kevlar, Ceramic, Steel)
- Advanced durability system
- Realistic damage protection
- Intuitive user interface
- Fully configurable
- ESX compatible

## ⚙️ Requirements
- ESX Framework
- es_extended
- oxmysql

## Installation
1. **Download the files** into your resources folder
2. **Add** to your `server.cfg`:
```cfg
ensure stx_bulletproof
```
3. **Import** items into your database:
```sql
INSERT INTO `items` (`name`, `label`, `weight`) VALUES
    ('kevlar_vest', 'Kevlar Vest', 1),
    ('ceramic_vest', 'Ceramic Vest', 1),
    ('steel_vest', 'Steel Vest', 1);
```

## 🖼️ Inventory Images

### For ox_inventory users
The images are already included in the `images` folder. Simply copy them to:
```
ox_inventory/web/images/
```

![kevlar_ceramic_steel_vest](https://github.com/user-attachments/assets/e877e021-1cb3-4254-98c4-0e704f128d56)

### For other inventory systems
If you're using a different inventory system, you can find the item images in the `images` folder. Simply copy these images to your inventory system's image directory following your inventory script's documentation.

## Configuration
The `config.lua` file allows you to modify:
```lua
Config.Vests = {
    kevlar_vest = {
        durability = 6,            -- Maximum durability
        damageReduction = 0.3,      -- Damage reduction (30%)
        appearance = {
            component = 9,          -- Component ID
            drawable = 6,           -- Drawable ID
            texture = 0,           -- Texture ID
            palette = 0            -- Palette ID
        }
    },
    -- Other vest configurations...
}
```

## Usage
1. Give vests via admin commands or your inventory system
2. Players can use the vest from their inventory
3. Interface displays remaining durability
4. Vest automatically destroys when durability reaches 0

## Admin Commands
```
/giveitem [ID] kevlar_vest [quantity]
/giveitem [ID] ceramic_vest [quantity]
/giveitem [ID] steel_vest [quantity]
```

## Vest Characteristics (all modifiable)
- **Kevlar Vest**
  - Durability: 6 impacts
  - Protection: 30% damage reduction

- **Ceramic Vest**
  - Durability: 4 impacts
  - Protection: 65% damage reduction

- **Steel Vest**
  - Durability: 8 impacts
  - Protection: 50% damage reduction

## 🛠️ Technical Features
- 50% damage reduction
- Responsive NUI interface
- Visual durability progress bar
- Torso impact detection system
- Realistic equipment animation

## 📞 Support
For questions or issues:
- Join our Discord [\[link to be added\]](https://discord.com/invite/reJ8V49A4f)

## Credits
Developed by Saaytex

---

---

# Système de Gilet Pare-balles FiveM [FR]
Un système de gilet pare-balles réaliste pour FiveM avec interface utilisateur et système de durabilité.

## 📺 Aperçu
[Regarder sur YouTube](https://youtu.be/lB8A9YSvpiU)

## Description
Un système de gilet pare-balles réaliste pour FiveM offrant trois niveaux de protection différents, chacun avec ses propres caractéristiques de durabilité et de protection. Le script inclut une interface utilisateur intuitive montrant la durabilité du gilet et un système de dégâts réaliste.

## Caractéristiques
- 3 types de gilets différents (Kevlar, Céramique, Acier)
- Système de durabilité avancé
- Protection réaliste contre les dégâts
- Interface utilisateur intuitive
- Entièrement configurable
- Compatible ESX

## ⚙️ Prérequis
- ESX Framework
- es_extended
- oxmysql

## Installation
1. **Téléchargez les fichiers** dans votre dossier resources
2. **Ajoutez** à votre `server.cfg`:
```cfg
ensure stx_bulletproof
```
3. **Importez** les items dans votre base de données :
```sql
INSERT INTO `items` (`name`, `label`, `weight`) VALUES
    ('kevlar_vest', 'Gilet Kevlar', 1),
    ('ceramic_vest', 'Gilet Céramique', 1),
    ('steel_vest', 'Gilet Acier', 1);
```

## 🖼️ Images d'Inventaire

### Pour les utilisateurs de ox_inventory
Les images sont incluses dans le dossier `images`. Il suffit de les copier dans :
```
ox_inventory/web/images/
```

![kevlar_ceramic_steel_vest](https://github.com/user-attachments/assets/e877e021-1cb3-4254-98c4-0e704f128d56)

### Pour les autres systèmes d'inventaire
Si vous utilisez un système d'inventaire différent, vous trouverez les images des items dans le dossier `images`. Il vous suffit de copier ces images dans le répertoire d'images de votre système d'inventaire en suivant la documentation de votre script d'inventaire.


## Configuration
Le fichier `config.lua` vous permet de modifier :
```lua
Config.Vests = {
    kevlar_vest = {
        durability = 6,            -- Durabilité maximale
        damageReduction = 0.3,      -- Réduction des dégâts (30%)
        appearance = {
            component = 9,          -- ID du composant
            drawable = 6,           -- ID du drawable
            texture = 0,            -- ID de la texture
            palette = 0             -- ID de la palette
        }
    },
    -- Configurations des autres gilets...
}
```

## Utilisation
1. Donnez les gilets via les commandes admin ou votre système d'inventaire
2. Les joueurs peuvent utiliser le gilet depuis leur inventaire
3. L'interface affiche la durabilité restante
4. Le gilet se détruit automatiquement quand sa durabilité atteint 0

## Commandes Admin
```
/giveitem [ID] kevlar_vest [quantité]
/giveitem [ID] ceramic_vest [quantité]
/giveitem [ID] steel_vest [quantité]
```

## Caractéristiques des gilets (tout est modifiable)
- **Gilet Kevlar**
  - Durabilité : 6 impacts
  - Protection : 30% de réduction des dégâts

- **Gilet Céramique**
  - Durabilité : 4 impacts
  - Protection : 65% de réduction des dégâts

- **Gilet Acier**
  - Durabilité : 8 impacts
  - Protection : 50% de réduction des dégâts

## 🛠️ Caractéristiques Techniques
- Réduction des dégâts de 50%
- Interface NUI responsive
- Barre de progression visuelle de la durabilité
- Système de détection d'impact au torse
- Animation réaliste d'équipement

## 📞 Support
Pour toute question ou problème :
- Rejoignez notre Discord [\[lien à ajouter\]](https://discord.com/invite/reJ8V49A4f)

## Crédits
Développé par Saaytex

---
Développé avec ❤️ pour la communauté FiveM
