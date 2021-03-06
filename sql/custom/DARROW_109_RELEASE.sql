INSERT INTO `migrations` (`id`) VALUES ('DARROW_109_RELEASE');

-- Hero of the Frostwolf/Stormpike quests
UPDATE `quest_template` 
    SET `Method` = `Method` & ~1
    WHERE `entry` IN (8271, 8272) AND `patch` = 6;

UPDATE `creature_questrelation` SET `patch` = 3 WHERE `quest` IN (8271, 8272);
UPDATE `creature_involvedrelation` SET `patch` = 3 WHERE `quest` IN (8271, 8272);

-- Remove base level Korrak rewards, allow beyond 1.8
UPDATE `quest_template` 
    SET `RewChoiceItemId1` = 0, `RewChoiceItemId2` = 0, `RewChoiceItemId3` = 0, 
        `RewChoiceItemCount1` = 0, `RewChoiceItemCount2` = 0, `RewChoiceItemCount3` = 0,
        `Method` = `Method` & ~1
    WHERE `entry` IN (7181, 7202);

INSERT IGNORE INTO `instance_buff_removal` (`mapId`, `auraId`, `enabled`, `flags`, `comment`) VALUES
-- AQ40 buff removal
(531, 22888, 0, 0, "Rallying Cry"),
(531, 16609, 0, 0, "Warchief's blessing"),
(531, 24425, 0, 0, "Spirit of Zandalar"),
(531, 26393, 0, 0, "Elune's Blessing"),
(531, 15366, 0, 0, "Songflower Serenade"),
(531, 22818, 0, 0, "Mol'dar's Moxie (15% stam)"),
(531, 22820, 0, 0, "Slip'kik's Savvy (3% spellcrit)"),
(531, 22817, 0, 0, "Fengus' Ferocity (200 AP)"),
(531, 20707, 0, 0, "Soulstone"),
(531, 20765, 0, 0, "Soulstone"),
(531, 20764, 0, 0, "Soulstone"),
(531, 20762, 0, 0, "Soulstone"),
(531, 20763, 0, 0, "Soulstone"),
(531, 28681, 0, 0, "Soul Revival (Scourge Invasion Buff)"),

(531, 23735, 0, 0, "Sayge's Dark Fortune of Strength"),
(531, 23736, 0, 0, "Sayge's Dark Fortune of Agility"),
(531, 23737, 0, 0, "Sayge's Dark Fortune of Stamina"),
(531, 23738, 0, 0, "Sayge's Dark Fortune of Spirit"),
(531, 23766, 0, 0, "Sayge's Dark Fortune of Intelligence"),
(531, 23767, 0, 0, "Sayge's Dark Fortune of Armor"),
(531, 23768, 0, 0, "Sayge's Dark Fortune of Damage"),
(531, 23769, 0, 0, "Sayge's Dark Fortune of Resistance"),

(531, 1038,  0, 2, "Blessing of Salvation"),
(531, 25895, 0, 2, "Greater Blessing of Salvation"),

(531, 19740, 0, 2, "Blessing of Might (R1)"),
(531, 19834, 0, 2, "Blessing of Might (R2)"),
(531, 19835, 0, 2, "Blessing of Might (R3)"),
(531, 19836, 0, 2, "Blessing of Might (R4)"),
(531, 19837, 0, 2, "Blessing of Might (R5)"),
(531, 19838, 0, 2, "Blessing of Might (R6)"),
(531, 25291, 0, 2, "Blessing of Might (R7)"),
(531, 25782, 0, 2, "Greater Blessing of Might (R1)"),
(531, 25916, 0, 2, "Greater Blessing of Might (R2)"),

(531, 20911, 0, 2, "Blessing of Sanctuary (R1)"),
(531, 20912, 0, 2, "Blessing of Sanctuary (R2)"),
(531, 20913, 0, 2, "Blessing of Sanctuary (R3)"),
(531, 20914, 0, 2, "Blessing of Sanctuary (R4)"),
(531, 25899, 0, 2, "Greater Blessing of Sanctuary (R1)"),

(531, 19742, 0, 2, "Blessing of Wisdom (R1)"),
(531, 19850, 0, 2, "Blessing of Wisdom (R2)"),
(531, 19852, 0, 2, "Blessing of Wisdom (R3)"),
(531, 19853, 0, 2, "Blessing of Wisdom (R4)"),
(531, 19854, 0, 2, "Blessing of Wisdom (R5)"),
(531, 25290, 0, 2, "Blessing of Wisdom (R6)"),
(531, 25894, 0, 2, "Greater Blessing of Wisdom (R1)"),
(531, 25918, 0, 2, "Greater Blessing of Wisdom (R1)"),

(531, 20217, 0, 2, "Blessing of Kings (R1)"),
(531, 25898, 0, 2, "Greater Blessing of Kings (R1)");

UPDATE `instance_buff_removal` SET `enabled` = 1 WHERE `mapId` = 531;

DELETE FROM `spell_disabled`;
REPLACE INTO `spell_disabled` 
    VALUES  (26276); -- Greater Firepower

UPDATE `item_template` SET `patch` = 0 WHERE `entry` = 21546; -- Allow Greater Firepower to remain in-game
