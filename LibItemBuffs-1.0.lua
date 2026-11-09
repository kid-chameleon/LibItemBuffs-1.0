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

local MAJOR, MINOR, lib = "LibItemBuffs-1.0", 10
if LibStub then
	lib = LibStub:NewLibrary(MAJOR, MINOR)
	if not lib then return end
else
	lib = {}
end

local _G = _G

-- Game flavor detection, used to select the per-flavor data file (same scheme as
-- LibPlayerSpells-1.0). The globals may be absent in the test environment; default to vanilla.
local FLAVORS = { [0] = 'vanilla', [1] = 'tbc', [2] = 'wrath', [3] = 'cata' }
lib.flavor = FLAVORS[_G.LE_EXPANSION_LEVEL_CURRENT or 0] or 'vanilla'
-- Forever reports the vanilla expansion level but ships its own item data.
if _G.WOW_PROJECT_CAMELOT and _G.WOW_PROJECT_ID == _G.WOW_PROJECT_CAMELOT then
	lib.flavor = 'forever'
end
-- Retail (mainline) reports the current expansion level, which the table above does not list.
if _G.WOW_PROJECT_MAINLINE and _G.WOW_PROJECT_ID == _G.WOW_PROJECT_MAINLINE then
	lib.flavor = 'retail'
end

lib.__itemBuffs = lib.__itemBuffs or {}
lib.__itemWeaponEnchants = lib.__itemWeaponEnchants or {}
lib.__databaseVersion = lib.__databaseVersion or 0

lib.trinkets = lib.trinkets or {}
lib.consumables = lib.consumables or {}
lib.enchantments = lib.enchantments or {}
lib.weaponEnchants = lib.weaponEnchants or {}
lib.slots = lib.slots or {}

-- Equipment slots searched for on-use items, trinkets first (INVSLOT_* are FrameXML
-- constants; a missing one is skipped rather than erroring).
local EQUIPPED_SLOTS
do
	local slots = {}
	for _, name in ipairs({
		"INVSLOT_TRINKET1", "INVSLOT_TRINKET2", "INVSLOT_HEAD", "INVSLOT_NECK", "INVSLOT_SHOULDER",
		"INVSLOT_BACK", "INVSLOT_CHEST", "INVSLOT_WRIST", "INVSLOT_HAND", "INVSLOT_WAIST",
		"INVSLOT_LEGS", "INVSLOT_FEET", "INVSLOT_FINGER1", "INVSLOT_FINGER2",
		"INVSLOT_MAINHAND", "INVSLOT_OFFHAND", "INVSLOT_RANGED",
	}) do
		if _G[name] then
			tinsert(slots, _G[name])
		end
	end
	EQUIPPED_SLOTS = slots
end

--- Tell whether a spell is an item buff or not.
-- @name LibItemBuffs:IsItemBuff
-- @param spellID number Spell identifier.
-- @return boolean True if the spell is a buff given by an item.
function lib:IsItemBuff(spellID)
	return not not (spellID and (lib.enchantments[spellID] or lib.trinkets[spellID] or lib.consumables[spellID]))
end

local function Contains(itemIDs, itemID)
	if type(itemIDs) == "table" then
		for _, value in ipairs(itemIDs) do
			if value == itemID then
				return true
			end
		end
		return false
	end
	return itemIDs == itemID
end

--- Return the inventory slot containing the item that can apply the given buff.
-- @name LibItemBuffs:GetBuffInventorySlot
-- @param spellID number Spell identifier.
-- @return number The inventory slot of matching item (see INVSLOT_* values), returns nil for items in bags.
function lib:GetBuffInventorySlot(spellID)
	if not spellID then return end

	local invSlot = lib.enchantments[spellID]
	if invSlot then
		return invSlot
	end

	-- the "trinkets" table holds every equippable on-use item, trinkets first
	local itemIDs = lib.trinkets[spellID]
	if not itemIDs then return end

	for _, slot in ipairs(EQUIPPED_SLOTS) do
		local equipped = GetInventoryItemID("player", slot)
		if equipped and Contains(itemIDs, equipped) then
			return slot
		end
	end
end

--- Return the identifier of the item that can apply the given buff.
-- @name LibItemBuffs:GetBuffItemID
-- @param spellID number Spell identifier.
-- @return number The item identifier(s) or nil.
function lib:GetBuffItemID(spellID)
	if not spellID then return end

	local itemID = lib.trinkets[spellID] or lib.consumables[spellID]
	if type(itemID) == "table" then
		return unpack(itemID)
	elseif itemID then
		return itemID
	end

	local invSlot = lib.enchantments[spellID]
	return invSlot and GetInventoryItemID("player", invSlot)
end

--- Get the list of inventory slots for which the library has information.
-- @name LibItemBuffs:GetInventorySlotList
-- @return table A list of INVSLOT_* values.
function lib:GetInventorySlotList()
	return lib.slots
end

--- Return the buffs provided by then given item, excluding any enchant.
-- @name LibItemBuffs:GetItemBuffs
-- @param itemID number Item identifier.
-- @return number, ... A list of spell identifiers.
function lib:GetItemBuffs(itemID)
	if not itemID then return end
	local buffs = lib.__itemBuffs[itemID]
	if type(buffs) == "table" then
		return unpack(buffs)
	end
	return buffs
end

--- Return the temporary weapon enchantments the given item applies (sharpening stones,
-- weightstones, oils, poisons, fishing lures...). Compare them with the enchant IDs that
-- GetWeaponEnchantInfo() returns.
-- @name LibItemBuffs:GetItemWeaponEnchants
-- @param itemID number Item identifier.
-- @return number, ... A list of enchantment identifiers.
function lib:GetItemWeaponEnchants(itemID)
	if not itemID then return end
	local enchants = lib.__itemWeaponEnchants[itemID]
	if type(enchants) == "table" then
		return unpack(enchants)
	end
	return enchants
end

--- Return the identifier(s) of the item(s) that apply the given temporary weapon enchantment.
-- @name LibItemBuffs:GetWeaponEnchantItemID
-- @param enchantID number Enchantment identifier, as returned by GetWeaponEnchantInfo().
-- @return number, ... The item identifier(s) or nil.
function lib:GetWeaponEnchantItemID(enchantID)
	if not enchantID then return end
	local itemID = lib.weaponEnchants[enchantID]
	if type(itemID) == "table" then
		return unpack(itemID)
	end
	return itemID
end

local function AddReverseEntry(reverse, spellID, itemID)
	if type(itemID) == "table" then
		for i, value in ipairs(itemID) do
			AddReverseEntry(reverse, spellID, value)
		end
		return
	end
	local previous = reverse[itemID]
	if not previous then
		reverse[itemID] = spellID
	elseif type(previous) == "table" then
		tinsert(previous, spellID)
	else
		reverse[itemID] = { previous, spellID }
	end
end

-- Add the content of the given table into the reverse table.
-- Create a table when an item can provide several buffs.
local function FeedReverseTable(reverse, data)
	for spellID, itemID in pairs(data) do
		AddReverseEntry(reverse, spellID, itemID)
	end
end

function lib:GetDatabaseVersion()
	return floor(lib.__databaseVersion/100)
end

-- Upgrade the trinket and consumables database if needed
-- weaponEnchants is optional: databases older than MINOR 10 do not pass it.
function lib:__UpgradeDatabase(version, trinkets, consumables, enchantments, weaponEnchants)
	assert(
		type(version) == "number" and type(trinkets) == "table" and
		type(consumables) == "table" and type(enchantments) == "table" and
		(weaponEnchants == nil or type(weaponEnchants) == "table"),
		format('Usage: LibStub("%s"):__UpgradeDatabase(version, trinkets, consumables, enchantments[, weaponEnchants])', MAJOR)
	)
	version = version*100 + MINOR -- Factor in the library revision (two digits since MINOR 10)
	if version <= lib.__databaseVersion then return end

	-- Upgrade the tables
	lib.__databaseVersion = version
	lib.trinkets = trinkets
	lib.consumables = consumables
	lib.enchantments = enchantments
	lib.weaponEnchants = weaponEnchants or {}

	-- Rebuild the reverse databases
	wipe(lib.__itemBuffs)
	FeedReverseTable(lib.__itemBuffs, trinkets)
	FeedReverseTable(lib.__itemBuffs, consumables)
	wipe(lib.__itemWeaponEnchants)
	FeedReverseTable(lib.__itemWeaponEnchants, lib.weaponEnchants)

	-- Rebuild the slot list
	wipe(lib.slots)
	local slotSet = {}
	for _, slot in pairs(enchantments) do
		slotSet[slot] = true
	end
	for slot in pairs(slotSet) do
		tinsert(lib.slots, slot)
	end
end

return lib
