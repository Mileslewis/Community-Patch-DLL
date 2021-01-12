-- Update Hover Units to obey coast/ocean tiles

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_HELICOPTER_GUNSHIP' , 'PROMOTION_EMBARKATION';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_HELICOPTER_GUNSHIP' , 'PROMOTION_DEFENSIVE_EMBARKATION';

INSERT INTO Unit_FreePromotions (UnitType, PromotionType)
SELECT 'UNIT_HELICOPTER_GUNSHIP' , 'PROMOTION_ALLWATER_EMBARKATION';

-- Fixes for Barbarians
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_BARBARIAN' AND UnitClassType = 'UNITCLASS_CHARIOT_ARCHER';
INSERT INTO Civilization_UnitClassOverrides (CivilizationType, UnitClassType, UnitType)
SELECT 'CIVILIZATION_BARBARIAN' , 'UNITCLASS_CHARIOT_ARCHER', 'UNIT_BARBARIAN_AXMAN';

INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost) SELECT 'UNIT_BARBARIAN_HORSEMAN', 'RESOURCE_HORSE', '1';
INSERT INTO Unit_ResourceQuantityRequirements (UnitType, ResourceType, Cost) SELECT 'UNIT_BARBARIAN_SWORDSMAN', 'RESOURCE_IRON', '1';

-- Unit SelectionSound fix
UPDATE UnitGameplay2DScripts
SET FirstSelectionSound = 'AS2D_BIRTH_HORSEMAN', SelectionSound = 'AS2D_SELECT_HORSEMAN'
WHERE UnitType = 'UNIT_BARBARIAN_HORSEMAN';

UPDATE UnitGameplay2DScripts
SET FirstSelectionSound = 'AS2D_BIRTH_WARRIER', SelectionSound = 'AS2D_SELECT_WARRIER'
WHERE UnitType = 'UNIT_BARBARIAN_WARRIOR';

UPDATE UnitGameplay2DScripts
SET FirstSelectionSound = 'AS2D_BIRTH_CANNON', SelectionSound = 'AS2D_SELECT_CANNON'
WHERE UnitType = 'UNIT_GATLINGGUN';

UPDATE UnitGameplay2DScripts
SET FirstSelectionSound = 'AS2D_BIRTH_FRIGATE', SelectionSound = 'AS2D_SELECT_FRIGATE'
WHERE UnitType = 'UNIT_PRIVATEER';

UPDATE UnitGameplay2DScripts
SET FirstSelectionSound = 'AS2D_BIRTH_MUSKETMAN', SelectionSound = 'AS2D_SELECT_MUSKETMAN'
WHERE UnitType = 'UNIT_SWEDISH_CAROLEAN';

-- Civilian units change appearance in Modern Era (fix from Mad Madigan)
UPDATE ArtDefine_UnitInfos
  SET Type = 'ART_DEF_UNIT_CARGO_SHIP_MODERN'
  WHERE Type = 'ART_DEF_UNIT_CARGO_SHIP_POSTMODERN';
UPDATE ArtDefine_UnitInfoMemberInfos
  SET UnitInfoType = 'ART_DEF_UNIT_CARGO_SHIP_MODERN'
  WHERE UnitInfoType = 'ART_DEF_UNIT_CARGO_SHIP_POSTMODERN';

UPDATE ArtDefine_UnitInfos
  SET Type = 'ART_DEF_UNIT_CARAVAN_MODERN'
  WHERE Type = 'ART_DEF_UNIT_CARAVAN_POSTMODERN';
UPDATE ArtDefine_UnitInfoMemberInfos
  SET UnitInfoType = 'ART_DEF_UNIT_CARAVAN_MODERN'
  WHERE UnitInfoType = 'ART_DEF_UNIT_CARAVAN_POSTMODERN';

UPDATE ArtDefine_UnitInfos
  SET Type = 'ART_DEF_UNIT_GREAT_ADMIRAL_MODERN'
  WHERE Type = 'ART_DEF_UNIT_GREAT_ADMIRAL_LATE';
UPDATE ArtDefine_UnitInfoMemberInfos
  SET UnitInfoType = 'ART_DEF_UNIT_GREAT_ADMIRAL_MODERN'
  WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_ADMIRAL_LATE';

UPDATE ArtDefine_UnitInfos
  SET Type = 'ART_DEF_UNIT_GREAT_GENERAL_MODERN'
  WHERE Type = 'ART_DEF_UNIT_GREAT_GENERAL_LATE';
UPDATE ArtDefine_UnitInfoMemberInfos
  SET UnitInfoType = 'ART_DEF_UNIT_GREAT_GENERAL_MODERN'
  WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_GENERAL_LATE';

UPDATE ArtDefine_UnitInfos
  SET Type = 'ART_DEF_UNIT_WORKBOAT_MODERN'
  WHERE Type = 'ART_DEF_UNIT_WORKBOAT_LATE';
UPDATE ArtDefine_UnitInfoMemberInfos
  SET UnitInfoType = 'ART_DEF_UNIT_WORKBOAT_MODERN'
  WHERE UnitInfoType = 'ART_DEF_UNIT_WORKBOAT_LATE';

UPDATE ArtDefine_UnitInfos
  SET Type = 'ART_DEF_UNIT_WORKER_MODERN'
  WHERE Type = 'ART_DEF_UNIT_WORKER_LATE';
UPDATE ArtDefine_UnitInfoMemberInfos
  SET UnitInfoType = 'ART_DEF_UNIT_WORKER_MODERN'
  WHERE UnitInfoType = 'ART_DEF_UNIT_WORKER_LATE';