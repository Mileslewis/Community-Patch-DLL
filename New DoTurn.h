/// Runs every turn!  The order matters for a lot of this stuff, so be VERY careful about moving anything around (!)
/// Recursive: Modified the order of things here substantially. The AI-only check in this function has been replaced by AI-only checks in all the functions called for additional flexibility.
void CvDiplomacyAI::DoTurn(DiplomacyPlayerType eTargetPlayer)
{
	// Function start
	m_eTargetPlayer = eTargetPlayer;
	////////////////////

	// War damage decay and war state evaluation - comes before everything else!
	DoWarDamageDecay();
	DoUpdateWarDamageLevels();
	DoEstimateOtherPlayerWarDamageLevels();
	DoUpdateWarStates();

	// First evaluation of war and military statistics! We will evaluate again after changing our Opinion, Approach & War Status below.
	// Update strength assessments
	DoUpdatePlayerMilitaryStrengths();
	DoUpdatePlayerEconomicStrengths();
	DoUpdatePlayerTargetValues();

	// Update threat levels
	DoUpdateMilitaryThreats();
	DoUpdateWarmongerThreats();
	DoUpdateWarProjections();

	// First evaluation of peace willingness
	DoUpdateWarProjections();
	DoUpdateWarGoals();
	DoUpdatePeaceTreatyWillingness();

	// Forget about diplomatic penalties that have expired
	DoForgetExpiredPenalties();

	// Update aggressive postures
	DoUpdateMilitaryAggressivePostures();
	DoUpdateExpansionAggressivePostures();
	DoUpdatePlotBuyingAggressivePostures();

	// Update anything relating to promises made by other players
	DoUpdatePromiseStatus();

	// Update direct competition dispute levels
	DoUpdateLandDisputeLevels();
	DoUpdateWonderDisputeLevels();
	DoUpdateMinorCivDisputeLevels();

	// Update victory-based dispute levels
	DoUpdateVictoryDisputeLevels();
	DoUpdateVictoryBlockLevels();

	// Update our estimates of what we think other players are up to
	DoEstimateOtherPlayerMilitaryThreats();
	DoEstimateOtherPlayerWarmongerThreats();
	DoUpdateEstimateOtherPlayerLandDisputeLevels();
	DoUpdateEstimateOtherPlayerWonderDisputeLevels();
	DoUpdateEstimateOtherPlayerMinorCivDisputeLevels();
	DoUpdateEstimateOtherPlayerVictoryDisputeLevels();
	DoUpdateEstimateOtherPlayerVictoryBlockLevels();

	// Update our estimates of what other players think of each other
	// Do ourselves last, since it's the most important to us, and we'll have more information going into the evaluation
	DoEstimateOtherPlayerOpinions();
	DoEstimateOtherPlayerApproaches(); // AI makes share opinion requests of other AIs as part of this
	DoUpdateOpinionTowardsUsGuesses();
	DoUpdateApproachTowardsUsGuesses();

	// Are any players now untrustworthy to us?
	DoUpdateUntrustworthyFriends(/*bTeamCheck*/ false); // Sets to true if the individual player is untrustworthy, false otherwise
	DoUpdateUntrustworthyFriends(/*bTeamCheck*/ true); // Sets to true if the individual player OR anyone on that player's team is untrustworthy, false otherwise

	// Opinion
	DoUpdateOpinions();

	// Test if any players are easy attack targets (do this after Opinion, since Opinion affects the perception of players)
	DoUpdateEasyAttackTargets();

	// Approach
	vector<PlayerTypes> v; // Need an empty vector here, since on normal turn updates, no players are being reevaluated
	DoUpdateMajorCivApproaches(v, /*bBetweenTurnsUpdate*/ false); // A between turns update will call DoUpdatePlannedWarsAndDemands(), but the normal turn update won't (also matters for the approach curve)

	// Special Case War Stuff
	// All of these functions may trigger WAR! and a subsequent reevaluation of opinions/approaches.
#if defined(MOD_DIPLOMACY_CIV4_FEATURES)
	if (MOD_DIPLOMACY_CIV4_FEATURES)
	{
		DoRequestIndependence(); // Request independence from our master
	}
#endif
	DoProcessCoopWars(); // Handles everything involving existing coop war agreements
	DoSendWarTauntsToAIPlayers(); // Send move troops requests and certain taunts to AI players!
	DoSendWarTauntsToHumanPlayers(); // Send move troops requests and certain taunts to humans in singleplayer! Handled differently in multiplayer.

	// Normal War Stuff
	DoUpdatePlannedWarsAndDemands(); // Plan any other wars we want to declare, as well as demands we want to make
	MakeWar(); // Declare war, if we're ready
	MakeDemands(); // Make demands of other civs, if we're ready

	// Second evaluation of war and military statistics - functions above may have changed it!
	// bUpdateLogsSpecial is set to true for all of these functions - don't update the logs if no change happened
	DoUpdateWarDamageLevels(true);
	DoEstimateOtherPlayerWarDamageLevels(true);
	DoUpdateWarStates(true);
	DoUpdatePlayerMilitaryStrengths(true);
	DoUpdatePlayerEconomicStrengths(true);
	DoUpdatePlayerTargetValues(true);
	DoUpdateMilitaryThreats(true); // DoUpdateWarmongerThreats is updated whenever warmongering penalties change, so don't update that here
	DoUpdateWarProjections(true);

	// Minor Civ Approach
	DoUpdateMinorCivApproaches();

	// Second evaluation of peace willingness
	DoUpdateWarGoals(true);
	DoUpdatePeaceTreatyWillingness(true);

	// Make peace with humans we're at war with (humans are usually the biggest threat, so this is an exception to the "contact AIs first" rule).
	DoMakePeaceWithHumanPlayers();

	// Make peace with AI major civs we're at war with
	DoMakePeaceWithAIPlayers();

	// Make peace with City-States we're at war with
	DoMakePeaceWithMinors();

	// Update our valuation of other players as friends and enemies
	DoRelationshipPairing();
	DoUpdateDefensivePactValuation(); // DP valuation uses Friend/Competitor values from DoRelationshipPairing(), so it needs to be updated separately

	// Planning Exchanges - Update our desire for Declarations of Friendship, Defensive Pacts and Research Agreements
	DoUpdatePlanningExchanges();

#if defined(MOD_DIPLOMACY_CIV4_FEATURES)
	// Select the tax rate for our vassals, if we can
	if (MOD_DIPLOMACY_CIV4_FEATURES)
	{
		DoDetermineTaxRateForVassals();
	}
#endif

	// Any minor civs we want to chat with?
	DoContactMinorCivs();

	// Any major civs we want to chat with?
	DoContactAIPlayers(); // AI players are contacted FIRST, and humans LAST! If the AI wants a trade item (including vassalage) from a human, this is recorded for DoContactHumanPlayers (to make sure AI-to-AI trading doesn't deprive the human of all opportunities).
	DoContactHumanPlayers(); // As part of DoContactHumanPlayers, if the human refuses the trade, AI may then attempt to trade for the item with other AI players before resuming discussion with the human.

	// Logging
	LogTurnStatus();

	////////////////////
	// Function end
	m_eTargetPlayer = DIPLO_ALL_PLAYERS;
}