<!DOCTYPE html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--html-->
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="url">${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}</c:set>

<c:set var="chatAlias">${chatAlias}</c:set>
<c:set var="sessionId" value="${sessionId}"></c:set>
<c:set var="userId" value="${userId}"></c:set>
<c:set var="secureKey" value="${secureKey}"></c:set>
<c:set var="scriptPos" value="${scriptPos}"></c:set>
<c:set var="isBusiness" value="${isBusiness}"></c:set>


<script type="text/javascript">
	    // IE9 fix
	    if(!window.console) {
	        var console = {
	            log : function(){},
	            warn : function(){},
	            error : function(){},
	            time : function(){},
	            timeEnd : function(){}
	        }
	    }
</script>

<head>
    <title>Live Assistance</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="/cvContactUs/favicon.ico" /> 
    <link rel="icon" type="image/x-icon" href="/cvContactUs/favicon.ico" />
    <script type="text/javascript" src="/cvContactUs/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="/cvContactUs/js/chat.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.linkify.min.js"></script>
    
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<style type='text/css'>
.rn_ScreenReaderOnly{position:absolute; height:1px; left:-10000px; overflow:hidden; top:auto; width:1px;}
.rn_Hidden{display:none;}
</style>
<link href='/cvContactUs/css/chat_landing.themes.standard.SITE.css' rel='stylesheet' type='text/css' media='all' />
<style type="text/css">.rn_ChatDisconnectButton img{vertical-align: middle;}
.rn_ChatDisconnectButton{float: right;}
.rn_ChatPrintButton img{vertical-align: middle;}
.rn_ChatPrintButton{float: right;}
.rn_ChatServerConnect{text-align:center;}
.rn_ChatServerConnect{background:#EFEFF4 url( ) repeat-x scroll 0 0;border:solid #BBBBBB;border-width:1px 0;line-height:1.25em;margin:0 0 1em;padding:5px;}
.rn_ChatStatus2{font-size: 1.333em;font-weight: bold;line-height: 1.4em;}
.rn_ChatHours2 .rn_HoursBlock{margin: 15px 0 0 0;}
.rn_ChatHours2 .rn_HoursLabel{color:#404040;font-size:1em;font-weight:bold;line-height:1.3em;}
.rn_ChatEngagementStatus{background:#EFEFF4 url(/cvContactUs/images/whitePixel.png) repeat-x scroll 0 0;border:solid #BBBBBB;border-width:1px 0;padding:5px;line-height:1.25em;margin:0 0 1em;}
.rn_ChatEngagementStatus .rn_SearchingDetailMessage, .rn_ChatEngagementStatus .rn_RequeuedDetailMessage, .rn_ChatEngagementStatus .rn_CanceledUserDetailMessage, .rn_ChatEngagementStatus .rn_CanceledSelfServiceDetailMessage, .rn_ChatEngagementStatus .rn_CanceledNoAgentsAvailDetailMessage, .rn_ChatEngagementStatus .rn_CanceledQueueTimeoutDetailMessage, .rn_ChatEngagementStatus .rn_CanceledDequeuedDetailMessage{padding: 10px;}
.rn_ChatEngagementStatus .rn_StatusPrefix, .rn_ChatEngagementStatus .rn_Status{font-weight:bolder;}
@media print{.rn_ChatEngagementStatus{display:none;}
}
.rn_ChatQueueWaitTimeContainer{background:#EFEFF4 url(/cvContactUs/images/whitePixel.png) repeat-x scroll 0 0;border:1px solid #BBBBBB;border-width:1px;padding:5px;margin:0em 1em 1em 1em;line-height:1.25em;text-align:left;}
.rn_ChatQueueWaitTimeContainer .rn_ChatQueuePosition, .rn_ChatQueueWaitTimeContainer .rn_ChatEstimatedWaitTime, .rn_ChatQueueWaitTimeContainer .rn_ChatAverageWaitTime{padding-right:2px;}
.rn_ChatAgentStatus{background:#EFEFF4 url(/cvContactUs/images/whitePixel.png) repeat-x scroll 0 0;border:solid #BBBBBB;border-width: 1px 1px 0;padding:5px;line-height:1.25em;margin: 0 1em 0;}
@media print{.rn_ChatAgentStatus{display:none;}
}
.rn_ChatTranscript{overflow:auto;height:15em;}
.rn_ChatTranscript .rn_MessagePost{clear:both;display:block;}
.rn_ChatTranscript ol, .rn_ChatTranscript ul, .rn_ChatTranscript dl{clear:both;display:block;}
.rn_ChatTranscript{background-color: white;border:1px solid #CCCCCC;padding:0.3em;margin:0 1em 1em;}
.rn_ChatTranscript .rn_AgentTextPrefix, .rn_ChatTranscript .rn_Action{color: #000099;}
.rn_ChatTranscript .rn_UserTextPrefix{color: #990000;}
.rn_ChatTranscript .rn_OffTheRecordMessage{color: #009900;}
.rn_ChatTranscript blockquote, .rn_ChatTranscript ul, .rn_ChatTranscript ol, .rn_ChatTranscript dl{margin:1em;}
.rn_ChatTranscript ol, .rn_ChatTranscript ul, .rn_ChatTranscript dl{margin-left:2em;}
.rn_ChatTranscript ol li{list-style: decimal outside;}
.rn_ChatTranscript ul li{list-style: disc outside;}
@media print{.rn_ChatTranscript{border:0;height:auto;margin:0;overflow:visible;}
}
.rn_ChatCancelButton img{vertical-align: middle;}
.rn_ChatCancelButton{float: right;margin:0em 1em;}
.rn_ChatRequestEmailResponseButton{float: right;margin:1em 5px;}
.rn_ChatPostMessage textarea{overflow: auto;}
.rn_ChatPostMessage span{display: block;}
.rn_ChatPostMessage legend{display: none;}
.rn_ChatPostMessage textarea{width:100%;padding:0;}
.rn_ChatPostMessage{margin:0 1.2em 0em 1em;}
@media print{.rn_ChatPostMessage{display:none;}
}
.rn_ChatSendButton img{vertical-align: middle;margin-top: -3px;margin-bottom: -3px;}
.rn_ChatSendButton{float: right;margin:1em 5px;}
@media print{.rn_ChatSendButton{display:none;}
}
.rn_ChatAttachFileButton img{vertical-align: middle;margin-top: -3px;margin-bottom: -3px;}
.rn_ChatFileAttachContent input{width: 275px;}
.rn_ChatAttachFileButton{float: right;margin: 1em 5px;}
.rn_ChatCoBrowseButton img{vertical-align: middle;margin-top: -3px;margin-bottom: -3px;}
.rn_ChatCoBrowseButton iframe{visibility: visible;position: absolute;top: -1000px;left: -1000px;height: 1px;width: 1px;}
.rn_ChatCoBrowseButton{float: right;margin: 1em 5px;}
.rn_ChatQueueSearch{background:#EFEFF4 url(/cvContactUs/images/whitePixel.png) repeat-x scroll 0 0;border:1px solid #BBBBBB;line-height:1.25em;margin:1em 1em 1em 1em;padding:5px;text-align:center;}
.rn_KeywordText2 input{font-size:1.333em;}
.rn_KeywordText2{display:inline;}
.rn_SearchButton2{display:inline;bottom: 0px;}
.rn_SearchButton2 input{border:none;vertical-align:top;}
.rn_SearchButton2 .rn_SubmitButton{background-color:#0E53A7;color:#FFF;cursor:pointer;font-weight:bold;}
.rn_RightNowLogo a{background:url() no-repeat scroll 0 0 !important;display:block !important;height:22px !important;width:134px !important;}
.rn_RightNowLogo a:focus, .rn_RightNowLogo a:hover{background-position:0 -22px !important;}
</style>

</head>

	

<body class="yui-skin-sam">
<form class='rn_Hidden'><input id='rn_History_Field' type='hidden'/></form>

    <div id="rn_ChatContainer">
        <a name="rn_MainContent" id="rn_MainContent"></a>
        <div id="rn_PageContent" class="rn_Live">
            <div class="rn_Padding" >
                <div id="rn_ChatDialogContainer">
                    <!--rn:widget path="chat/ChatOffTheRecordDialog"/-->
                    <div id="rn_ChatDialogHeaderContainer">
                        <div id="rn_ChatDialogTitle" class="rn_FloatLeft"><h3>Chat</h3></div>
                        <div id="rn_ChatDialogHeaderButtonContainer">
                            <span id="rn_ChatDisconnectButton_0" class="rn_ChatDisconnectButton rn_Hidden">
    <button id="rn_ChatDisconnectButton_0_Button" title="Terminate the Chat"><img src="/cvContactUs/images/chat_disconnect.png" alt="Terminate the Chat" /> Disconnect</button>
	<button id="rn_ChatDisconnectButton_0_ButtonClose" title="Close the window" style="display: none;"><img src="/cvContactUs/images/chat_close.png"> Close</button>
</span>

                            <!--rn:widget path="chat/ChatOffTheRecordButton"/-->
                            <span id="rn_ChatPrintButton_1" class="rn_ChatPrintButton rn_Hidden">
    <button id="rn_ChatPrintButton_1_Button" title="Print the Transcript" onClick="window.print()"><img src="/cvContactUs/images/chat_print.png" alt="Print the Transcript" /> </button>
</span>
                        </div>
                    </div>
                    <%-- <div id="rn_ChatServerConnect_2" class="rn_ChatServerConnect">
            <div id="rn_ChatServerConnect_2_Connector">
                            <img alt="" id="rn_ChatServerConnect_2_ConnectingIcon" src="https://optimum.custhelp.com/euf/rightnow/optimized/1391696935/themes/standard/images/indicator.gif"/>&nbsp;<span id="rn_ChatServerConnect_2_Message">Please wait while we establish a connection to the Chat Server.</span>
                    </div>
    </div>--%>
                    <div id="rn_ChatEngagementStatus_3" class="rn_ChatEngagementStatus">
    <span id="rn_ChatEngagementStatus_3_Prefix" class="rn_StatusPrefix">
        Status:     </span>
    <span id="rn_ChatEngagementStatus_3_Status" class="rn_Status">
        Searching    </span>
    <div id="rn_ChatEngagementStatus_3_Searching" class="rn_SearchingDetailMessage rn_Hidden">
        <img alt="" src=""/>&nbsp;<span>Searching for an available agent</span>
    </div>
    <div id="rn_ChatEngagementStatus_3_Requeued" class="rn_RequeuedDetailMessage rn_Hidden">
        You have been re-queued.    </div>
    <div id="rn_ChatEngagementStatus_3_Canceled_User" class="rn_CanceledUserDetailMessage rn_Hidden">
        You have left the queue. If you still need assistance please try back later.    </div>
    <div id="rn_ChatEngagementStatus_3_Canceled_Self_Service" class="rn_CanceledSelfServiceDetailMessage rn_Hidden">
        You have left the queue. We hope you have found what you were looking for.    </div>
    <div id="rn_ChatEngagementStatus_3_Canceled_NoAgentsAvail" class="rn_CanceledNoAgentsAvailDetailMessage rn_Hidden">
        There are no agents available to chat with you right now. Please try again later.    </div>
    <div id="rn_ChatEngagementStatus_3_Canceled_Queue_Timeout" class="rn_CanceledQueueTimeoutDetailMessage rn_Hidden">
        There are no agents available to chat with you right now. Please try again later.    </div>
    <div id="rn_ChatEngagementStatus_3_Canceled_Dequeued" class="rn_CanceledDequeuedDetailMessage rn_Hidden">
        You have been removed from the queue. Please contact us by email.    </div>
</div>
       <div id="rn_ChatServerConnect_2" class="rn_ChatServerConnect">
            <div id="rn_ChatServerConnect_2_Connector">
                            <img alt="" id="rn_ChatServerConnect_2_ConnectingIcon" src="/cvContactUs/images/indicator.gif"/>&nbsp;<span id="rn_ChatServerConnect_2_Message">Please wait while we establish a connection to the Chat Server.</span>
                    </div>
    </div>
<div id="rn_ChatQueueWaitTime_4" class="rn_ChatQueueWaitTimeContainer rn_Hidden">
    <span id="rn_ChatQueueWaitTime_4_QueuePosition" class="rn_ChatQueuePosition" title="Your current position in the queue.">Please wait while your queue position is calculated...</span>
    <span id="rn_ChatQueueWaitTime_4_EstimatedWaitTime" class="rn_ChatEstimatedWaitTime rn_Hidden" title="Estimate of how long before an agent will be available to chat with you."></span>
    <span id="rn_ChatQueueWaitTime_4_AverageWaitTime" class="rn_ChatAverageWaitTime rn_Hidden" title="Average time before an agent becomes available."></span>
</div>
                    <div id="rn_ChatAgentStatus_5" class="rn_ChatAgentStatus rn_Hidden">
                    <div id="rn_ChatAgentStatus_5_Agent_19">
                    	<img src="/cvContactUs/images/chat_agent.png"> </div>
				</div>
                    <div id="rn_ChatTranscript_6" class="rn_ChatTranscript rn_Hidden">
</div>
                    <div id="rn_PreChatButtonContainer">
                        <div id="rn_ChatCancelButton_7" class="rn_ChatCancelButton">
    <button id="rn_ChatCancelButton_7_Button"  title="Terminate the Chat Request"> Leave</button>
</div>
                        <div id="rn_ChatRequestEmailResponseButton_8" class="rn_ChatRequestEmailResponseButton rn_Hidden">
    <button id="rn_ChatRequestEmailResponseButton_8_Button" title="Open a new browser window and navigate to the Ask a Question page">Request Email Response</button>
</div>
                    </div>
                    <div id="rn_ChatPostMessage_9" class="rn_ChatPostMessage rn_Hidden">
    <div>Type your message here, then click Send or press &lt;Enter&gt;</div>
    <fieldset>         <legend></legend>
        <span>
            <textarea id="rn_ChatPostMessage_9_Input" rows="3" cols="50"></textarea>
        </span>
    </fieldset>
</div>
                    <div id="rn_InChatButtonContainer">
                        <span id="rn_ChatSendButton_10" class="rn_ChatSendButton rn_Hidden" title="Send the message to the agent">
    <button id="rn_ChatSendButton_10_Button"> Send</button>
</span>
                        <div id="rn_ChatAttachFileButton_11" class="rn_ChatAttachFileButton rn_Hidden">
    <div id="rn_ChatAttachFileButton_11_ButtonContent">
        <button id="rn_ChatAttachFileButton_11_Button" title="Attach a file to the transcript"> Attach File</button>
    </div>
    <div id="rn_ChatAttachFileButton_11_FileAttachContent" class="rn_ChatFileAttachContent rn_Hidden">
          <input name="file" id="rn_ChatAttachFileButton_11_Browse" type="file" size="35"/>
            <div id="rn_ChatAttachFileButton_11_ErrorMessage"></div>
    </div>
</div>
                        <div id="rn_ChatCoBrowseButton_12" class="rn_ChatCoBrowseButton">
    <button id="rn_ChatCoBrowseButton_12_Button" class="rn_Hidden" title="End the screen sharing session with the agent"> End Screen Share</button>
    <iframe id="rn_ChatCoBrowseButton_12_IFrame"></iframe>
</div>
                    </div>
                    <div id="rn_ChatQueueSearchContainer">
                        <div id="rn_ChatQueueSearch_13" class="rn_ChatQueueSearch">
    <form method="post" action="" onsubmit="return false" >
        <div id="rn_KeywordText2_14" class="rn_KeywordText2">
    <label for="rn_KeywordText2_14_Text">You can search for an answer while you wait</label>
    <input id="rn_KeywordText2_14_Text" name="rn_KeywordText2_14_Text" type="text" maxlength="255" value=""  />
</div>
        <div id="rn_SearchButton2_15" class="rn_SearchButton2">
            <input type="submit" class="rn_SubmitButton" id="rn_SearchButton2_15_SubmitButton"  value="Search" />
        </div>
    </form>
</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="rn_Footer">
            <div id="rn_RightNowCredit">
                <div class="rn_FloatRight">
                    <span id="rn_RightNowLogo_16" class="rn_RightNowLogo_Ben">
                        
</span>
                </div>
            </div>
        </div>
    </div>



	


<script type="text/javascript">
	$(document).ready(function(){
		exitButtonListener();
		submitUserMessages();
		//loadSurveyURL();
		faqSeachChatListener();
		document.onkeydown = checkKeycode;
		chatAlias = '<c:out value="${chatAlias}"/>';
		secureKey = '<c:out value="${secureKey}"/>';
		userId = '<c:out value="${userId}"/>';
		scriptPos = '<c:out value="${scriptPos}"/>';
		hostUrl = '<c:out value="${hostUrl}"/>';
		sessionId = '<c:out value="${sessionId}"/>';
		isBusiness = '<c:out value="${isBusiness}"/>';
		//hostUrl='https://contactus.cablevision.com/cvContactUs';
		setRefresh(12000);
		heartBeat();
		
		$('#rn_ChatCancelButton_7').show();
		$("#rn_ChatQueueSearch_13").removeClass('rn_ScreenReaderOnly');
		
		window.onbeforeunload = function (e) {
			console.log("Closing the Window");
			if(isSetUpForChat){
				//laodSurvey(surveyUrl);
			}
			disconnect();
		};
		
	});
</script>
</body>

</html>


<%-- 
</body>
</html>--%>
