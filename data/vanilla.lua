--[[
LibItemBuffs-1.0 - buff-to-item database.
(c) 2013-2018 Adirelle (adirelle@gmail.com)

This file is part of LibItemBuffs-1.0.

LibItemBuffs-1.0 is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

LibItemBuffs-1.0 is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with LibItemBuffs-1.0. If not, see <http://www.gnu.org/licenses/>.
--]]

local lib = LibStub('LibItemBuffs-1.0', true)
if not lib then return end
if lib.flavor ~= 'vanilla' then return end

-- Seeded by scripts/spell-db/item-db.py gen vanilla (client build 1.15.8.67156), hand-maintained since.
-- Keys are the buff spell ids (enchant ids for weaponEnchants), values the item id(s) providing them.

local trinkets = {
	-- On-use trinkets
	[  12257] = 744, -- Breath of Fire (Thunderbrew's Boot Flask)
	[    835] = 1404, -- Tidal Charm
	[  16739] = 1973, -- Orb of Deception
	[  13744] = 2802, -- Blazing Emblem
	[  14530] = 2820, -- Speed (Nifty Stopwatch)
	[   4079] = 4397, -- Cloaking (Gnomish Cloaking Device)
	[   1139] = 5079, -- Cold Eye (Cold Basilisk Eye)
	[  12733] = 10418, -- Fearless (Glimmering Mithril Insignia)
	[  12766] = 10455, -- Poison Cloud (Chained Essence of Eranikus)
	[  13237] = 10577, -- Goblin Mortar
	[  13278] = 10645, -- Gnomish Death Ray
	[  13003] = 10716, -- Shrink Ray (Gnomish Shrink Ray) -- REVIEW: aura found through the description of dummy spell 13006
	[  13099] = 10720, -- Net-o-Matic (Gnomish Net-o-Matic Projector) -- REVIEW: aura found through the description of dummy spell 13120
	[  13183] = 10727, -- Goblin Dragon Gun
	[  15604] = 11819, -- Second Wind
	[  15646] = 11832, -- Burst of Knowledge
	[  15752] = 11905, -- Disarm (Linken's Boomerang)
	[  15753] = 11905, -- Knockdown (Linken's Boomerang)
	[  17275] = 13164, -- Heart of the Scale
	[  17330] = 13213, -- Poison (Smolderweb's Eye)
	[  17668] = 13515, -- Ramstein's Lightning Bolts
	[  19638] = 15867, -- Prismstone (Prismcharm)
	[  20587] = 15873, -- Ragged John's Neverending Cup
	[  21956] = 17759, -- Physical Protection (Mark of Resolution)
	[  23131] = 18634, -- Frost Reflector (Gyrofreeze Ice Reflector)
	[  23097] = 18638, -- Fire Reflector (Hyper-Radiant Flame Reflector)
	[  23132] = 18639, -- Shadow Reflector (Ultra-Flash Shadow Reflector)
	[  23271] = 18820, -- Ephemeral Power (Talisman of Ephemeral Power)
	[  23506] = 19024, -- Aura of Protection (Arena Grand Master)
	[  23721] = 19336, -- Arcane Infused (Arcane Infused Gem)
	[  23720] = 19337, -- Blessing of the Black Book (The Black Book)
	[  23723] = 19339, -- Mind Quickening (Mind Quickening Gem)
	[  23724] = 19340, -- Metamorphosis Rune (Rune of Metamorphosis)
	[  23782] = 19341, -- Gift of Life (Lifegiving Gem) -- REVIEW: same-name aura of dummy spell 23725, verify in-game
	[  23726] = 19342, -- Venomous Totem
	[  23733] = 19343, -- Blinding Light (Scrolls of Blinding Light)
	[  23734] = 19344, -- Nature Aligned (Natural Alignment Crystal)
	[  23780] = 19345, -- Aegis of Preservation
	[  24268] = 19930, -- Mar'li's Brain Boost (Mar'li's Eye)
	[  24610] = 19947, -- Pagle's Broken Reel (Nat Pagle's Broken Reel)
	[  24574] = 19948, -- Brittle Armor (Zandalarian Hero Badge)
	[  24661] = 19949, -- Restless Strength (Zandalarian Hero Medallion)
	[  24658] = 19950, -- Unstable Power (Zandalarian Hero Charm)
	[  24498] = 19952, -- Brilliant Light (Gri'lek's Charm of Valor)
	[  24542] = 19955, -- Nimble Healing Touch (Wushoolay's Charm of Nature)
	[  24499] = 19956, -- Energized Shield (Wushoolay's Charm of Spirits)
	[  24543] = 19957, -- Massive Destruction (Hazza'rah's Charm of Destruction)
	[  24546] = 19958, -- Rapid Healing (Hazza'rah's Charm of Healing)
	[  24544] = 19959, -- Arcane Potency (Hazza'rah's Charm of Magic)
	[  24354] = 19990, -- Prayer Beads Blessing (Blessed Prayer Beads)
	[  24352] = 19991, -- Devilsaur Fury (Devilsaur Eye)
	[  24389] = 20036, -- Chaos Fire (Fire Ruby)
	[  23991] = { 20071, 20072 }, -- Damage Absorb (Talisman of Arathor, Defiler's Talisman)
	[   8312] = 20084, -- Trap (Hunting Net)
	[  24427] = 20130, -- Diamond Flask -- REVIEW: aura found through the description of dummy spell 363880
	[  24865] = 20512, -- Sanctified Orb
	[  24884] = 20525, -- Earthen Sigil
	[  24998] = 20636, -- Healing of the Ages (Hibernation Crystal)
	[  25746] = { 21115, 21117 }, -- Damage Absorb (Defiler's Talisman, Talisman of Arathor)
	[  25747] = { 21116, 21118 }, -- Damage Absorb (Defiler's Talisman, Talisman of Arathor)
	[  25750] = { 21119, 21120 }, -- Damage Absorb (Talisman of Arathor, Defiler's Talisman)
	[  25891] = 21180, -- Earthstrike
	[  26166] = 21473, -- Obsidian Insight (Eye of Moam)
	[  26168] = 21488, -- Chitinous Spikes (Fetish of Chitinous Spikes)
	[  26467] = 21625, -- Persistent Shield (Scarab Brooch)
	[  26400] = 21647, -- Arcane Shroud (Fetish of the Sand Reaver)
	[  26480] = 21670, -- Badge of the Swarmguard
	[  26463] = 21685, -- Mercurial Shield (Petrified Scarab)
	[  27675] = 22268, -- Chromatic Infusion (Draconic Infused Emblem)
	[  28200] = 22678, -- Ascendance (Talisman of Ascendance)
	[  28866] = 22954, -- Kiss of the Spider
	[  28862] = 23001, -- The Eye of Diminution (Eye of Diminution)
	[  28773] = 23040, -- Glyph of Deflection
	[  28777] = 23041, -- Slayer's Crest
	[  28778] = 23042, -- Loatheb's Reflection
	[  28779] = 23046, -- Essence of Sapphiron (The Restrained Essence of Sapphiron)
	[  28780] = 23047, -- The Eye of the Dead (Eye of the Dead)
	[  29506] = 23558, -- The Burrower's Shell
	[  29602] = 23570, -- Jom Gabbar
	-- Other on-use equipment
	[  18820] = 940, -- Insight (Robes of Insight)
	[  18826] = 1447, -- Savior's Sacrifice (Ring of Saviors)
	[   9774] = { 4328, 7936 }, -- Immune Root (Spider Belt, Ornate Mithril Boots)
	[  14253] = 4444, -- Abolish Poison (Black Husk Shield)
	[   5024] = 4984, -- Flee (Skull of Impending Doom)
	[   6298] = 5387, -- Form of the Moonstalker (Enchanted Moonstalker Cloak)
	[    128] = 5522, -- Spellstone
	[  18956] = 6898, -- Restore Life (Orb of Soran'ruk)
	[   8892] = 7189, -- Goblin Rocket Boots
	[   9176] = 7344, -- Holy Sunder (Torch of Holy Flame)
	[   9175] = 7391, -- Running Speed (Swift Boots)
	[  10578] = 8348, -- Fireball (Helm of Fire)
	[  10618] = 8367, -- Elemental Protection (Dragonscale Breastplate)
	[  13327] = { 9394, 10588 }, -- Reckless Charge (Horned Viking Helmet, Goblin Rocket Helmet)
	[  12438] = { 9404, 10518 }, -- Slow Fall (Olaf's All Purpose Shield, Parachute Cloak)
	[  13494] = 9449, -- Haste (Manual Crowd Pummeler)
	[  11826] = 9492, -- Electromagnetic Gigaflux Reactivator
	[  11841] = 9492, -- Static Barrier (Electromagnetic Gigaflux Reactivator)
	[  12022] = 10030, -- Admiral's Hat
	[  12561] = 10543, -- Fire Protection (Goblin Construction Helmet)
	[  13234] = 10721, -- Harm Prevention Belt (Gnomish Harm Prevention Belt)
	[  13141] = 10724, -- Gnomish Rocket Boots
	[  13181] = 10726, -- Gnomish Mind Control Cap -- REVIEW: aura found through the description of dummy spell 13180
	[  17447] = 11808, -- Circle of Flame
	[  16470] = 12532, -- Gift of Stone (Spire of the Stoneshaper)
	[  17252] = 13143, -- Mark of the Dragon Lord
	[  17368] = 13289, -- Egan's Blaster
	[  17729] = 13602, -- Greater Spellstone
	[  17730] = 13603, -- Major Spellstone
	[  18264] = 13937, -- Headmaster's Charge
	[  18364] = 14134, -- Cloak of Fire
	[  18787] = 14554, -- Heaven's Blessing (Cloudkeeper Legplates)
	[  18957] = { 15107, 15108 }, -- Restore Life (Orb of Noh'Orahil, Orb of Dar'Orahil)
	[  19634] = 15866, -- Mana Rejuvenation (Veildust Medicine Bag)
	[  20631] = 16768, -- Furbolg Medicine Pouch
}

local consumables = {
	-- Flasks
	[  17626] = 13510, -- Flask of the Titans
	[  17627] = 13511, -- Distilled Wisdom (Flask of Distilled Wisdom)
	[  17628] = 13512, -- Supreme Power (Flask of Supreme Power)
	[  17629] = 13513, -- Chromatic Resistance (Flask of Chromatic Resistance)
	-- Elixirs
	[   2367] = 2454, -- Lesser Strength (Elixir of Lion's Strength)
	[   2374] = 2457, -- Lesser Agility (Elixir of Minor Agility)
	[   2378] = 2458, -- Health (Elixir of Minor Fortitude)
	[   3166] = 3383, -- Lesser Intellect (Elixir of Wisdom)
	[   3220] = 3389, -- Armor (Elixir of Defense)
	[   3160] = 3390, -- Agility (Elixir of Lesser Agility)
	[   3164] = 3391, -- Strength (Elixir of Ogre's Strength)
	[   3593] = 3825, -- Health II (Elixir of Fortitude)
	[   6512] = 3828, -- Detect Lesser Invisibility (Elixir of Detect Lesser Invisibility)
	[   7178] = 5996, -- Water Breathing (Elixir of Water Breathing)
	[   7844] = 6373, -- Fire Power (Elixir of Firepower)
	[   8212] = 6662, -- Enlarge (Elixir of Giant Growth)
	[  16591] = 8529, -- Noggenfogger Elixir -- REVIEW: same-name aura of dummy spell 16589, verify in-game
	[  16593] = 8529, -- Noggenfogger Elixir -- REVIEW: same-name aura of dummy spell 16589, verify in-game
	[  16595] = 8529, -- Noggenfogger Elixir -- REVIEW: same-name aura of dummy spell 16589, verify in-game
	[  11319] = 8827, -- Water Walking (Elixir of Water Walking)
	[  11328] = 8949, -- Agility (Elixir of Agility)
	[  11349] = 8951, -- Armor (Elixir of Greater Defense)
	[  11371] = 9088, -- Gift of Arthas
	[  11389] = 9154, -- Detect Undead (Elixir of Detect Undead)
	[  11390] = 9155, -- Arcane Elixir
	[  11396] = 9179, -- Greater Intellect (Elixir of Greater Intellect)
	[  11334] = 9187, -- Greater Agility (Elixir of Greater Agility)
	[  11403] = 9197, -- Dream Vision (Elixir of Dream Vision)
	[  11405] = 9206, -- Elixir of the Giants (Elixir of Giants)
	[  11406] = 9224, -- Elixir of Demonslaying
	[  11407] = 9233, -- Detect Demon (Elixir of Detect Demon)
	[  11474] = 9264, -- Shadow Power (Elixir of Shadow Power)
	[  12608] = 10592, -- Stealth Detection (Catseye Elixir)
	[  11348] = 13445, -- Greater Armor (Elixir of Superior Defense)
	[  17535] = 13447, -- Elixir of the Sages
	[  17538] = 13452, -- Elixir of the Mongoose
	[  17537] = 13453, -- Elixir of Brute Force
	[  17539] = 13454, -- Greater Arcane Elixir
	[  21920] = 17708, -- Frost Power (Elixir of Frost Power)
	[  22807] = 18294, -- Greater Water Breathing (Elixir of Greater Water Breathing)
	[  26276] = 21546, -- Greater Firepower (Elixir of Greater Firepower)
	-- Potions
	[    806] = 1450, -- Fervor (Potion of Fervor)
	[   2379] = 2459, -- Speed (Swiftness Potion)
	[   3219] = 3382, -- Regeneration (Weak Troll's Blood Potion)
	[   2380] = 3384, -- Resistance (Minor Magic Resistance Potion)
	[   3169] = 3387, -- Invulnerability (Limited Invulnerability Potion)
	[   3222] = 3388, -- Regeneration (Strong Troll's Blood Potion)
	[   3680] = 3823, -- Lesser Invisibility (Lesser Invisibility Potion)
	[   3223] = 3826, -- Regeneration (Mighty Troll's Blood Potion)
	[   4941] = 4623, -- Stoneshield (Lesser Stoneshield Potion)
	[   6614] = 5632, -- Cowardly Flight (Cowardly Flight Potion)
	[   6615] = 5634, -- Free Action (Free Action Potion)
	[   7242] = 6048, -- Shadow Protection  (Shadow Protection Potion)
	[   7233] = 6049, -- Fire Protection (Fire Protection Potion)
	[   7239] = 6050, -- Frost Protection (Frost Protection Potion)
	[   7245] = 6051, -- Holy Protection  (Holy Protection Potion)
	[   7254] = 6052, -- Nature Protection  (Nature Protection Potion)
	[   7840] = 6372, -- Swim Speed (Swim Speed Potion)
	[  11359] = 9030, -- Restoration (Restorative Potion)
	[  11364] = 9036, -- Resistance (Magic Resistance Potion)
	[  11392] = 9172, -- Invisibility (Invisibility Potion)
	[  15822] = 12190, -- Dreamless Sleep (Dreamless Sleep Potion)
	[  17528] = 13442, -- Mighty Rage (Mighty Rage Potion)
	[  17540] = 13455, -- Greater Stoneshield (Greater Stoneshield Potion)
	[  17544] = 13456, -- Frost Protection (Greater Frost Protection Potion)
	[  17543] = 13457, -- Fire Protection (Greater Fire Protection Potion)
	[  17546] = 13458, -- Nature Protection  (Greater Nature Protection Potion)
	[  17548] = 13459, -- Shadow Protection  (Greater Shadow Protection Potion)
	[  17545] = 13460, -- Holy Protection  (Greater Holy Protection Potion)
	[  17549] = 13461, -- Arcane Protection (Greater Arcane Protection Potion)
	[  24360] = 20002, -- Greater Dreamless Sleep (Greater Dreamless Sleep Potion)
	[  24361] = 20004, -- Regeneration (Major Troll's Blood Potion)
	[  24363] = 20007, -- Mana Regeneration (Mageblood Potion)
	[  24364] = 20008, -- Living Free Action (Living Action Potion)
	-- Scrolls
	[   8118] = 954, -- Strength (Scroll of Strength)
	[   8096] = 955, -- Intellect (Scroll of Intellect)
	[   8099] = 1180, -- Stamina (Scroll of Stamina)
	[   8112] = 1181, -- Spirit (Scroll of Spirit)
	[   8116] = 1477, -- Agility (Scroll of Agility II)
	[   8094] = 1478, -- Armor (Scroll of Protection II)
	[   8100] = 1711, -- Stamina (Scroll of Stamina II)
	[   8113] = 1712, -- Spirit (Scroll of Spirit II)
	[   8119] = 2289, -- Strength (Scroll of Strength II)
	[   8097] = 2290, -- Intellect (Scroll of Intellect II)
	[   8115] = 3012, -- Agility (Scroll of Agility)
	[   8091] = 3013, -- Armor (Scroll of Protection)
	[   8098] = 4419, -- Intellect (Scroll of Intellect III)
	[   8095] = 4421, -- Armor (Scroll of Protection III)
	[   8101] = 4422, -- Stamina (Scroll of Stamina III)
	[   8114] = 4424, -- Spirit (Scroll of Spirit III)
	[   8117] = 4425, -- Agility (Scroll of Agility III)
	[   8120] = 4426, -- Strength (Scroll of Strength III)
	[  12175] = 10305, -- Armor (Scroll of Protection IV)
	[  12177] = 10306, -- Spirit (Scroll of Spirit IV)
	[  12178] = 10307, -- Stamina (Scroll of Stamina IV)
	[  12176] = 10308, -- Intellect (Scroll of Intellect IV)
	[  12174] = 10309, -- Agility (Scroll of Agility IV)
	[  12179] = 10310, -- Strength (Scroll of Strength IV)
	-- Food and drink (Well Fed and similar buffs, not the eating channel)
	[  19706] = { 724, 2683, 2684, 2687, 3220, 3662, 5476, 5477, 5525 }, -- Well Fed (Goretusk Liver Pie, Crab Cake, Coyote Steak, Dry Pork Ribs, Blood Sausage, Crocolisk Steak, Fillet of Frenzy, Strider Stew, Boiled Clams)
	[  19708] = { 1017, 1082, 3663, 3664, 3665, 3666, 3726, 3727, 5479, 5480, 5527, 12209 }, -- Well Fed (Seasoned Wolf Kabob, Redridge Goulash, Murloc Fin Soup, Crocolisk Gumbo, Curiously Tasty Omelet, Gooey Spider Cake, Big Bear Steak, Hot Lion Chops, Crispy Lizard Tail, Lean Venison, Goblin Deviled Clams, Lean Wolf Steak)
	[    833] = 1401, -- Green Tea (Green Tea Leaf)
	[  19705] = { 2680, 2888, 5472, 5474, 6888, 7806, 7807, 7808, 11584, 12224, 17197, 17198, 17199 }, -- Well Fed (Spiced Wolf Meat, Beer Basted Boar Ribs, Kaldorei Spider Kabob, Roasted Kodo Meat, Herb Baked Egg, Lollipop, Candy Bar, Chocolate Square, Cactus Apple Surprise, Crispy Bat Wing, Gingerbread Cookie, Egg Nog, Bad Egg Nog)
	[  19709] = { 3728, 3729, 4457, 6038, 12210, 12211, 12212, 12213, 12214, 13851, 20074 }, -- Well Fed (Tasty Lion Steak, Soothing Turtle Bisque, Barbecued Buzzard Wing, Giant Clam Scorcho, Roast Raptor, Spiced Wolf Ribs, Jungle Stew, Carrion Surprise, Mystery Stew, Hot Wolf Ribs, Heavy Crocolisk Stew)
	[   5909] = 5265, -- Watered-down Beer
	[   6114] = 5342, -- Raptor Punch
	[   6411] = 5473, -- Scorpid Poison (Scorpid Surprise)
	[  19710] = { 12215, 12216, 12218, 16971, 17222, 18045 }, -- Well Fed (Heavy Kodo Stew, Spiced Chili Crab, Monster Omelet, Clamlette Surprise, Spider Sausage, Tender Wolf Steak)
	[  15852] = 12217, -- Dragonbreath Chili
	[  18124] = 13810, -- Blessed Sunfruit
	[  18125] = 13810, -- Blessed Sunfruit
	[  18192] = 13928, -- Increased Agility (Grilled Squid)
	[  18193] = 13929, -- Increased Spirit (Hot Smoked Bass)
	[  18194] = 13931, -- Mana Regeneration (Nightfin Soup)
	[  18222] = 13932, -- Health Regeneration (Poached Sunscale Salmon)
	[  21149] = 17198, -- Egg Nog
	[  22730] = 18254, -- Increased Intellect (Runn Tum Tuber Surprise)
	[  24799] = 20452, -- Well Fed (Smoked Desert Dumplings)
	[  25661] = 21023, -- Increased Stamina (Dirge's Kickin' Chimaerok Chops)
	[  25694] = 21072, -- Well Fed (Smoked Sagefish)
	[  25703] = 21072, -- Brain Food (Smoked Sagefish)
	[  25990] = 21215, -- Graccu's Mince Meat Fruitcake
	[  25889] = 21217, -- Brain Food (Sagefish Delight)
	[  25941] = 21217, -- Well Fed (Sagefish Delight)
	[  29055] = 23172, -- Refreshing Red Apple
	-- Bandages (the First Aid channel)
	[    746] = 1251, -- First Aid (Linen Bandage)
	[   1159] = 2581, -- First Aid (Heavy Linen Bandage)
	[   3267] = 3530, -- First Aid (Wool Bandage)
	[   3268] = 3531, -- First Aid (Heavy Wool Bandage)
	[   7926] = 6450, -- First Aid (Silk Bandage)
	[   7927] = 6451, -- First Aid (Heavy Silk Bandage)
	[  10838] = 8544, -- First Aid (Mageweave Bandage)
	[  10839] = 8545, -- First Aid (Heavy Mageweave Bandage)
	[  18608] = 14529, -- First Aid (Runecloth Bandage)
	[  18610] = 14530, -- First Aid (Heavy Runecloth Bandage)
	[  23567] = 19066, -- First Aid (Warsong Gulch Runecloth Bandage)
	[  23568] = 19067, -- First Aid (Warsong Gulch Mageweave Bandage)
	[  23569] = 19068, -- First Aid (Warsong Gulch Silk Bandage)
	[  23696] = 19307, -- First Aid (Alterac Heavy Runecloth Bandage)
	[  24413] = { 20065, 20232, 20237 }, -- First Aid (Arathi Basin Mageweave Bandage, Defiler's Mageweave Bandage, Highlander's Mageweave Bandage)
	[  24414] = { 20066, 20234, 20243 }, -- First Aid (Arathi Basin Runecloth Bandage, Defiler's Runecloth Bandage, Highlander's Runecloth Bandage)
	[  24412] = { 20067, 20235, 20244 }, -- First Aid (Arathi Basin Silk Bandage, Defiler's Silk Bandage, Highlander's Silk Bandage)
	[  30020] = 23684, -- First Aid (Crystal Infused Bandage)
	-- Juju, Zanza, Blasted Lands and other world/raid consumables
	[  10667] = 8410, -- Rage of Ages (R.O.I.D.S.)
	[  10668] = 8411, -- Spirit of Boar (Lung Juice Cocktail)
	[  10669] = 8412, -- Strike of the Scorpok (Ground Scorpok Assay)
	[  10692] = 8423, -- Infallible Mind (Cerebral Cortex Compound)
	[  10693] = 8424, -- Spiritual Domination (Gizzard Gum)
	[  15229] = 11562, -- Crystal Restore
	[  15231] = 11563, -- Crystal Force
	[  15233] = 11564, -- Crystal Ward
	[  15235] = 11565, -- Crystal Yield
	[  15279] = 11567, -- Crystal Spire
	[  16322] = 12450, -- Juju Flurry
	[  16323] = 12451, -- Juju Power
	[  16326] = 12455, -- Juju Ember
	[  16325] = 12457, -- Juju Chill
	[  16327] = 12458, -- Juju Guile
	[  16321] = 12459, -- Juju Escape
	[  16329] = 12460, -- Juju Might
	[  17038] = 12820, -- Winterfall Firewater
	[  17624] = 13506, -- Petrification (Flask of Petrification)
	[  20875] = 17048, -- Rumsey Rum
	[  22789] = 18269, -- Gordok Green Grog
	[  22790] = 18284, -- Kreeg's Stout Beatdown
	[  24382] = 20079, -- Spirit of Zanza
	[  24417] = 20080, -- Sheen of Zanza
	[  30003] = { 20080, 23794 }, -- Sheen of Zanza (Sheen of Zanza, Permanent Sheen of Zanza)
	[  24383] = 20081, -- Swiftness of Zanza
	[  25037] = 20709, -- Rumsey Rum Light
	[  25722] = 21114, -- Rumsey Rum Dark
	[  25804] = 21151, -- Rumsey Rum Black Label
	[  27653] = 22192, -- Elixir of Dodging (Bloodkelp Elixir of Dodging)
	[  27652] = 22193, -- Elixir of Resistance (Bloodkelp Elixir of Resistance)
	[  30088] = 23194, -- Lesser Mark of the Dawn
	[  30089] = 23195, -- Mark of the Dawn
	[  30090] = 23196, -- Greater Mark of the Dawn
	[  29334] = 23211, -- Toasted Smorc
	[  29333] = 23326, -- Midsummer Sausage
	[  29332] = 23327, -- Fire-toasted Bun
	[  29335] = 23435, -- Elderberry Pie
	[  30331] = 23794, -- Permanent Sheen of Zanza
	[  30336] = 23795, -- Permanent Spirit of Zanza
	[  30338] = 23796, -- Permanent Swiftness of Zanza
	-- Engineering explosives and devices (debuffs on the target)
	[   8312] = { 835, 4941 }, -- Trap (Large Rope Net, Really Sticky Glue)
	[   2120] = 1127, -- Flamestrike (Flash Bundle)
	[   4064] = 4360, -- Rough Copper Bomb
	[   4065] = 4370, -- Large Copper Bomb
	[   4066] = 4374, -- Small Bronze Bomb
	[   4067] = { 4380, 4403 }, -- Big Bronze Bomb (Big Bronze Bomb, Portable Bronze Mortar)
	[   4060] = 4388, -- Discombobulate (Discombobulator Ray)
	[   4068] = 4390, -- Iron Grenade
	[   4069] = 4394, -- Big Iron Bomb
	[   5134] = 4852, -- Flash Bomb
	[  12421] = 10514, -- Mithril Frag Bomb
	[  12543] = 10562, -- Hi-Explosive Bomb
	[  12562] = 10586, -- The Big One
	[  13808] = 10830, -- M73 Frag Grenade
	[  19769] = 15993, -- Thorium Grenade
	[  19784] = 16005, -- Dark Iron Bomb
	[  19821] = 16040, -- Arcane Bomb
	-- Other consumables
	[    673] = { 1177, 5997 }, -- Lesser Armor (Oil of Olaf, Elixir of Minor Defense)
	[   5917] = { 1191, 18209 }, -- Fumble (Bag of Marbles, Energized Sparkplug)
	[   5257] = 1262, -- Thunderbrew (Keg of Thunderbrew)
	[   7396] = 1322, -- Fishliver Oil
	[    133] = 1399, -- Fireball (Magic Candle)
	[     65] = 1400, -- Haste (Swiftfeather Token)
	[    143] = 1402, -- Fireball (Brimstone)
	[  13424] = 1434, -- Faerie Fire (Glowing Wax Stick)
	[   1138] = 1703, -- Crystal Protection (Crystal Basilisk Spine)
	[   8070] = 1970, -- Rejuvenation (Restoring Balm)
	[   1090] = 2091, -- Sleep (Magic Dust)
	[    700] = 3434, -- Sleep (Slumber Sand)
	[   4057] = 4376, -- Fire Resistance (Flame Deflector)
	[   4077] = 4386, -- Frost Resistance (Ice Deflector)
	[   4318] = 4546, -- Guile of the Raptor (Call of the Raptor)
	[   5020] = 4952, -- Stormstout
	[   5021] = 4953, -- Trogg Ale (Trogg Brew)
	[   5665] = 5206, -- Fury of the Bogling (Bogling Root)
	[  20707] = 5232, -- Soulstone Resurrection (Minor Soulstone)
	[   8277] = 5457, -- Voodoo Hex (Severed Voodoo Claw)
	[   6724] = 5816, -- Light of Elune
	[   6727] = 5823, -- Poison Mushroom (Poisonous Mushroom)
	[   8202] = 6635, -- Sapta Sight (Earth Sapta)
	[   8898] = 6636, -- Sapta Sight (Fire Sapta)
	[   8899] = 6637, -- Sapta Sight (Water Sapta)
	[   8900] = 6638, -- Sapta Sight (Air Sapta)
	[  11350] = 8956, -- Fire Shield (Oil of Immolation)
	[  12438] = 10684, -- Slow Fall (Colossal Parachute)
	[  18191] = { 11950, 13927, 13934 }, -- Increased Stamina (Windblossom Berries, Cooked Glossy Mightfish, Mightfish Steak)
	[  26030] = 11950, -- Windblossom Berries
	[  16629] = 12650, -- Attuned Dampener
	[    126] = 13508, -- Eye of Kilrogg (Eye of Arachnida)
	[  17639] = 13514, -- Wail of the Banshee
	[  18140] = 13813, -- Blessed Sunfruit Juice
	[  18141] = 13813, -- Blessed Sunfruit Juice
	[  20762] = 16892, -- Soulstone Resurrection (Lesser Soulstone)
	[  20763] = 16893, -- Soulstone Resurrection (Soulstone)
	[  20764] = 16895, -- Soulstone Resurrection (Greater Soulstone)
	[  20765] = 16896, -- Soulstone Resurrection (Major Soulstone)
	[  21167] = { 17202, 21038 }, -- Snowball (Snowball, Hardpacked Snowball) -- REVIEW: same-name aura of dummy spell 21343, verify in-game; same-name aura of dummy spell 25677, verify in-game
	[  21955] = 17747, -- Razorlash Root
	[  23697] = 19318, -- Alterac Spring Water (Bottled Alterac Spring Water)
	[  23698] = 19318, -- Alterac Spring Water (Bottled Alterac Spring Water)
	[  24924] = 20557, -- Hallow's End Candy (Hallow's End Pumpkin Treat) -- REVIEW: same-name aura of dummy spell 24930, verify in-game
	[  24925] = 20557, -- Hallow's End Candy (Hallow's End Pumpkin Treat) -- REVIEW: same-name aura of dummy spell 24930, verify in-game
	[  24926] = 20557, -- Hallow's End Candy (Hallow's End Pumpkin Treat) -- REVIEW: same-name aura of dummy spell 24930, verify in-game
	[  24927] = 20557, -- Hallow's End Candy (Hallow's End Pumpkin Treat) -- REVIEW: same-name aura of dummy spell 24930, verify in-game
	[  24833] = 20620, -- Holy Mightstone
	[  25701] = 21071, -- Brain Food (Raw Sagefish)
	[  25887] = 21153, -- Brain Food (Raw Greater Sagefish)
	[  26004] = 21519, -- Mistletoe
	[  26263] = 21537, -- Dim Sum (Festival Dumplings)
	[  27720] = 22236, -- Buttermilk Delight
	[  27723] = 22237, -- Dark Desire
	[  27721] = 22238, -- Very Berry Cream
	[  27722] = 22239, -- Sweet Surprise
	[  29432] = 22682, -- Fire Protection (Frozen Rune)
	[  29006] = 23164, -- Bubbly Refreshment (Bubbly Beverage)
	[  29041] = 23175, -- Tasty Summer Treat
	[  29042] = 23175, -- Glowy (iCoke Promotion) (Tasty Summer Treat)
	[  29038] = 23176, -- Fizzy Energy Drink
	[  29039] = 23176, -- Fizzy Energy Drink
	[  29040] = 23176, -- Fizzy Energy Drink
	[ 370303] = 191268, -- Orb of Corruption -- REVIEW: Season of Mastery-era item Orb of Corruption (191268), verify it is obtainable on era
	[ 370308] = 191272, -- Rod of Necromancy -- REVIEW: Season of Mastery-era item Rod of Necromancy (191272), verify it is obtainable on era
	[ 370336] = 191280, -- Fungal Spore Cluster -- REVIEW: Season of Mastery-era item Fungal Spore Cluster (191280), verify it is obtainable on era
	[ 370427] = 191313, -- Mask of Death -- REVIEW: Season of Mastery-era item Mask of Death (191313), verify it is obtainable on era; same-name aura of dummy spell 370423, verify in-game
	[ 370431] = 191313, -- Mask of Death -- REVIEW: Season of Mastery-era item Mask of Death (191313), verify it is obtainable on era; same-name aura of dummy spell 370423, verify in-game
	[ 370434] = 191313, -- Mask of Death -- REVIEW: Season of Mastery-era item Mask of Death (191313), verify it is obtainable on era; same-name aura of dummy spell 370423, verify in-game
	[ 370435] = 191313, -- Mask of Death -- REVIEW: Season of Mastery-era item Mask of Death (191313), verify it is obtainable on era; same-name aura of dummy spell 370423, verify in-game
	[ 370436] = 191313, -- Mask of Death -- REVIEW: Season of Mastery-era item Mask of Death (191313), verify it is obtainable on era; same-name aura of dummy spell 370423, verify in-game
	[ 370863] = 191313, -- Mask of Death -- REVIEW: Season of Mastery-era item Mask of Death (191313), verify it is obtainable on era; same-name aura of dummy spell 370423, verify in-game
	[ 370864] = 191313, -- Mask of Death -- REVIEW: Season of Mastery-era item Mask of Death (191313), verify it is obtainable on era; same-name aura of dummy spell 370423, verify in-game
	[ 370552] = 191414, -- Skeletal Artifact -- REVIEW: Season of Mastery-era item Skeletal Artifact (191414), verify it is obtainable on era; aura found through the description of dummy spell 370531
	[ 370831] = 191660, -- Thaddius' Lightning Bolts -- REVIEW: Season of Mastery-era item Thaddius' Lightning Bolts (191660), verify it is obtainable on era
	[ 370832] = 191661, -- Gift of the Spider (Monstrous Spider Fang) -- REVIEW: Season of Mastery-era item Monstrous Spider Fang (191661), verify it is obtainable on era
}

local weaponEnchants = {
	-- Sharpening stones and weightstones
	[     40] = 2862, -- Sharpened +2 (Rough Sharpening Stone)
	[     13] = 2863, -- Sharpened +3 (Coarse Sharpening Stone)
	[     14] = 2871, -- Sharpened +4 (Heavy Sharpening Stone)
	[     19] = 3239, -- Weighted +2 (Rough Weightstone)
	[     20] = 3240, -- Weighted +3 (Coarse Weightstone)
	[     21] = 3241, -- Weighted +4 (Heavy Weightstone)
	[    483] = 7964, -- Sharpened +6 (Solid Sharpening Stone)
	[    484] = 7965, -- Weighted +6 (Solid Weightstone)
	[   1643] = 12404, -- Sharpened +8 (Dense Sharpening Stone)
	[   1703] = 12643, -- Weighted +8 (Dense Weightstone)
	[   2506] = 18262, -- Critical +2% (Elemental Sharpening Stone)
	[   2684] = 23122, -- +100 Attack Power vs Undead (Consecrated Sharpening Stone)
	-- Weapon oils
	[     25] = 3824, -- Shadow Oil
	[     26] = 3829, -- Frost Oil
	[   2623] = 20744, -- Minor Wizard Oil
	[   2624] = 20745, -- Minor Mana Oil
	[   2626] = 20746, -- Lesser Wizard Oil
	[   2625] = 20747, -- Lesser Mana Oil
	[   2629] = 20748, -- Brilliant Mana Oil
	[   2628] = 20749, -- Brilliant Wizard Oil
	[   2627] = 20750, -- Wizard Oil
	[   2685] = 23123, -- +60 Spell Damage vs Undead (Blessed Wizard Oil)
	-- Rogue poisons
	[      7] = 2892, -- Deadly Poison
	[      8] = 2893, -- Deadly Poison II
	[     22] = 3775, -- Crippling Poison
	[    603] = 3776, -- Crippling Poison II
	[     35] = 5237, -- Mind Numbing Poison (Mind-numbing Poison)
	[     42] = 5654, -- Poison (Instant 20) (Instant Toxin)
	[    323] = 6947, -- Instant Poison
	[    324] = 6949, -- Instant Poison II
	[    325] = 6950, -- Instant Poison III
	[     23] = 6951, -- Mind-numbing Poison II
	[    623] = 8926, -- Instant Poison IV
	[    624] = 8927, -- Instant Poison V
	[    625] = 8928, -- Instant Poison VI
	[    626] = 8984, -- Deadly Poison III
	[    627] = 8985, -- Deadly Poison IV
	[    643] = 9186, -- Mind-Numbing Poison III (Mind-numbing Poison III)
	[    703] = 10918, -- Wound Poison
	[    704] = 10920, -- Wound Poison II
	[    705] = 10921, -- Wound Poison III
	[    706] = 10922, -- Wound Poison IV
	[   2630] = 20844, -- Deadly Poison V
	-- Fishing lures
	[    263] = 6529, -- Fishing Lure +25 (Shiny Bauble)
	[    264] = { 6530, 6811 }, -- Fishing Lure +50 (Nightcrawlers, Aquadynamic Fish Lens)
	[    265] = { 6532, 7307 }, -- Fishing Lure +75 (Bright Baubles, Flesh Eating Worm)
	[    266] = 6533, -- Fishing Lure +100 (Aquadynamic Fish Attractor)
}

-- Permanent enchant procs are left out on purpose: no button shows them.
local enchantments = {}

lib:__UpgradeDatabase(20261108000000, trinkets, consumables, enchantments, weaponEnchants)
