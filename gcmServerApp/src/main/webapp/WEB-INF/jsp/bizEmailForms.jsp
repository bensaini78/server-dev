
<html>


<body>

	



	<script
		src="https://business.optimum.net/partner/subLayout.js?part=top&disableVeveoSearch=true&https=true&channel=support&level2=customersupport"></script>

	
	<div id="ccisForm">
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="urlContext">${req.contextPath}</c:set>
<c:set var="url">${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}</c:set>
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<link rel="shortcut icon" href="/cvContactUs/favicon.ico" /> 
   		<link rel="icon" type="image/x-icon" href="/cvContactUs/favicon.ico" />
		<title>Optimum Business - Customer Support - Email Us</title>
		<link  href="${url}/css/jquery.msg.css" rel="stylesheet" type="text/css"/>
		<link  href="${url}/css/CCISSupport.css" rel="stylesheet" type="text/css"/>
		<link  href="${url}/css/global.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="${url}/js/jquery.min.js"></script>
</head>

<script type="text/javascript">
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

<script>
		var hostUrl = '<c:out value="${url}"/>';
		
		$.getScript(hostUrl+"/js/jquery.min.js", function(script, textStatus){
			URLO=["/js/jquery.center.min.js", "/js/jquery.msg.min.js", "/js/jquery.browser.min.js"];
			var headID = document.getElementsByTagName("head")[0];
			var script;
			
			for(ii=0; ii<URLO.length; ii++){
				console.log(" For value : " + ii + " done");
				script = document.createElement('script');
				script.type='text/javascript';
				script.src=hostUrl+URLO[ii];
				headID.appendChild(script);
			}
			
			$.getScript(hostUrl+"/js/bizemail.js").done(function(script, textStatus){
				console.log("2ND eMAIL.JS done");
				dropDrownsDivs();	
			});
			$.getScript(hostUrl+"/js/jquery.formatter.min.js").done(function(script, textStatus){
				console.log("3RD formater done");
				
				$.getScript(hostUrl+"/js/jquery.validate.min.js").done(function(script, textStatus){
					$.getScript(hostUrl+"/js/commonCV_Forms.js").done(function(script, textStatus){
						console.log("4TH commonCV_forms done");
						getFormKvpEmail();
						$.getScript(hostUrl+"/js/formoid-default-skyblue.js").done(function(script, textStatus){
							console.log("5TH formoid-default-skyblue done");
							validateForms();
							onLoadCall();
						});
						
					});
				});	
				
			});
			
			
		});
		
</script>
<!-- mp_trans_disable_start -->

		<section class="live">
		<div class="container">
		<div class="rtColWrapper">
    	<div id="formContainers" class="contentMarker g_theme">
				
		<c:choose>
				<c:when test="${isEmail}">
					<div id="emailFormContainer" class="span12" style="display: block;">
				</c:when>
				<c:otherwise>
					<div id="emailFormContainer" class="span12" style="display: none;">
				</c:otherwise>
		</c:choose>
		<form:form modelAttribute="uploadForm" id='emailForm' name="emailForm" action="/cvContactUs/rest/sendEmailWithAttachment" enctype="multipart/form-data" method="post" >
				
				<div id="topBar" class="headerPart">
					<ul class="padding-0">
						
								<li id="topBarAnswers" name="topBarAnswers" class="left"><h2><a href="${ctx['biz_net.answers.list']}">Answers</a></h2></th>
								<li id="topBarEmail" class="active" name="topBarEmail"><h2><a href="#" onClick="return false;">Email Us</a></h2></th>
								<li id="topBarChat" name="topBarChat"><h2><a href="#" onClick="return false;">Live Chat</a></h2></th>
								<li id="topBarHelp" class="right" name="topBarHelp"><h2><a href="${ctx['biz_net.help.page']}">Help</a></h2></li>
					</ul>
				</div>
				
	   
	     <div class="clearfix">
         <div class="g_form_left floatLeft">
	 	<div id="rn_PageTitle" class="span12 rn_AskQuestion padding-0">
							
    						<h3 id="rn_Summary">Ask a question
    						<c:if test="${lang == 'es-us'}"> 
    						(sólo en inglés)
    						</c:if>
    						</h3>
		</div>
		
				<label class="title_bold">
					<h4>Email support is available 24 hours a day, seven days a week.</h4>
				</label>
				
						
			<div id="messageBox1" name="messageBox1" style="display: none" class="error-messagebox">
				<ul>
				</ul>
			</div>
			
		
		<div class="row">
		
			<div class="element-input span6" >
				<label for="emailAddress" class="title">Email address<span class="required-label">*</span></label>
				<c:if test="${not empty userData.emailAddress}">
				    <input id="emailAddress" name="emailAddress" class="large" type="email"   value="${userData.emailAddress}"/>
				</c:if>
				<c:if test="${empty userData.emailAddress}">
				    <input id="emailAddress" name="emailAddress" class="large" type="email"  />
				</c:if>
			</div>
		</div>	
		
		<div class="row">
			<div class="element-input span6" >
				<label for="subject" class="title">Subject<span class="required-label">*</span></label>
				<input id="subject" name="subject" class="large" type="text"  />
			</div>
		</div>	
			
		<div class="row">	
			<div class="element-input span8" >
				<label for="body" class="title">Enter your question<span class="required-label">*</span></label>
				<textarea id="body" name="body" class="medium" name="question" cols="20" rows="5"  ></textarea>
			</div>
		</div>	
		
		<div class="row">
			<div id="product" class="element-input span6" >
				<label for="CustProdEmail" class="title">Product<span class="required-label">*</span></label>
				<div class="medium"><span>
						<select id="CustProdEmail" name="CustProd"   style='display: none;' onChange='javascript:showSubproduct();'>
						<option value=''>Please select a product</option>
						<c:forEach var="i" begin="1" end="${fn:length(productList)}">
							<c:forEach var="product" items="${productList}">
								<c:if test="${product.displayOrder == i }">
									<option productId="${product.productId}" value="${product.productCode}">${product.productName}</option>
								</c:if>	
							</c:forEach>
						</c:forEach>
						</select>
						<div class="custom-select">
							<div id="CustProdEmail" class="styledSelect" tabindex="1">Make a selection</div>
							<ul class="options" style="display: none;">
							<c:forEach var="i" begin="1" end="${fn:length(productList)}">
								<c:forEach var="product" items="${productList}">
											<c:if test="${product.displayOrder == i }">
												<li productId="${product.productId}">${product.productName}</li>
											</c:if>	
								</c:forEach>
							</c:forEach>
							</ul>
						</div>
					</span>
				</div>
			</div>
			</div>
			
			<div class="clearfix">
			
			<div id="sub-product" class="element-input span6" style="display: none">
					<label for="ServiceSubTypeEmail" class="title">Sub product<span class="required-label">*</span></label>
					<div class="medium"><span>
						<select id="ServiceSubTypeEmail" name="ServiceSubType"   style='display: none;'>
								<option selected="true" value="_blank">--</option>
							</select>
						<div class="custom-select">
							<div id="ServiceSubTypeEmail" class="styledSelect"tabindex="1">Make a selection</div>
							<ul name="ServiceSubTypeEmail" class="options" style="display: none;">
							</ul>	
						</div>
						</span>
					</div>
			</div>
			</div>
			<c:choose>
			
				<c:when test="${userData.isAuthenticated}">
				</c:when>
				
				<c:otherwise>
					<div class="row clearfix">			
					<div class="element-input span6" >
						<label for="PhoneNumber" class="title">Phone number on your account<span class="required-label">*</span></label>
						<input id="PhoneNumber" class="large" type="text" name="PhoneNumber"  />
					</div>
					</div>
				</c:otherwise>
			</c:choose>
				
			<div class="row hidden-tablet hidden-mobile visible-desktop">
			<div class="element-input span6">
						 <div class="medium file_inputwrap1">
	                         <span for="file_input" class="file_label">Attach Documents</span>
								
								<label class="medium file_inputwrap">
									<span id='fileTooLarge' style='display: none;'></span>
									<div id="filebtn" class="filebtn">Choose file</div><span class="no-file-selected">no file selected</span>
									<span class="no-file-selected up" style='display: none;'>Uploading...</span>
									<input id="file_input" class="file_input" onChange="javascript:attachMultiplFiles();" name="files" type="file"/>
								</label>
								
						 </div>
			</div>
			
			<div class="row">
			<div class="submit span12">
					<input value="Continue" name="emailSubmit" class="btn btn--secondary btn-save" onclick="javascript:submitNamedForm('emailForm');" type="button">
					<!--div class="submit"><input type="button" value="Continue..." onClick=""/-->
					<!-- a id="submit-print" style="white-space: nowrap; padding-left: 15px;" href="javascript:window.print();" title="Print this form"><img align="absbottom" style="margin-right:3px; margin-bottom:7px;" src="/cvContactUs/images/Print.png" alt="">Print Copy of Your E-Mail to Us</a> -->
					<span id='submittingFormMsg' style='display: none;'><img id='formSubmit_Icon' style='margin-right:3px; margin-left:7px; margin-bottom:7px;' alt='Loading' src='${url}/images/indicator.gif'> Submitting...</span>
			</div>
			</div>
			<c:forEach var="payloadVal" items="${payloadMap}">
   					<input type="hidden" id="${payloadVal.key}"	 name="${payloadVal.key}" value="${payloadVal.value}"/>
			</c:forEach>
		
		</div>	
		</div>
		<div class="g_form_right floatRight">
			<span class="ask_label" id="indicates_required"><font color="red">*</font> Required field.</span>
			
			<c:choose>
			
				<c:when test="${userData.isAuthenticated}">
				</c:when>
				
				<c:otherwise>
					<div class="signinbox">
						<a id="signInEmail" href="">Sign in</a> so we know who you are!
					</div>
				</c:otherwise>
			</c:choose>
			
		</div>
		</div>
		</form:form>
		</div>
		
		<c:choose>
				<c:when test="${isEmail}">
					<div id="chatFormContainer" class="span12" style="display: none;" >
				</c:when>
				<c:otherwise>
					<div id="chatFormContainer" class="span12" style="display: block;" >
				</c:otherwise>
		</c:choose>
		
		<form:form modelAttribute="uploadForm" id='chatForm' name="chatForm" action="#" enctype="multipart/form-data" method="post">
				<div id="topBar" class="headerPart">
					<ul class="padding-0">
						
								<li id="topBarAnswers" name="topBarAnswers" class="left"><h2><a href="${ctx['biz_net.answers.list']}">Answers</a></h2></th>
								<li id="topBarEmail" name="topBarEmail"><h2><a href="#" onClick="return false;">Email Us</a></h2></th>
								<li id="topBarChat" class="active" name="topBarChat"><h2><a href="#" onClick="return false;">Live Chat</a></h2></th>
								<li id="topBarHelp" class="right" name="topBarHelp"><h2><a href="${ctx['biz_net.help.page']}">Help</a></h2></li>
					</ul>
				</div>
			
			<div class="row">
			<div class="g_form_left floatLeft">
			<div id="rn_PageTitle" class="span12 rn_AskQuestion padding-0">
							<!-- span class="ask_label" id="indicates_required" style="float:right;padding-top:40px;"><strong><font color="red">*</font> Indicates Required Fields</strong></span> -->
    						<h3 id="rn_Summary">Live chat support
    						<c:if test="${lang == 'es-us'}"> 
    						(sólo en inglés)
    						</c:if>
    						</h3>
			</div>
			<label class="title_bold">
			<h4>Live Chat support is available 24 hours a day, seven days a week.</h4>
			</label>
		
			
			<p>Fill out the information below to launch a chat session. A live representative will help you with your request.</p>
         
			<div id="messageBox2" name="messageBox2" class="error-messagebox" style="display: none">
				<ul>
				</ul>
			</div>
			<div class="clearfix">
				<div id="custFirstName_div" class="element-input floatLeft" >
					 <label for="custFirstName" class="title">First name
						        	<span class="required-label"> * </span>
					 </label>
					<c:if test="${not empty userData.firstName}">
					   <input type="text" id="custFirstName" name="custFirstName" class="large" value="${userData.firstName}"   />
					</c:if>
					<c:if test="${empty userData.firstName}">
					  <input type="text" id="custFirstName" name="custFirstName" class="large"  />
					</c:if>
				</div>
			<!-- /div>
			
			<div class="row"> -->
			<div id="custLastName_div" class="element-input floatRight">
				<label for="custLastName" class="title">Last name
					<span class="required-label"> * </span>
   				</label>
				<c:if test="${not empty userData.lastName}">
				    <input type="text" id="custLastName" name="custLastName" class="large"   value="${userData.lastName}"/>
				</c:if>
				<c:if test="${empty userData.lastName}">
				    <input type="text" id="custLastName" name="custLastName" class="large"  />
				</c:if>
			</div>
			</div>
			
		<div class="row">	
		<div id="emailAddress_div" class="element-input span6">
				<label for="emailAddressChat" id="rn_TextInput_14_Label">Email address
					<span class="required-label"> * </span>
   				</label>
				<c:if test="${not empty userData.emailAddress}">
				    <input type="text" id="emailAddressChat" name="emailAddressChat" class="large"   value="${userData.emailAddress}"/>
				</c:if>
				<c:if test="${empty userData.emailAddress}">
				    <input type="text" id="emailAddressChat" name="emailAddressChat" class="large"  />
				</c:if>
			</div>
		</div>	
		
		<c:choose>
			
				<c:when test="${userData.isAuthenticated}">
				</c:when>
				
				<c:otherwise>
					<div class="row">
						<div id="PhoneNum_div" class="element-input span6">
			        					<label for="PhoneNumberChat" id="rn_TextInput_17_Label">Phone number on your account
			        						<span class="required-label"> * </span>
			            				</label>
			            				<input id="PhoneNumberChat" class="large" type="text" name="PhoneNumberChat"  />
			        					<!-- input type="text" id="rn_TextInput_17_phone" name="rn_TextInput_17_phone" class="rn_Text"  /> -->
						</div>
					</div>	
				</c:otherwise>
		</c:choose>
				
		<div class="row">			
			 <div id="CustProd_div" class="element-input span6">
      					<label for="CustProdChat">Chat request type
      						<span class="required-label"> * </span>
              				<!--  span class="rn_ScreenReaderOnly">
      							Please select the type of request you need assistance with, either Account/Billing Inquiry, Internet/Voice Inquiry or TV/Video Inquiry.
      						</span>-->
      					</label>
        				<select id="CustProdChat" name="CustProdChat"   onChange='javascript:showSubproduct();' style="display: none;">
						<option value=''>Make a selection</option>
						<c:forEach var="i" begin="1" end="${fn:length(productListChat)}">
							<c:forEach var="product" items="${productListChat}">
								<c:if test="${product.displayOrder == i }">
									<option productId="${product.productId}" value="${product.productCode}">${product.productName}</option>
								</c:if>	
							</c:forEach>
						</c:forEach>
						</select>
						<div class="custom-select">
							<div id="CustProdChat" class="styledSelect" tabindex="1">Make a selection</div>
							<ul class="options" style="display: none;">
							<c:forEach var="i" begin="1" end="${fn:length(productListChat)}">
								<c:forEach var="product" items="${productListChat}">
											<c:if test="${product.displayOrder == i }">
												<li productId="${product.productId}">${product.productName}</li>
											</c:if>	
								</c:forEach>
							</c:forEach>
							</ul>
						</div>
						<!-- <span id="rn_SelectionInput_20_Hint" class="rn_HintBox yui-module yui-overlay yui-overlay-hidden" style="z-index: 2; visibility: hidden;">
                				<div class="bd">
                					Please select the type of request you need assistance with, either Account/Billing Inquiry, Internet/Voice Inquiry or TV/Video Inquiry.
                				</div>
                		</span> -->
				</div>
			</div>
		
			
			<div class="row">
			<div id="sub-product" class="element-select span6" style="display: none">
					<label for="ServiceSubType" class="title">Sub Product<span class="required-label">*</span></label>
					<div class="medium"><span>
						<select id="ServiceSubType" name="ServiceSubType"  >
							</select>
						</span>
					</div>
			</div>
			</div>
			
			<div class="row">
				<div id="subject_div" class="element-input span6" style="float:left;width:100%;">
  					<label for="subjectChat" class="title">Enter your question
  						<span class="required-label"> * </span>
      				</label>
					<input type="text" id="subjectChat" name="subjectChat" class="large"  />
				</div>
			</div>
				
			 <div class="row">
              	<div id="fromtext" class="span12">
                  	<div class="fromtext">
                          <p>Your internet security is important to us.  We want to remind you not to share sensitive data, such as Social Security numbers, credit or debit card information, banking information or other sensitive information via Live Chat. Our Optimum Experts will never ask you to share this type of information via Live Chat.</p>
                      </div>
                  </div>
              </div>	
              
			<div class="row">
			<div class="submit span6">
				<!--  a onClick="javascript: popWin = window.open('', 'popupWindow', 'location=0,menubar=0,status=0,scrollbars=0,width=455,height=515,scrollbars=yes');"><input class="btn btn--secondary btn-save" type="button" name="chatSubmit" value="Submit Request" onclick="javascript:submitNamedForm('chatForm');"></-->
				<input class="btn btn--secondary btn-save" type="button" name="chatSubmit" value="Submit request" onclick="javascript:submitNamedForm('chatForm');">
				<span id='submittingChatFormMsg' style='display: none;'><img id='formSubmit_Icon' style='margin-right:3px; margin-left:7px; margin-bottom:7px;' alt='Loading' src='${url}/images/indicator.gif'> Submitting...</span>
				
			<!--div class="submit"><input type="button" value="Continue..." onClick=""/-->
				
			</div>
			</div>
			<c:forEach var="payloadVal" items="${payloadMap}">
   					<input type="hidden" id="${payloadVal.key}"	 name="${payloadVal.key}" value="${payloadVal.value}"/>
			</c:forEach>
			
		</div>
		<div class="g_form_right floatRight">
			<span class="ask_label" id="indicates_required"><font color="red">*</font> Required Field.</span>
			
			<div class="messagebox">
				<p class="bold">Important:</p>
				<p>You can also visit our <a href="${ctx['biz_net.answer.center']}" class="blue">Answer Center</a> for information online regarding frequently asked questions or click <a href="https://business.optimum.net/support/csc/emailUs" class="blue">here</a> for e-mail support.</p>
				<p>Click the following if you: <a href="${ctx['biz_net.forgot.password']}" class="blue">Forgot Password</a> or <a href="${ctx['biz_net.forgot.optid']}" class="blue">Forgot Optimum ID</a>.</p> 
			</div>
		
			<c:choose>
			
				<c:when test="${userData.isAuthenticated}">
				</c:when>
				
				<c:otherwise>
					<div class="signinbox">
						<a id="signInChat" href="">Sign in</a> so we know who you are!
					</div>
				</c:otherwise>
			</c:choose>
		 </div>
		</div>	
		</form:form>
		</div>
	 </div>
   </div>
 </div>
  
</section>
		
	<script type="text/javascript">
		changeEmail = true;
		changeChat = true;
		var isEmail = '<c:out value="${isEmail}"/>';
		var hostUrl = '<c:out value="${url}"/>';
		var chatHostUrl = '<c:out value="${hostUrl}"/>';
		var rntHostUrl = '<c:out value="${rntUrl}"/>';
		
		function onLoadCall(){	
			console.log("Reached 22");
			$("li[name=topBarEmail]").each(function(){ $(this).click(function(){
				if(changeEmail){
					   $("#emailFormContainer").show(); 
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
				$("#chatFormContainer").show(); 
				$("li[name=topBarChat]").addClass('active'); 
				$("li[name=topBarEmail]").removeClass('active');
				$("#emailFormContainer").hide();
				   changeEmail=true;
			       changeChat=false;
					}
				}
			 )});
			
		        if(isEmail == 'true'){
				$("input[id=emailAddress]").focus();
			}else{
				$("input[id=custFirstName]").focus();
			       changeEmail=true;
			       changeChat=false;
			}
				window.scrollTo(0, 0);
		}
		
		$("#signInChat").attr('href', 'https://www.optimum.net/login/?referer='+window.location.href.replace('email', 'chat').replace('=','%3D'));
		$("#signInEmail").attr('href', 'https://www.optimum.net/login/?referer='+window.location.href.replace('chat', 'email').replace('=','%3D'));
		
		
		
	</script>
	
		<div>
			<form:form modelAttribute='fileUploadFrom' id='findFileSize' action='${hostUrl}/rest/uploadFileSize' target='uploadiframe' method='POST' enctype='multipart/form-data'/>
			<iframe name='uploadiframe' id='uploadiframe' style="display: none;"></iframe>
			<iframe name='submitiframe' id='submitiframe' style="display: none;"></iframe>
		</div>	
<!-- mp_trans_disable_end -->


	
	
	
	</div>


	<script
		src="https://business.optimum.net/partner/subLayout.js?part=bottom"></script>
</body>
</html>