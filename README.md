LibItemBuffs-1.0
================

Buff-to-item database.

[![Build status](https://travis-ci.org/AdiAddons/LibItemBuffs-1.0.svg?branch=master)](https://travis-ci.org/AdiAddons/LibItemBuffs-1.0)

LibItemBuffs-1.0 allows to retrieve the identifier or slot of an item that provides a buff.

This fork keeps one data file per game flavor under `data/` (`vanilla` = Classic Era,
`tbc` = Anniversary, `forever` = WoW: Forever, `retail`), each returning early unless
`lib.flavor` matches the running client. The classic flavors cover:

  * on-use trinkets and other on-use equipment (engineering boots, helmets, ...);
  * consumables: flasks, elixirs, potions, scrolls, food (the Well Fed buff), bandages,
    world buffs (Juju, Zanza, Blasted Lands), engineering explosives and other consumables;
  * temporary weapon enchants (`weaponEnchants`): sharpening stones, weightstones, oils,
    rogue poisons and fishing lures, keyed by the enchant ID GetWeaponEnchantInfo() returns.

Permanent enchant procs (Crusader, Mongoose...) are not tracked on the classic flavors.

The classic files are seeded from the client DB2 tables by `scripts/spell-db/item-db.py`
(outside this repository) and hand-maintained after that; `-- REVIEW:` comments mark
entries that need an in-game check. `data/retail.lua` is upstream's 2018 (BfA) extract.

## Embedding LibItemBuffs-1.0

### Manually

Just copy the whole package somewhere in your addon and reference the file LibItemBuffs-1.0.xml in your TOC file.

### Using the wowace packager

Add the following lines into your .pkgmeta:

```
externals:
  libs/LibItemBuffs-1.0:
    url: git://github.com/AdiAddons/LibItemBuffs-1.0.git
    tag: latest
```

And these in your TOC file:

```
libs\LibItemBuffs-1.0\LibItemBuffs-1.0.xml
```

## Using LibItemBuffs-1.0

```lua
local LIB = LibStub("LibItemBuffs-1.0")
LIB:GetItemBuffs(13452)           -- 17538: Elixir of the Mongoose
LIB:GetItemWeaponEnchants(3239)   -- 19: Rough Weightstone's "Weighted +2"
LIB:GetWeaponEnchantItemID(19)    -- 3239
LIB:GetBuffInventorySlot(23782)   -- INVSLOT_TRINKET1 when Lifegiving Gem is equipped there
LIB:IsItemBuff(17538)             -- true
```

## License

LibItemBuffs-1.0 is licensed using the GPL v3.
