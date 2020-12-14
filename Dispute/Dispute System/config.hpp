//Config options for dispute system
class DEVO_Dispute {
	/* Main Settings */
	disputeReasons[] = {"RDM", "VDM", "NLR", "Breaking RP", "Racism", "Abuse", "Other"}; //List of reasons you can dispute a player for
	reqAdminLevel = 1; //Required admin level to view dispute log
	
	/* Error Notifications */
	noPlayerError = "You must select a player you are sending the dispute to!"; //Error to show when no player selected
	noReasonError = "You must enter a dispute reason!"; //Error to show if no dispute reason selected
	notReqLevel = "You are not allowed to open the dispute log menu"; //Error to show if unauthorised party opens dispute logs
	
	/* Dispute Success Notification */
	disputeSent = "Your dispute has been sent successfully"; //Dispute sent notification
	
	/* Notification disputed party recieves */
	// %1 = Name of disputer | %2 = Dispute Reason
	disputeNotif = "You have been disputed by %1 for %2. Come to teamspeak!"; //Will break if %1 or %2 are missing

};
