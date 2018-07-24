function OnTelephonyConversationStateChanged(json) {
	var myDiv = document.getElementById("ctilog");
	var conversation = JSON.parse(json);
		if (conversation.acceptanceState == "Pending" && conversation.state == "Started" && conversation.remoteParticipants[0].voiceMediaDisplayName == "") {
			myDiv.innerHTML += "Lookup number: " + conversation.remoteParticipants[0].translatedNumber.slice(2) + '<br/>';
			window.open("/multientityquickfind/multientityquickfind.aspx?option=0&pagemode=iframe&sitemappath=SFA&text=*" + conversation.remoteParticipants[0].translatedNumber.slice(2));
	}
}