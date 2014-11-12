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
	<meta charset="utf-8" />
	<title>Left Blank for Optimum Websites</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--  link rel="stylesheet" href="${url}/css/formoid-default-skyblue.css" type="text/css" />
	<link rel="stylesheet" href="${url}/css/ask.css" type="text/css" />-->
	<link rel="stylesheet" href="https://www.optimum.net/core-and-parts.css?201406031307">
    <link rel="stylesheet" href="/cvContactUs/css/live.css" type="text/css"/>
	<link media="screen" href="/cvContactUs/css/jquery.msg.css" rel="stylesheet" type="text/css">
</head>

<!--body class="blurBg-false" style="background-color:#FFFFFF"-->
	<script type="text/javascript" src="/cvContactUs/js/jquery.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.formatter.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.center.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.msg.min.js"></script>
	<section class="live">
		<div class="container">
		<div class="row">
    	<div id="formContainers">
		<div id="emailFormContainer" class="span12">
		<form:form modelAttribute="uploadForm" id='emailForm' name="emailForm" action="/cvContactUs/rest/sendEmailWithAttachment" enctype="multipart/form-data" method="post" >
		<div id="topBar" class="headerPart">
		<ul class="span9 padding-0">
			
					<li id="topBarAnswers" name="topBarAnswers" class="left"><h2><a href="http://optimum--tst.custhelp.com/app/answers/list">Answers</a></h2></th>
					<li id="topBarEmail" name="topBarEmail"><h2><a href="#" onClick="return false;" style="color:#9D479D;">Email Us</a></h2></th>
					<li id="topBarChat" name="topBarChat"><h2><a href="#" onClick="return false;">Live Chat</a></h2></th>
		</ul>
			<ul class="span3 right">
					<li id="topBarHelp" class="right" name="topBarHelp"><h2><a href="http://optimum--tst.custhelp.com/app/utils/help_search/session/L3RpbWUvMTQwMDU1MzA4MS9zaWQvVFMydl9IVWw%3D">Help</a></h2></li>
			</ul>
		</div>
	   
	   <div class="row"> 
	    <div class="span8">
	 	<div id="rn_PageTitle" class="span12 rn_AskQuestion padding-0">
							<span class="ask_label" id="indicates_required" style="float:right;padding-top:40px;"><strong><font color="red">*</font> Indicates Required Fields</strong></span>
    						<h2 id="rn_Summary">Ask a Question</h2><br>
		</div>
				
				<div id="left"><label class="title_bold"><p>Email support is available 24 hours a day, seven days a week.</p></label></div>

						
			<div id="messageBox1" name="messageBox1" style="display: none" class="error-messagebox">
				<ul>
				</ul>
			</div>
			</div>
		</div>	
		
		<div class="row">
		
			<div class="element-input span6"  title="Please enter a valid email.">
				<label for="emailAddress" class="title"><br>Email Address<span class="required-label">*</span></label>
				<c:if test="${not empty userData.emailAddress}">
				    <input id="emailAddress" name="emailAddress" class="large" type="email" required="required" value="${userData.emailAddress}"/>
				</c:if>
				<c:if test="${empty userData.emailAddress}">
				    <input id="emailAddress" name="emailAddress" class="large" type="email" required="required"/>
				</c:if>
			</div>
		</div>	
		
		<div class="row">
			<div class="element-input span6" >
				<label for="subject" class="title">Subject<span class="required-label">*</span></label>
				<input id="subject" name="subject" class="large" type="text" required="required"/>
			</div>
		</div>	
			
		<div class="row">	
			<div class="element-input span8"  title="Please enter your detailed query.">
				<label for="body" class="title">Enter Your Question<span class="required-label">*</span></label>
				<textarea id="body" name="body" class="medium" name="question" cols="20" rows="5" required="required"></textarea>
			</div>
		</div>	
		
		<div class="row">
			<div id="product" class="element-input span6" >
				<label for="CustProd" class="title">Product<span class="required-label">*</span></label>
				<div class="medium"><span>
						<select id="CustProd" name="CustProd" required="required" onChange='javascript:showSubproduct();'>
						<option value=''>Please select a product</option>
						<c:forEach var="i" begin="1" end="${fn:length(productList)}">
							<c:forEach var="product" items="${productList}">
								<c:if test="${product.displayOrder == i }">
									<option productId="${product.productId}" value="${product.productCode}">${product.productName}</option>
								</c:if>	
							</c:forEach>
						</c:forEach>
						</select>
						</span>
				</div>
			</div>
			</div>
			
			<div class="row">
			
			<div id="sub-product" class="element-input span6" style="display: none">
					<label for="ServiceSubType" class="title">Sub Product<span class="required-label">*</span></label>
					<div class="medium"><span>
						<select id="ServiceSubType" name="ServiceSubType" required="required">
							</select>
						</span>
					</div>
			</div>
			</div>
			
			<c:choose>
			
				<c:when test="${userData.isAccountFound}">
				</c:when>
				
				<c:otherwise>
					<div class="row">			
					<div class="element-input span6" >
						<label for="PhoneNum" class="title">Phone Number on Your Account<span class="required-label">*</span></label>
						<input id="PhoneNum" class="large" type="text" name="PhoneNum" required="required"/>
					</div>
					</div>
				</c:otherwise>
			</c:choose>
				
			<div class="row">
			<div class="element-input span6">
						<label for="file_input" class="title_attach_doc">Attach Documents</label>
						<label class="medium">
						<input id="file_input" class="file_input" onChange="javascript:attachMultiplFiles();" name="files" type="file" >
						<div class="filebtn">Choose file</div>
						</label>
			</div>
			</div>
			
			<div class="row">
			<div class="submit span12">
					<input value="Continue..." class="btn btn--secondary btn-save" onclick="javascript:submitNamedForm('emailForm');" type="button">
					<!--div class="submit"><input type="button" value="Continue..." onClick=""/-->
					<a id="submit-print" style="white-space: nowrap; padding-left: 15px;" href="javascript:window.print();" title="Print this form"><img align="absbottom" style="margin-right:3px; margin-bottom:7px;" src="${url}/images/Print.png" alt="">Print Copy of Your E-Mail to Us</a>
			</div>
			</div>
			
			</br>
			</br>
		</form:form>
		</div>
		<div id="chatFormContainer" class="span12" style="display: none;" >
		<form:form modelAttribute="uploadForm" id='chatForm' name="chatForm" action="#" enctype="multipart/form-data" method="post">
			<div id="topBar" class="headerPart">
							
							<ul class="span9 padding-0">
							 	<li id="topBarAnswers" name="topBarAnswers"><h2><a href="http://optimum--tst.custhelp.com/app/answers/list">Answers</a></h2></li>
							 	<li id="topBarEmail" name="topBarEmail"><h2><a href="#" onclick="return false;">Email Us</a></h2></li>
							 	<li id="topBarChat" name="topBarChat"><h2><a href="#" onclick="return false;" style="color:#9D479D;">Live Chat</a></h2></li>
							</ul>
							
							<ul class="span3 right">
									<li id="topBarHelp" class="right" name="topBarHelp"><h2><a href="http://optimum--tst.custhelp.com/app/utils/help_search/session/L3RpbWUvMTQwMDU1MzA4MS9zaWQvVFMydl9IVWw%3D">Help</a></h2></li>
							</ul>
			</div>
			
			<div id="rn_PageTitle" class="span12 rn_AskQuestion padding-0">
							<span class="ask_label" id="indicates_required" style="float:right;padding-top:40px;"><strong><font color="red">*</font> Indicates Required Fields</strong></span>
    						<h2 id="rn_Summary">Live Chat Support</h2><br>
			</div>
			
			<div id="left"><label class="title_bold"><p>Live Chat support is available 24 hours a day, seven days a week.</p></label></div>

			<div class="messagebox">
				<p class="bold">IMPORTANT:</p>
				<p>You can also visit our <a href="http://www.optimum.net/Support" class="blue">Answer Center</a> for information online regarding frequently asked questions or click <a href="http://optimum.custhelp.com/app/ask" class="blue">here</a> for e-mail support.</p>
				<p>Click the following if you: <a href="https://idcenter.services.optimum.net/Services/PasswordReset?referer=/chat" class="blue">Forgot Password</a> or <a href="https://idcenter.services.optimum.net/Services/IDRecovery?referer=/chat" class="blue">Forgot Optimum ID</a>.</p> 
			</div>
			
			<br style="clear:both;">
			<p>Fill out the information below to launch a chat session. A live representative will help<br> you with your request.</p>
         
			<div id="messageBox2" name="messageBox2" class="error-messagebox" style="display: none">
				<ul>
				</ul>
			</div>
			<div class="row">
			<div id="custFirstName_div" class="element-input span6" >
				 <label for="custFirstName" class="title">First Name
					        	<span class="required-label"> * </span>
				 </label>
				<c:if test="${not empty userData.firstName}">
				   <input type="text" id="custFirstName" name="custFirstName" class="large" value="${userData.firstName}"  required="required"/>
				</c:if>
				<c:if test="${empty userData.firstName}">
				  <input type="text" id="custFirstName" name="custFirstName" class="large" required="required"/>
				</c:if>
			</div>
			</div>
			
			<div class="row">
			<div id="custLastName_div" class="element-input span6">
				<label for="custLastName" class="title">Last Name
					<span class="required-label"> * </span>
   				</label>
				<c:if test="${not empty userData.lastName}">
				    <input type="text" id="custLastName" name="custLastName" class="large" required="required" value="${userData.lastName}"/>
				</c:if>
				<c:if test="${empty userData.lastName}">
				    <input type="text" id="custLastName" name="custLastName" class="large" required="required"/>
				</c:if>
			</div>
			</div>
			
		<div class="row">	
		<div id="emailAddress_div" class="element-input span6">
				<label for="emailAddress" id="rn_TextInput_14_Label">Email Address
					<span class="required-label"> * </span>
   				</label>
				<c:if test="${not empty userData.emailAddress}">
				    <input type="text" id="emailAddress" name="emailAddress" class="large" required="required" value="${userData.emailAddress}"/>
				</c:if>
				<c:if test="${empty userData.emailAddress}">
				    <input type="text" id="emailAddress" name="emailAddress" class="large" required="required"/>
				</c:if>
			</div>
		</div>	
		
		<c:choose>
			
				<c:when test="${userData.isAccountFound}">
				</c:when>
				
				<c:otherwise>
					<div class="row">
						<div id="PhoneNum_div" class="element-input span6">
			        					<label for="PhoneNum" id="rn_TextInput_17_Label">Phone Number on Your Account
			        						<span class="required-label"> * </span>
			            				</label>
			            				<input id="PhoneNum" class="large" type="text" name="PhoneNum" required="required"/>
			        					<!-- input type="text" id="rn_TextInput_17_phone" name="rn_TextInput_17_phone" class="rn_Text" required="required"/> -->
						</div>
					</div>	
				</c:otherwise>
		</c:choose>
				
		<div class="row">			
			 <div id="CustProd_div" class="element-input span6">
      					<label for="CustProd">Chat Request Type
      						<span class="required-label"> * </span>
              				<span class="rn_ScreenReaderOnly">
      							Please select the type of request you need assistance with, either Account/Billing Inquiry, Internet/Voice Inquiry or TV/Video Inquiry.
      						</span>
      					</label>
        				<select id="CustProd" name="CustProd" required="required" onChange='javascript:showSubproduct();'>
						<option value=''>--</option>
						<c:forEach var="i" begin="1" end="${fn:length(productListChat)}">
							<c:forEach var="product" items="${productListChat}">s
								<c:if test="${product.displayOrder == i }">
									<option productId="${product.productId}" value="${product.productCode}">${product.productName}</option>
								</c:if>	
							</c:forEach>
						</c:forEach>
						</select>
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
						<select id="ServiceSubType" name="ServiceSubType" required="required">
							</select>
						</span>
					</div>
			</div>
			</div>
			
			<div class="row">
				<div id="subject_div" class="element-input span6">
  					<label for="subject" class="title">Enter Your Question
  						<span class="required-label"> * </span>
      				</label>
					<input type="text" id="subject" name="subject" class="large" required="required"/>
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
				<input class="btn btn--secondary btn-save" type="button" name="chatSubmit" value="Submit Request" onclick="javascript:submitNamedForm('chatForm');"/>
			<!--div class="submit"><input type="button" value="Continue..." onClick=""/-->
				
			</div>
			</div>
			
			</br>
			</br>
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
						oldValue = $("li[name=topBarChat] a").css('color');
						newValue = $("li[name=topBarAnswers] a").css('color');
					   $("#emailFormContainer").show(); 
				       $("li[name=topBarEmail] a").css('color', oldValue); 
				       $("li[name=topBarChat] a").css('color', newValue);
				       $("#chatFormContainer").hide();
				       changeEmail=false;
				       changeChat=true;
					}
				}
			  )});
	
			$("li[name=topBarChat]").each(function(){ $(this).click(function(){
			if(changeChat){	
				oldValue = $("li[name=topBarEmail] a").css('color');
				newValue = $("li[name=topBarAnswers] a").css('color');
				$("#chatFormContainer").show(); 
				$("li[name=topBarChat] a").css('color', oldValue); 
				$("li[name=topBarEmail] a").css('color', newValue);
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
				oldValue = $("li[name=topBarEmail] a").css('color');
				newValue = $("li[name=topBarAnswers] a").css('color');
				$("#chatFormContainer").show(); 
				$("li[name=topBarChat] a").css('color', oldValue); 
				$("li[name=topBarEmail] a").css('color', newValue);
				$("#emailFormContainer").hide();
			       changeEmail=true;
			       changeChat=false;
			}
				getFormKvpEmail();
		}, 300);
		var isEmail = '<c:out value="${isEmail}"/>'
		var hostUrl = '<c:out value="${url}"/>';
	</script>
	
		<div>
			<form:form modelAttribute='fileUploadFrom' id='findFileSize' action='/cvContactUs/rest/uploadFileSize' target='uploadiframe' method='POST' enctype='multipart/form-data'/>
			<iframe name='uploadiframe' id='uploadiframe' style="display: none;"></iframe>
		</div>	

<%-- 
</body>
</html>--%>
