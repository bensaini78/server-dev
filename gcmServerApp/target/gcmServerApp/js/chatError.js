//Chat realted JS 



function fireDiconnect(){
	
		$("#rn_ChatEngagementStatus_3_Status").html("Error");
		$("#rn_ChatDisconnectButton_0_Button").hide();
		$("#rn_ChatServerConnect_2").hide();
		$("#rn_ChatCancelButton_7").hide();
		deviceAgent = navigator.userAgent;
		ios = deviceAgent.toLowerCase().match(/(iphone|ipod|ipad)/);
		if(!ios){
			$("#rn_ChatDisconnectButton_0_ButtonClose").parent().show();
			$("#rn_ChatDisconnectButton_0_ButtonClose").show();
		}
		$("#rn_InChatButtonContainer").hide();
		$("#rn_ChatPostMessage_9").addClass('rn_Hidden');
		$("#rn_ChatSendButton_10").addClass('rn_Hidden');
		$("#rn_ChatAgentStatus_5").addClass('rn_Hidden');
		$("#rn_ChatQueueWaitTime_4").removeClass('rn_Hidden');
		$("#rn_ChatQueueWaitTime_4 > span").html('Sorry, live chat is currently unavailable. Please try again later. We apologize for any inconvenience.');
		   
}

$( document ).ready(function() {

	$('#rn_SearchButton2_15_SubmitButton').click(function(){
		searchValue = $('#rn_KeywordText2_14_Text').val();
		searchURL = 'http://optimum.custhelp.com/app/answers/list/kw/'+searchValue+'/page/1/search/1';
		window.open(searchURL, '_blank');
	});
	
	
	$("#rn_ChatDisconnectButton_0_ButtonClose").click(function(){
		window.close();
	});
	
});	
