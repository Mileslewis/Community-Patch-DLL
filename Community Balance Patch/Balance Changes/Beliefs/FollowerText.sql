-- Cathedral
UPDATE Language_en_US
SET Text = 'Use [ICON_PEACE] Faith to purchase Cathedrals (+2 [ICON_PEACE] Faith, +2 [ICON_GOLD] Gold, 1 [ICON_GREAT_WORK] Great Work of Art slot)'
WHERE Tag = 'TXT_KEY_BELIEF_CATHEDRALS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Pagoda
UPDATE Language_en_US
SET Text = 'Use [ICON_PEACE] Faith to purchase Pagodas (+2 [ICON_PEACE] Faith, +2 [ICON_CULTURE] Culture, 1 [ICON_GREAT_WORK] Great Work of Art slot)'
WHERE Tag = 'TXT_KEY_BELIEF_PAGODAS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Mosque
UPDATE Language_en_US
SET Text = 'Use [ICON_PEACE] Faith to purchase Mosques (+2 [ICON_PEACE] Faith, +2 [ICON_RESEARCH] Science, 1 [ICON_GREAT_WORK] Great Work of Writing Slot)'
WHERE Tag = 'TXT_KEY_BELIEF_MOSQUES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Sword into Plowshare (Now Church)
UPDATE Language_en_US
SET Text = 'Use [ICON_PEACE] Faith to purchase Churches (+3 [ICON_PEACE] Faith, 1 [ICON_GREAT_WORK] Great Work of Music Slot)'
WHERE Tag = 'TXT_KEY_BELIEF_SWORD_PLOWSHARES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Churches'
WHERE Tag = 'TXT_KEY_BELIEF_SWORD_PLOWSHARES_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Guruship (Now Mandir)
UPDATE Language_en_US
SET Text = 'Mandirs'
WHERE Tag = 'TXT_KEY_BELIEF_GURUSHIP_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Use [ICON_PEACE] Faith to purchase Mandirs (+2 [ICON_PEACE] Faith, + 2 [ICON_FOOD] Food, 1 [ICON_GREAT_WORK] Great Work of Music Slot)'
WHERE Tag = 'TXT_KEY_BELIEF_GURUSHIP' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Holy Warriors (Now Synagogue)
UPDATE Language_en_US
SET Text = 'Use [ICON_PEACE] Faith to purchase Synagogues (+2 [ICON_PEACE] Faith, + 2 [ICON_PRODUCTION] Production, 1 [ICON_GREAT_WORK] Great Work of Writing Slot)'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_WARRIORS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Synagogues'
WHERE Tag = 'TXT_KEY_BELIEF_HOLY_WARRIORS_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Monasteries (Now Stupa)
UPDATE Language_en_US
SET Text = 'Use [ICON_PEACE] Faith to purchase Stupas (+4 [ICON_PEACE] Faith, +1 [ICON_TOURISM] Tourism once you have researched Theology)'
WHERE Tag = 'TXT_KEY_BELIEF_MONASTERIES' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Stupas'
WHERE Tag = 'TXT_KEY_BELIEF_MONASTERIES_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Feed the World (Now Thrift)
UPDATE Language_en_US
SET Text = '+1% [ICON_GOLD] Gold for each follower (max +10%)'
WHERE Tag = 'TXT_KEY_BELIEF_FEED_WORLD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Thrift'
WHERE Tag = 'TXT_KEY_BELIEF_FEED_WORLD_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Peace Gardens (Now Cooperation)
UPDATE Language_en_US
SET Text = 'Receive a boost to all City yields every time a [ICON_CITIZEN] Citizen is born in the City. Bonus scales with Era'
WHERE Tag = 'TXT_KEY_BELIEF_PEACE_GARDENS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Cooperation'
WHERE Tag = 'TXT_KEY_BELIEF_PEACE_GARDENS_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Choral Music (Now Scholarship)
UPDATE Language_en_US
SET Text = '+1% [ICON_RESEARCH] Science for each follower (max +10%)'
WHERE Tag = 'TXT_KEY_BELIEF_CHORAL_MUSIC' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Scholarship'
WHERE Tag = 'TXT_KEY_BELIEF_CHORAL_MUSIC_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Religious Art (Now Mastery)
UPDATE Language_en_US
SET Text = 'Scientists, Merchants and Engineers produce +1 of their normal yields ([ICON_RESEARCH] Science, [ICON_GOLD] Gold, and [ICON_PRODUCTION] Production, respectively).'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_ART' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Mastery'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_ART_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Liturgical Drama (Now Veneration)
UPDATE Language_en_US
SET Text = '+1 [ICON_PEACE] Faith for each follower (max 5 [ICON_PEACE] Faith)'
WHERE Tag = 'TXT_KEY_BELIEF_LITURGICAL_DRAMA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Veneration'
WHERE Tag = 'TXT_KEY_BELIEF_LITURGICAL_DRAMA_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Ascetism
UPDATE Language_en_US
SET Text = '+1% [ICON_FOOD] Food for each follower (max +15%)'
WHERE Tag = 'TXT_KEY_BELIEF_ASCETISM' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Religious Center (Now Order)
UPDATE Language_en_US
SET Text = 'Use [ICON_PEACE] Faith to purchase Orders (+3 [ICON_PEACE] Faith. +10 XP and the Morale promotion for Land Units built in the city.)'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_CENTER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Orders'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_CENTER_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Religious Community (Now Diliegence)
UPDATE Language_en_US
SET Text = 'Diligence'
WHERE Tag = 'TXT_KEY_BELIEF_RELIGIOUS_COMMUNITY_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Divine Inspiration (Now Inspiration)
UPDATE Language_en_US
SET Text = '+1 [ICON_CULTURE] Culture for each follower (max 5 [ICON_CULTURE] Culture)'
WHERE Tag = 'TXT_KEY_BELIEF_DIVINE_INSPIRATION' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Language_en_US
SET Text = 'Inspiration'
WHERE Tag = 'TXT_KEY_BELIEF_DIVINE_INSPIRATION_SHORT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );