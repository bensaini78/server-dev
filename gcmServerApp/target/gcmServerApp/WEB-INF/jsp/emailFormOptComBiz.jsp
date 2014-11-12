<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--html-->
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="url">${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}</c:set>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>Left Blank for Optimum Websites</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--  link rel="stylesheet" href="${url}/css/formoid-default-skyblue.css" type="text/css" />
	<link rel="stylesheet" href="${url}/css/ask.css" type="text/css" />-->
	<link rel="stylesheet" href="https://www.optimum.net/core-and-parts.css?201406031307">
    <link rel="stylesheet" href="/cvContactUs/css/live.css" type="text/css"/>
	<link media="screen" href="/cvContactUs/css/jquery.msg.css" rel="stylesheet" type="text/css">
</head>
<!-- mp_trans_disable_start -->
<!--body class="blurBg-false" style="background-color:#FFFFFF"-->
	<script type="text/javascript" src="/cvContactUs/js/jquery.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.formatter.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.center.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.msg.min.js"></script>
	<section class="live">
		<div class="container">
		<div class="row">
    	<div id="formContainers">
	
		<div id="chatFormContainer" class="span12" style="display: block;">
		<form:form modelAttribute="uploadForm" id='chatForm' name="chatForm" action="#" enctype="multipart/form-data" method="post">
			<div id="topBar" class="headerPart">
					<img alt="Optimum" src="/cvContactUs/images/optimum_orange.png">
			</div>
			<div class="row">
			<div class="span8">
			
			<br style="clear:both;">
			
			<div id="left"><label class="title_bold"><p>Chat with one of our representatives from our Optimum Sales team. We are here to help!</p></label></div>

			<br style="clear:both;">
			<p>All fields are required</p>
         
			<div id="messageBox2" name="messageBox2" class="error-messagebox" style="display: none">
				<ul>
				</ul>
			</div>
			<div class="row">
				<div id="custFirstName_div" class="element-input span6">
					<c:if test="${not empty userData.firstName}">
					 First Name <input type="text" id="custFirstName" name="custFirstName" class="large" value="${userData.firstName}"  required="required"/>
					</c:if>
					<c:if test="${empty userData.firstName}">
					 First Name <input type="text" id="custFirstName" name="custFirstName" class="large" required="required"/>
					</c:if>
				</div>
			</div>
			
			<div class="row">
			<div id="custLastName_div" class="element-input span6">
				<c:if test="${not empty userData.lastName}">
				 Last Name <input type="text" id="custLastName" name="custLastName" class="large" required="required" value="${userData.lastName}"/>
				</c:if>
				<c:if test="${empty userData.lastName}">
				  Last Name <input type="text" id="custLastName" name="custLastName" class="large" required="required"/>
				</c:if>
			</div>
			</div>
			
		<div class="row">	
		<div id="emailAddress_div" class="element-input span6">
				<c:if test="${not empty userData.emailAddress}">
				  Email Address <input type="text" id="emailAddress" name="emailAddress" class="large" required="required" value="${userData.emailAddress}"/>
				</c:if>
				<c:if test="${empty userData.emailAddress}">
				  Email Address <input type="text" id="emailAddress" name="emailAddress" class="large" required="required"/>
				</c:if>
			</div>
		</div>	
		<input type="hidden" name="CustProd" id="CustProd" value="CommercialSales"></input>
		<input type="hidden" name="ServiceSubType" id="ServiceSubType" value="CommercialSales"></input>
		<br style="clear:both;">
		
		<div class="row">
			<div class="submit span6">
				<!--  a onClick="javascript: popWin = window.open('', 'popupWindow', 'location=0,menubar=0,status=0,scrollbars=0,width=455,height=515,scrollbars=yes');"><input class="btn btn--secondary btn-save" type="button" name="chatSubmit" value="Submit Request" onclick="javascript:submitNamedForm('chatForm');"></-->
				<input class="btn btn--secondary btn-save" type="button" name="chatSubmit" value="Request Chat" onclick="javascript:submitNamedForm('chatForm');">
				<span id='submittingChatFormMsg' style='display: none;'><img id='formSubmit_Icon' style='margin-right:3px; margin-left:7px; margin-bottom:7px;' alt='Loading' src='/cvContactUs/images/indicator.gif'> Submitting...</span>
				
			<!--div class="submit"><input type="button" value="Continue..." onClick=""/-->
				
			</div>
		</div>
			<c:forEach var="payloadVal" items="${payloadMap}">
   					<input type="hidden" id="${payloadVal.key}"	 name="${payloadVal.key}" value="${payloadVal.value}"/>
			</c:forEach>
			</br>
			</br>
		</div>
		<div class="span4">
			
		</div>
		</div>	
		</form:form>
		</div>
	 </div>
   </div>
</div>
</section>
	<script type="text/javascript" src="/cvContactUs/js/formoid-default-skyblue.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/email.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.browser.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/commonCV_Forms.js"></script>
	
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
	
	
	<script type="text/javascript">
		changeEmail = true;
		changeChat = true;
		setTimeout(function(){
			console.log("Reached 22");
			$("li[name=topBarEmail]").each(function(){ $(this).click(function(){
				if(changeEmail){
						//oldValue = $("li[name=topBarChat] a").css('color');
						//newValue = $("li[name=topBarAnswers] a").css('color');
					   $("#emailFormContainer").show(); 
				      /*  $("li[name=topBarEmail] a").css('color', oldValue); 
				       $("li[name=topBarChat] a").css('color', newValue); */
				       $("li[name=topBarEmail]").addClass('active'); 
				       $("li[name=topBarChat]").removeClass('active');
				       $("#chatFormContainer").hide();
				       changeEmail=false;
				       changeChat=true;
					}
				}
			  )});
	
			$("li[name=topBarChat]").each(function(){ $(this).click(function(){
			if(changeChat){	
				//oldValue = $("li[name=topBarEmail] a").css('color');
				//newValue = $("li[name=topBarAnswers] a").css('color');
				$("#chatFormContainer").show(); 
				$("li[name=topBarChat]").addClass('active'); 
				$("li[name=topBarEmail]").removeClass('active');
				$("#emailFormContainer").hide();
				   changeEmail=true;
			       changeChat=false;
					}
				}
			 )});
			 //$("#chatFormContainer").hide();
		        if(isEmail == 'true'){
				//console.log(isEmail);
		       		$("#chatFormContainer").hide();
				$("#emailFormContainer").show();
			}else{
				//oldValue = $("li[name=topBarEmail] a").css('color');
				//newValue = $("li[name=topBarAnswers] a").css('color');
				$("#chatFormContainer").show(); 
				$("li[name=topBarChat]").addClass('active'); 
				$("li[name=topBarEmail]").removeClass('active');
				$("#emailFormContainer").hide();
			       changeEmail=true;
			       changeChat=false;
			}
				getFormKvpEmail();
				validateForms();
				window.scrollTo(0, 0);
		}, 150);
		
		$("#signInChat").attr('href', '/login/?referer='+window.location.href.replace('email', 'chat'));
		$("#signInEmail").attr('href', '/login/?referer='+window.location.href.replace('chat', 'email'));
		
		var isEmail = '<c:out value="${isEmail}"/>'
		var hostUrl = '<c:out value="${url}"/>';
		
	</script>
	
		<div>
			<form:form modelAttribute='fileUploadFrom' id='findFileSize' action='/cvContactUs/rest/uploadFileSize' target='uploadiframe' method='POST' enctype='multipart/form-data'/>
			<%-- form:form modelAttribute='fileUploadFrom' id='findFileSize' action='/cvContactUs/rest/uploadFileSize' target='uploadiframe' method='POST' enctype='multipart/form-data'/>--%>
			<iframe name='uploadiframe' id='uploadiframe' style="display: none;"></iframe>
			<iframe name='submitiframe' id='submitiframe' style="display: none;"></iframe>
		</div>	
<!-- mp_trans_disable_end -->
<%-- 
</body>
</html>--%>
