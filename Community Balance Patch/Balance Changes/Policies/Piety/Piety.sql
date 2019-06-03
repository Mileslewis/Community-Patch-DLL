-- Unlock Time
UPDATE PolicyBranchTypes
SET EraPrereq = 'ERA_MEDIEVAL'
WHERE Type = 'POLICY_BRANCH_PIETY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Update Piety Shape

UPDATE Policies
SET GridX = '5'
WHERE Type = 'POLICY_ORGANIZED_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET GridY = '2'
WHERE Type = 'POLICY_ORGANIZED_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET GridX = '3'
WHERE Type = 'POLICY_MANDATE_OF_HEAVEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET GridY = '1'
WHERE Type = 'POLICY_MANDATE_OF_HEAVEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Great Artists come from Piety

INSERT INTO Policy_FaithPurchaseUnitClasses (PolicyType, UnitClassType)
SELECT 'POLICY_PIETY_FINISHER' , 'UNITCLASS_ARTIST'
WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Piety Opener
DELETE FROM Policy_BuildingClassProductionModifiers
WHERE PolicyType = 'POLICY_PIETY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET FaithCostModifier = '-25'
WHERE Type = 'POLICY_PIETY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Organized Religion

UPDATE Policies
SET FaithCostModifier = '0'
WHERE Type = 'POLICY_ORGANIZED_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

DELETE FROM Policy_BuildingClassYieldChanges
WHERE PolicyType = 'POLICY_ORGANIZED_RELIGION' AND BuildingClassType = 'BUILDINGCLASS_SHRINE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET PressureMod = '50'
WHERE Type = 'POLICY_ORGANIZED_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

INSERT INTO Policy_SpecialistExtraYields
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_ORGANIZED_RELIGION', 'YIELD_FAITH', 1);

DELETE FROM Policy_BuildingClassYieldChanges
WHERE PolicyType = 'POLICY_ORGANIZED_RELIGION';

-- Mandate of Heaven (Now Trade Fairs)
UPDATE Policies
SET FaithCostModifier = '0'
WHERE Type = 'POLICY_MANDATE_OF_HEAVEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

INSERT INTO Policy_BuildingClassHappiness
	(PolicyType, BuildingClassType, Happiness)
VALUES
	('POLICY_MANDATE_OF_HEAVEN', 'BUILDINGCLASS_CASTLE', 1);

INSERT INTO Policy_BuildingClassYieldChanges
	(PolicyType, BuildingClassType, YieldType, YieldChange)
VALUES
	('POLICY_MANDATE_OF_HEAVEN', 'BUILDINGCLASS_CASTLE', 'YIELD_FOOD', 2),
	('POLICY_MANDATE_OF_HEAVEN', 'BUILDINGCLASS_ARMORY', 'YIELD_GOLD', 2);

INSERT INTO Policy_BuildingClassProductionModifiers
	(PolicyType, BuildingClassType, ProductionModifier)
VALUES
	('POLICY_MANDATE_OF_HEAVEN', 'BUILDINGCLASS_CASTLE', 100),
	('POLICY_MANDATE_OF_HEAVEN', 'BUILDINGCLASS_ARMORY', 100);

-- Theocracy (Now Divine Right)

DELETE FROM Policy_BuildingClassYieldModifiers
WHERE PolicyType = 'POLICY_THEOCRACY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );
	
UPDATE Policies
SET HappinessToCulture = '25'
WHERE Type = 'POLICY_THEOCRACY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Reformation (Now Monasticism)
UPDATE Policies
SET AddReformationBelief = '0'
WHERE Type = 'POLICY_REFORMATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET DoubleBorderGA = '1'
WHERE Type = 'POLICY_REFORMATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

INSERT INTO Policy_WLTKDYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_REFORMATION', 'YIELD_PRODUCTION', 15);

UPDATE Policies
SET ExtraCultureandScienceTradeRoutes = '4'
WHERE Type = 'POLICY_REFORMATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Buildings
SET PolicyType = 'POLICY_PIETY'
WHERE Type = 'BUILDING_MONASTERY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Buildings
SET UnlockedByBelief = '0'
WHERE Type = 'BUILDING_MONASTERY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Buildings
SET FaithCost = '200'
WHERE Type = 'BUILDING_MONASTERY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

DELETE FROM Building_ResourceYieldChanges
WHERE BuildingType = 'BUILDING_MONASTERY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_MONASTERY' AND YieldType = 'YIELD_CULTURE' and EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '2'
WHERE BuildingType = 'BUILDING_MONASTERY' AND YieldType = 'YIELD_FAITH' and EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET PortraitIndex = '47'
WHERE Type = 'POLICY_REFORMATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Free Religion (Now Iconography)
UPDATE Policies
SET SecondReligionPantheon = '0'
WHERE Type = 'POLICY_FREE_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET InternalTradeRouteYieldModifier = '50'
WHERE Type = 'POLICY_FREE_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET IncludesOneShotFreeUnits = '0'
WHERE Type = 'POLICY_FREE_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET PortraitIndex = '46'
WHERE Type = 'POLICY_FREE_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

INSERT INTO Policy_ImprovementYieldChanges
	(PolicyType, ImprovementType, YieldType, Yield)
VALUES
	('POLICY_FREE_RELIGION', 'IMPROVEMENT_PASTURE', 'YIELD_PRODUCTION', 2),
	('POLICY_FREE_RELIGION', 'IMPROVEMENT_PASTURE', 'YIELD_GOLD', 1);

INSERT INTO Policy_YieldFromNonSpecialistCitizens
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_FREE_RELIGION', 'YIELD_CULTURE', 25);

-- Finisher

DELETE FROM Policy_FreeUnitClasses
WHERE PolicyType = 'POLICY_PIETY_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

DELETE FROM Policy_ImprovementYieldChanges
WHERE PolicyType = 'POLICY_PIETY_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

DELETE FROM Policy_ImprovementCultureChanges
WHERE PolicyType = 'POLICY_PIETY_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET SharedReligionTourismModifier = '25'
WHERE Type = 'POLICY_PIETY_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );


DELETE FROM Policy_ImprovementYieldChanges
WHERE PolicyType = 'POLICY_THEOCRACY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

--UPDATE Policies
--SET UnlocksPolicyBranchEra = 'ERA_RENAISSANCE'
--WHERE Type = 'POLICY_PIETY_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Finisher
--UPDATE Policies
--SET IdeologyPoint = '1'
--WHERE Type = 'POLICY_PIETY_FINISHER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- New Data
DELETE FROM Policy_PrereqPolicies
WHERE PolicyType = 'POLICY_MANDATE_OF_HEAVEN';

DELETE FROM Policy_PrereqPolicies
WHERE PolicyType = 'POLICY_ORGANIZED_RELIGION';

DELETE FROM Policy_PrereqPolicies
WHERE PolicyType = 'POLICY_FREE_RELIGION';

DELETE FROM Policy_PrereqPolicies
WHERE PolicyType = 'POLICY_THEOCRACY';

INSERT INTO Policy_PrereqPolicies
	(PolicyType, PrereqPolicy)
VALUES
	('POLICY_ORGANIZED_RELIGION', 'POLICY_MANDATE_OF_HEAVEN'),
	('POLICY_FREE_RELIGION', 'POLICY_MANDATE_OF_HEAVEN'),
	('POLICY_THEOCRACY', 'POLICY_MANDATE_OF_HEAVEN');

INSERT INTO Policy_CityYieldChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_ORGANIZED_RELIGION', 'YIELD_FOOD', 1),
	('POLICY_MANDATE_OF_HEAVEN', 'YIELD_FOOD', 1),
	('POLICY_THEOCRACY', 'YIELD_FOOD', 1),
	('POLICY_FREE_RELIGION', 'YIELD_FOOD', 1),
	('POLICY_REFORMATION', 'YIELD_FOOD', 1);


UPDATE Policies
SET DefenseBoostAllCities = '300'
WHERE Type = 'POLICY_ORGANIZED_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET DefenseBoostAllCities = '300'
WHERE Type = 'POLICY_MANDATE_OF_HEAVEN' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET DefenseBoostAllCities = '300'
WHERE Type = 'POLICY_THEOCRACY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET DefenseBoostAllCities = '300'
WHERE Type = 'POLICY_FREE_RELIGION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

UPDATE Policies
SET DefenseBoostAllCities = '300'
WHERE Type = 'POLICY_REFORMATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );



INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MONASTERY', 'YIELD_SCIENCE', 3),
	('BUILDING_MONASTERY', 'YIELD_FOOD', 3);

INSERT INTO Policy_ReligionYieldMod
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_PIETY_FINISHER', 'YIELD_FAITH', 3),
	('POLICY_PIETY_FINISHER', 'YIELD_SCIENCE', 3),
	('POLICY_PIETY_FINISHER', 'YIELD_PRODUCTION', 3),
	('POLICY_PIETY_FINISHER', 'YIELD_CULTURE', 3);
