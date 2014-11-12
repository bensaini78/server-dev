//Chat realted JS 

var firstName = 'Ben';
var lastName = 'Saini';
var chatAlias, secureKey, userId, scriptPos, refreshId, hostUrl, sessionId;
var surveyUrl;
var isSetUpForChat = false;
var isUserTypingFlagSet = false;
var refreshId;
var failOverRetryCount = 0;
var	failOverFlag = true;

//hostUrl='https://contactus.cablevision.com/cvContactUs';

function fireDiconnect(){
	
		$("#rn_ChatEngagementStatus_3_Status").html("Disconnected");
		$("#rn_ChatDisconnectButton_0_Button").hide();
		deviceAgent = navigator.userAgent;
		ios = deviceAgent.toLowerCase().match(/(iphone|ipod|ipad)/);
		if(!ios){
			$("#rn_ChatDisconnectButton_0_ButtonClose").show();
		}
		$("#rn_InChatButtonContainer").hide();
		$("#rn_ChatPostMessage_9").addClass('rn_Hidden');
		$("#rn_ChatSendButton_10").addClass('rn_Hidden');
		$("#rn_ChatAgentStatus_5").addClass('rn_Hidden');
		disconnect();    
}

	function exitButtonListener(){
		
			$("#exit").click(function(){
					//var exit = confirm("Are you sure you want to end the session?");
					//if(exit==true){
						disconnect();
						$("form").hide();
					//close();
					//}     
				});	
			//rn_ChatDisconnectButton_0_Button
			$("#rn_ChatDisconnectButton_0_Button").click(function(){
				//var exit = confirm("Are you sure you want to end this chat session?");
				//if(exit==true){
					fireDiconnect();
				/*}  
				else{
					return;
				}*/
			});	
			$("#rn_ChatDisconnectButton_0_ButtonClose").click(function(){
					window.close();
			});
			
			$("#rn_ChatCancelButton_7_Button").click(function(){
				$("#rn_ChatServerConnect_2").addClass("rn_Hidden");
				$('#rn_ChatCancelButton_7').hide();
				$("#rn_ChatQueueSearch_13").addClass('rn_ScreenReaderOnly');
				$('#rn_ChatEngagementStatus_3_Canceled_User').html('You have left the queue. If you still need assistance please try back later.');
				$('#rn_ChatEngagementStatus_3_Canceled_User').removeClass('rn_Hidden');
				$("#rn_ChatEngagementStatus_3_Status").html("Canceled");
				$("#rn_ChatQueueWaitTime_4").addClass('rn_Hidden');
				disconnect();
				//window.close();
			});
	}
	
	function faqSeachChatListener(){
		$('#rn_SearchButton2_15_SubmitButton').click(function(){
			searchValue = $('#rn_KeywordText2_14_Text').val();
			if(isBusiness === 'true'){
				searchURL = 'http://optimumbusiness.custhelp.com/app/answers/list/kw/'+searchValue+'/page/1/search/1';
			}else{
				searchURL = 'http://optimum.custhelp.com/app/answers/list/kw/'+searchValue+'/page/1/search/1';
			}
			window.open(searchURL, '_blank');
		});
	}
	

	function submitUserMessages(){
		$('#rn_ChatPostMessage_9_Input').keyup(function(event){
			if(event.keyCode===13) {
				submitUsersMessages(); 
			}
		});
		$("#rn_ChatSendButton_10_Button").click(function(){
					submitUsersMessages();   
				});	

	}

	function testLaunchChat(){
			$("#launchChat").click(function(event){
					testConnect();
					event.preventDefault();
					//window.open("sample.html", "popupWindow", "location=0,menubar=0,status=0,scrollbars=0,width=600,height=500,scrollbars=yes");   
				});	

	}

		function submitUsersMessages(){
				//message = $('#rn_ChatPostMessage_9_Input').val().trim();
				message = $.trim($('#rn_ChatPostMessage_9_Input').val());
				newMessage = getUserName(lastName, firstName) + message +'</br>';
				//newMessage = "Testing!!!";
				if(message.length > 0){
					$("#rn_ChatPostMessage_9_Input").val('');
					$("#rn_ChatPostMessage_9_Input").focus();
					send(message);
				}
		}

		function getUserName(lastName, firstName){

			return  '<span class="userName">'+lastName+', '+firstName+ ' : </span>';
		}
	function setRefresh(timeUnit){
			refreshId = setInterval("heartBeat()", timeUnit);
	}
		
	function testConnect(){
		$.ajax({
                type:"GET", 
                url:"/cvContactUs/rest/chat/connect?firstName=Ben&lastName=Saini&emailAddress=ben.saini@cs.com&subject=abc&timezoneOffset=-240", 
                dataType:'json', 
                success:function(data){
					connectData = data;
					displayMessages(connectData);
					setRefresh(10000);
                                }
                });
	}
	function heartBeat(){
		console.log("Chat alias in refresh is : " + chatAlias +" ...");
		$.ajax({
                type:"GET", 
                url:hostUrl+"/rest/chat/refresh",
				data: {chatAlias:chatAlias, userId:userId, secureKey:secureKey, scriptPos:scriptPos, sessionId: sessionId},	
                dataType:'json', 
				async: false,
                success:function(data){
					refreshData = data;
					displayMessages(refreshData);
                                }
                });
	}
	function send(message){
		$.ajax({
                type:"GET", 
                url:hostUrl+"/rest/chat/send",
				data: {chatAlias:chatAlias, userId:userId, secureKey:secureKey, scriptPos:scriptPos, clientMessage:message, sessionId:sessionId},		
                dataType:'json', 
				async: false,
                success:function(data){
                	isUserTypingFlagSet = false;
					sendData = data;
					displayMessages(sendData);
					//heartBeat();
                                }
                });
	}
	function userTyping(){
		$.ajax({
                type:"GET", 
                url:hostUrl+"/rest/chat/userTyping", 
				data: {chatAlias:chatAlias, userId:userId, secureKey:secureKey, scriptPos:scriptPos, sessionId:sessionId},	
                dataType:'json', 
				async: false,
                success:function(data){
					userTypingData = data;
					displayMessages(userTypingData);
					//heartBeat();
                                }
                });
	}
	function disconnect(){
		clearInterval(refreshId);
		$.ajax({
                type:"GET", 
                url: hostUrl+"/rest/chat/disconnect",
				data: {chatAlias:chatAlias, userId:userId, secureKey:secureKey, scriptPos:scriptPos, sessionId:sessionId},		
                dataType:'json',
				async: false,				
                success:function(data){
					disconnectData = data;
					//displayMessages(disconnectData);
					//heartBeat();
					//clearInterval(refreshId);
                                }
                });
	}
	
	function displayMessages(responseData){
			responseStatus = responseData['status'];
			chatUserSessionData = responseData['chatUserSessionData'];
			try{
			messageArray = chatUserSessionData['messages'];
			console.log("+++++++++++++++++++");
			console.log('Message Array Length :' + messageArray.length);
			try{
			if(responseStatus['success'] == true && messageArray.length > 0){
				chatAlias = chatUserSessionData['chatAlias'];
				secureKey = chatUserSessionData['secureKey'];
				userId = chatUserSessionData['userId'];
				scriptPos = chatUserSessionData['scriptPos'];
				
				if(scriptPos < 1){
					fireDiconnect();
				}
			
				for(var ii =0; ii < messageArray.length; ii++){
				
						message = messageArray[ii];
						console.log('Counter : ' + ii);
						console.log('Message: ' + message);
						userType = message['userTypeCode'];
						isAgent = userType.indexOf('AGENT');
						isExternal = userType.indexOf('EXTERNAL');
						console.log('isagent ' + isAgent);
						console.log('isExternal ' + isExternal);
						i = message['text'].indexOf(':');
						messageHtml = null;
						
						messageText = [ message['text'].substr(0,i), message['text'].substr(++i)];
						console.log('Value of messageText[1] : ' + messageText[1]);
						console.log(">>>>>>>>>>>>>>>>>>>>>>");
						if(isExternal === 0){
							if(isSetUpForChat){
								messageHtml = '<span class="rn_MessagePost"><img src="/cvContactUs/images/chat_enduser_message.png">'+
								'<span class="rn_UserTextPrefix">'+messageText[0]+'</span>:'+messageText[1]+
								'</span></br>';
						
								$('#rn_ChatTranscript_6').append(messageHtml);
								$("#rn_ChatTranscript_6").animate({ scrollTop: $("#rn_ChatTranscript_6").prop('scrollHeight')}, 500);
							}else{
								$("#rn_ChatQueueWaitTime_4").removeClass('rn_Hidden');
								$("#rn_ChatQueueWaitTime_4 > span").html(messageText[1]);
							}
							
						}else if(isAgent === 0){
							
							console.log("Agent Message :" + messageText[1]);
							if(!isSetUpForChat){
								setUpForChat();
							} 
							console.log("The eye is : " + i);
							if(i < 1){
								if(message['text'].indexOf(' is typing.') > 0){
									agentName = message['text'].substr(0,message['text'].indexOf('typing.'));
									name = '<img src="/cvContactUs/images/chat_agent.png">'+agentName+'<span id="rn_ChatAgentStatus_5_AgentStatus_1909330">(responding)</span>';
									$("#rn_ChatAgentStatus_5").removeClass('rn_Hidden');
									$("#rn_ChatAgentStatus_5_Agent_19").removeClass('rn_Hidden');
									$("#rn_ChatAgentStatus_5_Agent_19").html('');
									$("#rn_ChatAgentStatus_5_Agent_19").html(name);
								}else if(message['text'].indexOf(' has stopped typing.') > 0){
									name = '<img src="/cvContactUs/images/chat_agent.png">'+agentName+'<span id="rn_ChatAgentStatus_5_AgentStatus_1909330">(Listening)</span>';
									$("#rn_ChatAgentStatus_5_Agent_19").html('');
									$("#rn_ChatAgentStatus_5_Agent_19").html(name);
								}else if(message['text'].indexOf(' has left the session.') > 0){
									messageHtml = '<span class="rn_MessagePost"><img src="/cvContactUs/images/chat_alert.png">'+
										'<span class="rn_UserTextPrefix"></span>'+message['text']+
										'</span></br>';
									//$('#rn_ChatTranscript_6').append(messageHtml);
									//$("#rn_ChatTranscript_6").animate({ scrollTop: $("#rn_ChatTranscript_6").prop('scrollHeight')}, 500);	
									//return;
										
								}else{
									messageHtml = '<span class="rn_MessagePost"><img src="/cvContactUs/images/chat_alert.png">'+
										'<span class="rn_UserTextPrefix"></span>'+message['text']+
									'</span></br>';
								}	
							}else{
								messageHtml = '<span class="rn_MessagePost"><img src="/cvContactUs/images/chat_agent.png">'+
									'<span class="rn_AgentTextPrefix">'+messageText[0]+'</span>:'+messageText[1]+
								'</span></br>';
								}
								$('#rn_ChatTranscript_6').append(messageHtml);
								$("#rn_ChatTranscript_6").animate({ scrollTop: $("#rn_ChatTranscript_6").prop('scrollHeight')}, 500);
								//$('#rn_ChatTranscript_6').linkify();
						}else{
							if(!isSetUpForChat){
								if(message['text'].indexOf(' has left the session.') > 0){
									$("#rn_ChatServerConnect_2").addClass("rn_Hidden");
									$('#rn_ChatCancelButton_7').hide();
									return;
								}else{
								setUpForChat();
								}
							}
							//messageText ='<span class=\''+userType+'\'>'+message['text']+'</span></br>';
							if(i < 0){
								messageHtml = '<span class="rn_MessagePost"><img src="/cvContactUs/images/chat_alert.png">'+
								'<span class="rn_UserTextPrefix"></span>'+message['text']+
							'</span></br>';
							}else{
								messageHtml = '<span class="rn_MessagePost"><img src="/cvContactUs/images/chat_enduser_message.png">'+
									'<span class="rn_UserTextPrefix">'+messageText[0]+'</span>:'+messageText[1]+
								'</span></br>';
							}
							$('#rn_ChatTranscript_6').append(messageHtml);
							$("#rn_ChatTranscript_6").animate({ scrollTop: $("#rn_ChatTranscript_6").prop('scrollHeight')}, 500);
							//$('#rn_ChatTranscript_6').linkify();
						}
					}
				$("#rn_ChatTranscript_6").linkify();
				if(failOverRetryCount > 0){
					failOverRetryCount = 0;
				}
			  }
			}catch(err){
					//do nothing
					console.log("In Catch 1 of writing messages.");
				}
			
			}catch(err){
				console.log("In catch Error for sending JSON Message");
				chatAlias="";
				if(++failOverRetryCount > 4){
					failOverFlag = false;
					console.log("In Catch 2 of writing messages for "+failOverRetryCount+" time.");
				}
				if(!failOverFlag){
					messageHtml = "We're sorry, we seemed to have lost your chat connection due to technical difficulties.  " +
								  "We apologize for the inconvenience.  We want to chat with you!  Please try your chat again. " +
								  "Thank you.";
					$('#rn_ChatTranscript_6').append(messageHtml);
					$("#rn_ChatTranscript_6").animate({ scrollTop: $("#rn_ChatTranscript_6").prop('scrollHeight')}, 500);
					fireDiconnect();
				}
			}
	}			
	
function setUpForChat(){
	$('#rn_ChatCancelButton_7').hide();
	$("#rn_ChatQueueSearch_13").addClass('rn_ScreenReaderOnly');
	$('#rn_ChatEngagementStatus_3_Canceled_User').addClass('rn_Hidden');
	$("#rn_ChatQueueWaitTime_4").addClass("rn_Hidden");
	$("#rn_ChatServerConnect_2").addClass("rn_Hidden");
	$("#rn_ChatDialogHeaderButtonContainer").children().removeClass('rn_Hidden');
	$("#rn_ChatServerConnect_2_Connector").addClass("rn_Hidden");
	$("#rn_ChatEngagementStatus_3_Status").html("Connected");
	$("#rn_ChatTranscript_6").removeClass('rn_Hidden');
	$("#rn_ChatPostMessage_9").removeClass('rn_Hidden');
	$("#rn_ChatSendButton_10").removeClass('rn_Hidden');
	isSetUpForChat = true;
}	
	
function loadSurveyURL(){
		
		$.ajax({
            type:"GET", 
            url: hostUrl+"/rest/chat/surveyUrl",
			data: {identity:'test@home.com', surveyName:'TestSurvey1', language:'en-US', ixid:'123456'},	
            //dataType:'json',
			async: false,				
            success:function(data){
				surveyUrl = data;
                            }
            });	 
	}
	
		function laodSurvey(surveyUrl){
			
			var win=window.open(surveyUrl, '_blank');
			  win.focus();
			
		}
	
		
	
	// Stop from Refresh
	function checkKeycode(e) {
		if(!isUserTypingFlagSet){
			userTyping();
			isUserTypingFlagSet = true;
		}
       /* var keycode;
        if (window.event)
            keycode = window.event.keyCode;
        else if (e)
            keycode = e.which;

        // Mozilla firefox
        if ($.browser.mozilla) {
            if (keycode == 116 ||(e.ctrlKey && keycode == 82)) {
                if (e.preventDefault)
                {
                    e.preventDefault();
                    e.stopPropagation();
                }
            }
        } 
        // IE
        else if ($.browser.msie) {
            if (keycode == 116 || (window.event.ctrlKey && keycode == 82)) {
                window.event.returnValue = false;
                window.event.keyCode = 0;
                window.status = "Refresh is disabled";
            }
        }*/
    }