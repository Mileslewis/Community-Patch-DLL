-- Arsenal of Democracy

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Arsenal of Democracy[ENDCOLOR][NEWLINE]+15% [ICON_PRODUCTION] Production when building Military Units. +20 [ICON_INFLUENCE] Influence from Military Unit gifts to City-States.'
WHERE Tag = 'TXT_KEY_POLICY_ARSENAL_DEMOCRACY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Capitalism

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Capitalism[ENDCOLOR][NEWLINE]5 [ICON_CITIZEN] Specialists in each of your cities no longer cause [ICON_HAPPINESS_3] Unhappiness.'
WHERE Tag = 'TXT_KEY_POLICY_CAPITALISM_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Open Society

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Avant Garde[ENDCOLOR][NEWLINE]The rate at which [ICON_GREAT_PEOPLE] Great People are born is increased by 33%.'
WHERE Tag = 'TXT_KEY_POLICY_OPEN_SOCIETY_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Covert Action

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Covert Action[ENDCOLOR][NEWLINE]Chance of rigging election in City-States doubled. Receive an additional [ICON_SPY] Spy.'
WHERE Tag = 'TXT_KEY_POLICY_COVERT_ACTION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Creative Expression
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Creative Expression[ENDCOLOR][NEWLINE]+1 [ICON_CULTURE] Culture from Great Works. Culture buildings that can hold [ICON_GREAT_WORK] Great Works provide +1 [ICON_CULTURE] Culture.'
WHERE Tag = 'TXT_KEY_POLICY_CREATIVE_EXPRESSION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Economic Union
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Economic Union[ENDCOLOR][NEWLINE]Receive an additional [ICON_INTERNATIONAL_TRADE] Trade Route. +3 [ICON_GOLD] Gold from trade routes with civilizations following Freedom.'
WHERE Tag = 'TXT_KEY_POLICY_ECONOMIC_UNION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Media Culture
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Media Culture[ENDCOLOR][NEWLINE] +34% [ICON_TOURISM] Tourism and +1 [ICON_HAPPINESS_1] Happiness generated by cities with a Broadcast Tower.'
WHERE Tag = 'TXT_KEY_POLICY_MEDIA_CULTURE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Finest Hour
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Their Finest Hour[ENDCOLOR][NEWLINE][ICON_STRENGTH] Combat Strength of Cities increased by 33%. Can build [COLOR_POSITIVE_TEXT]B17 Bombers[ENDCOLOR].'
WHERE Tag = 'TXT_KEY_POLICY_THEIR_FINEST_HOUR_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Universal Suffrage
UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Universal Suffrage[ENDCOLOR][NEWLINE][ICON_GOLDEN_AGE] Golden Ages last 50% longer. Cities produce +1 [ICON_HAPPINESS_1] Happiness.'
WHERE Tag = 'TXT_KEY_POLICY_UNIVERSAL_SUFFRAGE_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );

-- Urbanization

UPDATE Language_en_US
SET Text = '[COLOR_POSITIVE_TEXT]Urbanization[ENDCOLOR][NEWLINE]Farms, Plantations, Camps, and all Unique Improvements produce +1 [ICON_FOOD] Food.'
WHERE Tag = 'TXT_KEY_POLICY_URBANIZATION_HELP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_POLICIES' AND Value= 1 );