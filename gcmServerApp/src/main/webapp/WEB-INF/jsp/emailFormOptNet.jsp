<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="url">${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}</c:set>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link media="screen" href="/cvContactUs/css/jquery.msg.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript" src="/cvContactUs/js/jquery.min.js"></script>
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
		var hostUrl = '/cvContactUs';
			var windowhost = window.location.host;
			var windowpathname  = window.location.pathname;
			if(windowhost === 'espanol.optimum.net'){

				if((/stage2/).test(windowpathname)){
						
					hostUrl = '/sdstage2/cvContactUs';
					}else if((/stage/).test(windowpathname)){
					hostUrl = 'sdstage/cvContactUs';	
					}	

			}
			
			console.log("hostUrl is : " + hostUrl);
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
				
				$.getScript(hostUrl+"/js/resiemail.js").done(function(script, textStatus){
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
		<div class="row">
    	<div id="formContainers">
		
		<c:choose>
				<c:when test="${isEmail}">
					<div id="emailFormContainer" class="span12">
				</c:when>
				<c:otherwise>
					<div id="emailFormContainer" class="span12" style="display: none;">
				</c:otherwise>
		</c:choose>
		<form:form modelAttribute="uploadForm" id='emailForm' name="emailForm" action="/cvContactUs/rest/sendEmailWithAttachment" enctype="multipart/form-data" method="post" onsubmit="false;">
		<div id="topBar" class="headerPart visible-desktop hidden-phone visible-tablet">
		<ul class="span9 padding-0">
			
					<li id="topBarAnswers" name="topBarAnswers" class="left"><h2><a href="${ctx['resi_net.answers.list']}">Answers</a></h2></th>
					<li id="topBarEmail" class="active" name="topBarEmail"><h2><a href="#" onClick="return false;">Email Us</a></h2></th>
					<li id="topBarChat" name="topBarChat"><h2><a href="#" onClick="return false;">Live Chat</a></h2></th>
		</ul>
			<ul class="span3 right">
					<li id="topBarHelp" class="right" name="topBarHelp"><h2><a href="${ctx['resi_net.help.page']}">Help</a></h2></li>
			</ul>
		</div>
	   
	   <div class="row"> 
	   		<div class="span4">
				<span class="ask_label visible-tablet hidden-mobile visible-desktop" id="indicates_required"><font color="red">*</font> Indicates required fields</span>
				
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
	    <div class="span8">
	 	<div id="rn_PageTitle" class="span12 rn_AskQuestion padding-0">
							
    						<h3 id="rn_Summary">Ask a question
    						<c:if test="${lang == 'es-us'}"> 
    						(sólo en inglés)
    						</c:if>
    						<c:if test="${lang == 'es-US'}"> 
    							(sólo en inglés)
    						</c:if>
    						</h3>
		</div>
				
			<div id="left">
				
				<h4>Email support is available 24 hours a day, seven days a week.</h4>
				<span class="ask_label hidden-tablet hidden-desktop" id="indicates_required">
					<font color="red">*</font> Indicates required fields
				</span>
				
			</div>		
				
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
			<div class="element-input span8">
				<label for="body" class="title">Enter your question<span class="required-label">*</span></label>
				<textarea id="body" name="body" class="medium" name="question" cols="20" rows="5"  ></textarea>
			</div>
		</div>	
		
		<div class="row">
			<div id="product" class="element-input span6" >
				<label for="CustProd" class="title">Product<span class="required-label">*</span></label>
				<div class="medium"><span>
						<select id="CustProdEmail" name="CustProd" style='display: none;' onChange='javascript:showSubproduct();'>
						<option value=''>Make a selection</option>
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
			
			<div class="row">
			
			<div id="sub-product" class="element-input span6" style="display: none">
					<label for="ServiceSubType" class="title">Sub product<span class="required-label">*</span></label>
					<div class="medium"><span>
						<select id="ServiceSubTypeEmail" name="ServiceSubType"   style='display: none;'>
								<option selected="true" value="_blank">--</option>
							</select>
						<div class="custom-select">
							<div id="ServiceSubTypeEmail" class="styledSelect" tabindex="1">Make a selection</div>
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
					<div class="row">			
					<div class="element-input span6" >
						<label for="PhoneNumber" class="title">Phone number on your account<span class="required-label">*</span></label>
						<input id="PhoneNumber" class="large" type="text" name="PhoneNumber"  />
					</div>
					</div>
				</c:otherwise>
			</c:choose>
				
			<div class="row hidden-tablet hidden-mobile visible-desktop">
			<div class="element-input span6">
						<label for="file_input" class="title_attach_doc">Attach documents</label>
						<label for="file_input_too_large" class="title_attach_doc" style="color:red; font-size: 12px; font-weight:normal;"><span id='fileTooLarge' style='display: none;'></span></label>
						<label class="medium file_inputwrap">
						<input id="file_input" class="file_input" onChange="javascript:attachMultiplFiles();" name="files" type="file"/>
						<div id="filebtn" class="filebtn">Choose file</div>
						<span class="no-file-selected">no file selected</span>
						<span class="no-file-selected up" style='display: none;'>Uploading...</span>
						</label>
			</div>
			</div>
			
			<div class="row">
			<div class="submit span12">
					<input value="Continue" name="emailSubmit" class="btn btn--secondary btn-save" onclick="javascript:submitNamedForm('emailForm');" type="button"/>
					<span id='submittingFormMsg' style='display: none;'><img id='formSubmit_Icon' style='margin-right:3px; margin-left:7px; margin-bottom:7px;' alt='Loading' src='/cvContactUs/images/indicator.gif'> Submitting...</span>
			</div>
			</div>
			<c:forEach var="payloadVal" items="${payloadMap}">
   					<input type="hidden" id="${payloadVal.key}"	 name="${payloadVal.key}" value="${payloadVal.value}"/>
			</c:forEach>
		
		</div>	
		</div>
		</form:form>
		</div>
		
		<c:choose>
				<c:when test="${isEmail}">
					<div id="chatFormContainer" class="span12" style="display: none;" >
				</c:when>
				<c:otherwise>
					<div id="chatFormContainer" class="span12">
				</c:otherwise>
		</c:choose>
		<form:form modelAttribute="uploadForm" id='chatForm' name="chatForm" action="#" enctype="multipart/form-data" method="post" onsubmit="false;">
			<div id="topBar" class="headerPart visible-desktop hidden-phone visible-tablet">
							
							<ul class="span9 padding-0">
							 	<li id="topBarAnswers" name="topBarAnswers"><h2><a href="${ctx['resi_net.answers.list']}">Answers</a></h2></li>
							 	<li id="topBarEmail" name="topBarEmail"><h2><a href="#" onClick="return false;">Email Us</a></h2></th>	
							 	<li id="topBarChat" class="active" name="topBarChat"><h2><a href="#" onclick="return false;">Live Chat</a></h2></li>
							</ul>
							
							<ul class="span3 right">
									<li id="topBarHelp" class="right" name="topBarHelp"><h2><a href="${ctx['resi_net.help.page']}">Help</a></h2></li>
							</ul>
			</div>
			<div class="row">
			<div class="span4">
				<span class="ask_label visible-tablet hidden-mobile visible-desktop" id="indicates_required"><font color="red">*</font> Indicates Required Fields</span>
				
				<div class="messagebox">
					<p class="bold">Important:</p>			
					<p>You can also visit our <a href="${ctx['resi_net.answer.center']}" class="blue">Answer Center</a> for information online regarding frequently asked questions or click <a href="/support/livepage/email" class="blue">here</a> for e-mail support.</p>
					<p>Click the following if you: <a href="${ctx['resi_net.forgot.password']}" class="blue">Forgot Password</a> or <a href="${ctx['resi_net.forgot.optid']}" class="blue">Forgot Optimum ID</a>.</p> 
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
			<div class="span8">
			<div id="rn_PageTitle" class="span12 rn_AskQuestion padding-0">
							<h3 id="rn_Summary">Live chat support
    						<c:if test="${lang == 'es-us'}"> 
    						(sólo en inglés)
    						</c:if>
    						</h3>
			</div>
			
			<h4>Live Chat support is available 24 hours a day, seven days a week.</h4>

			
			<p>Fill out the information below to launch a chat session. A live representative will help you with your request.</p>
         		<span class="ask_label hidden-tablet hidden-desktop" id="indicates_required">
					<font color="red">*</font> Indicates required fields
				</span>
         	
			<div id="messageBox2" name="messageBox2" class="error-messagebox" style="display: none">
				<ul>
				</ul>
			</div>
			<div class="row">
				<div id="custFirstName_div" class="element-input span6" >
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
			
			<div id="custLastName_div" class="element-input span6">
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
			        	</div>
					</div>	
				</c:otherwise>
		</c:choose>
				
		<div class="row">			
			 <div id="CustProd_div" class="element-input span6">
      					<label for="CustProdChat">Chat request type
      						<span class="required-label"> * </span>
              					</label>
        				<select id="CustProdChat" name="CustProdChat"   onChange='javascript:showSubproduct();' style='display: none;'>
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
				<div id="subject_div" class="element-input span6">
  					<label for="subjectChat" class="title">Enter your question
  						<span class="required-label"> * </span>
      				</label>
					<input type="text" id="subjectChat" name="subjectChat" class="large"  />
				</div>
			</div>
				
			 <div class="row">
              	<div id="fromtext" class="span12">
                  	<div class="fromtext">
                          <p>Your internet security is important to us. We want to remind you not to share sensitive data, such as Social Security numbers, credit or debit card information, banking information or other sensitive information via Live Chat. Our Optimum Experts will never ask you to share this type of information via Live Chat.</p>
                      </div>
                  </div>
              </div>	
              
			<div class="row">
			<div class="submit span6">
				
				<input class="btn btn--secondary btn-save" type="button" name="chatSubmit" value="Submit request" onclick="javascript:submitNamedForm('chatForm');">
				<span id='submittingChatFormMsg' style='display: none;'><img id='formSubmit_Icon' style='margin-right:3px; margin-left:7px; margin-bottom:7px;' alt='Loading' src='/cvContactUs/images/indicator.gif'> Submitting...</span>
				
			
				
			</div>
			</div>
					<c:forEach var="payloadVal" items="${payloadMap}">
		   					<input type="hidden" id="${payloadVal.key}"	 name="${payloadVal.key}" value="${payloadVal.value}"/>
					</c:forEach>
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
		var chatHostUrl = '<c:out value="${hostUrl}"/>';
		var rntHostUrl = '<c:out value="${rntUrl}"/>';
		var lang = '<c:out value="${lang}"/>';
		
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
		        	$("#emailAddress").focus();
			}else{
			    	$("#custFirstName").focus();
			       changeEmail=true;
			       changeChat=false;
			}
				window.scrollTo(0, 0);
		}
		$("#signInChat").attr('href', '/login/?referer='+window.location.href.replace('email', 'chat').replace('=','%3D'));
		$("#signInEmail").attr('href', '/login/?referer='+window.location.href.replace('chat', 'email').replace('=','%3D'));
		
		
		
	</script>
		
	
	
	
	
	
		<div>
			<form:form modelAttribute='fileUploadFrom' id='findFileSize' action='/cvContactUs/rest/uploadFileSize' target='uploadiframe' method='POST' enctype='multipart/form-data'/>

			<iframe name='uploadiframe' id='uploadiframe' style="display: none;"></iframe>
			<iframe name='submitiframe' id='submitiframe' style="display: none;"></iframe>
		</div>	
<!-- mp_trans_disable_end -->

