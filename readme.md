# FiveM Bulletproof Vest System

A realistic bulletproof vest system for FiveM with user interface and durability system.

## 📺 Preview

[Watch on YouTube](https://youtu.be/lB8A9YSvpiU)
[![Video Preview](https://img.shields.io/badge/YouTube-Preview-red)](https://youtu.be/lB8A9YSvpiU)

## 📋 Features

- 3 different types of bulletproof vests (Kevlar, Ceramic, Steel)
- Unique durability system for each vest type
- Real-time UI displaying durability
- Equipment animation
- Damage reduction based on vest type
- Full ESX integration

## 🚀 Installation

1. Download the files
2. Place the `stx_bulletproof` folder in your `resources` directory
3. Add `ensure stx_bulletproof` to your `server.cfg`
4. Import `stx_bulletproof.sql` into your database

### ⚙️ Dependencies

- es_extended
- oxmysql

## 💾 Vest Configuration

You can modify vest properties in `client.lua`:

```lua
local bulletproof = {
    {material = "kevlar_vest", durability = 10},
    {material = "ceramic_vest", durability = 7},
    {material = "steel_vest", durability = 5}
}
```

## 🎮 Usage

1. Obtain a vest through inventory
2. Use the vest to equip it
3. Vest durability decreases with each impact
4. Vest automatically deactivates once durability is depleted

## 🛠️ Technical Features

- 50% damage reduction
- Responsive NUI interface
- Visual durability progress bar
- Torso impact detection system
- Realistic equipment animation

## 📊 Vest Types and Durability

| Vest Type | Durability | Description |
|-----------|------------|-------------|
| Kevlar | 10 | Best durability |
| Ceramic | 7 | Medium durability |
| Steel | 5 | Low durability |

## 🔧 Customization

You can modify the NUI interface appearance by editing `html/index.html`.

To modify vest properties:
1. Adjust durability values in `client.lua`
2. Modify damage reduction in the `vest:equip` event function
3. Customize animations through the `animation()` function

## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## 📞 Support

For questions or issues:
- Join our Discord [\[link to be added\]](https://discord.com/invite/reJ8V49A4f)

---
Developed with ❤️ for the FiveM community