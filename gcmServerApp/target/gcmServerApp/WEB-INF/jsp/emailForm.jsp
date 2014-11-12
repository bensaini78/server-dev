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
	<link rel="stylesheet" href="${url}/css/formoid-default-skyblue.css" type="text/css" />
	<link rel="stylesheet" href="${url}/css/ask.css" type="text/css" />
	<link media="screen" href="${url}/css/jquery.msg.css" rel="stylesheet" type="text/css">
</head>

<!--body class="blurBg-false" style="background-color:#FFFFFF"-->
	<script type="text/javascript" src="${url}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${url}/js/jquery.formatter.min.js"></script>
	<script type="text/javascript" src="${url}/js/jquery.center.min.js"></script>
	<script type="text/javascript" src="${url}/js/jquery.msg.min.js"></script>
     <div id="formContainers">
		<div id="emailFormContainer">
		<form:form modelAttribute="uploadForm" id='emailForm' name="emailForm" action="${url}/rest/sendEmailWithAttachment" enctype="multipart/form-data" method="post" class="formoid-default-skyblue" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;max-width:560px;min-width:150px" >
		<table id="topBar">
			<thead>
				<tr>
					<th id="topBarAnswers" name="topBarAnswers" class="left"><h2><a href="http://optimum--tst.custhelp.com/app/answers/list">Answers</h2></th>
					<th id="topBarEmail" name="topBarEmail"><h2><a href="#" onClick="return false;" style="color:#9D479D;">Email Us</h2></th>
					<th id="topBarChat" name="topBarChat"><h2><a href="#" onClick="return false;">Live Chat</h2></th>
					<th id="topBarHelp" name="topBarHelp"  class="right"><h2><a href="http://optimum--tst.custhelp.com/app/utils/help_search/session/L3RpbWUvMTQwMDU1MzA4MS9zaWQvVFMydl9IVWw%3D">Help</h2></th>
				</tr>
			</thead>
		</table>
		
		<div class="title-askQuestion"><h2>Ask a Question </h2></div>
			
			<div id="indicates_required" class="indicates_required"><span class="required">*</span>Indicate Required Fields</br></div>
				<div id="container">
				<div id="left"><label class="title_bold"><P>Email support is available 24 hours a day, seven days a week.</P></label></div>
				<!--div id="right"><label><a href="http://www.google.com">Sign In</a> so we know who you are!</label></div-->
			</div>
			</br>
			<div id="messageBox1" name="messageBox1" class="large" style="display: none">
				<ul>
				</ul>
			</div>
			<div class="element-input"  title="Please enter a valid email.">
				<label class="title"><br>Email Address<span class="required">*</span></label>
				<c:if test="${not empty userData.emailAddress}">
				    <input name="emailAddress" class="large" type="email" required="required" value="${userData.emailAddress}"/>
				</c:if>
				<c:if test="${empty userData.emailAddress}">
				    <input name="emailAddress" class="large" type="email" required="required"/>
				</c:if>
			</div>
			
			<div class="element-input" >
				<label class="title">Subject<span class="required">*</span></label>
				<input name="subject" class="large" type="text" required="required"/>
			</div>
			
			<div class="element-textarea"  title="Please enter your detailed query.">
				<label class="title">Enter Your Question<span class="required">*</span></label>
				<textarea name="body" class="medium" name="question" cols="20" rows="5" required="required"></textarea>
			</div>
			
			<div id="product" class="element-select" >
				<label class="title">Product<span class="required">*</span></label>
				<div class="medium"><span>
						<select name="CustProd" required="required" onChange='javascript:showSubproduct();'>
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
			
			<div id="sub-product" class="element-select" style="display: none">
					<label class="title">Sub Product<span class="required">*</span></label>
					<div class="medium"><span>
						<select name="ServiceSubType" required="required">
							</select>
						</span>
					</div>
			</div>
			
			<div class="element-input" >
				<label class="title">Phone Number on Your Account<span class="required">*</span></label>
				<input id="PhoneNum" class="large" type="text" name="PhoneNum" required="required"/>
			</div>
			
			<div class="element-file" ><label class="title_attach_doc">Attach Documents</label><label class="medium" >
				<div class="button">Choose File</div><input type="file" class="file_input" name="files" />
				<div class="file_text">No file chosen</div></label>
			</div>

			<div class="submit"><input type="button" value="Continue..." onClick="javascript:submitNamedForm('emailForm');"/>
			<!--div class="submit"><input type="button" value="Continue..." onClick=""/-->
				<a id="submit-print" style="white-space: nowrap; padding-left: 15px;" href="javascript:window.print();" title="Print this form"><img align="absbottom" style="margin-right:3px; margin-bottom:7px;" src="${url}/images/Print.png" alt="">Print Copy of Your E-Mail to Us</a>
			</div>
			
			</br>
			</br>
		</form:form>
		</div>
		<div id="chatFormContainer" style="display: none;">
		<form:form modelAttribute="uploadForm" id='chatForm' name="chatForm" action="${url}/rest/email/sendChatInitiationReq" enctype="multipart/form-data" method="post" class="formoid-default-skyblue" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;max-width:560px;min-width:150px" >
		<table id="topBar">
			<thead>
				<tr>
					<th id="topBarAnswers" name="topBarAnswers" class="left"><h2><a href="http://optimum--tst.custhelp.com/app/answers/list">Answers</h2></th>
					<th id="topBarEmail" name="topBarEmail"><h2><a href="#" onClick="return false;" style="color:#9D479D;">Email Us</h2></th>
					<th id="topBarChat" name="topBarChat"><h2><a href="#" onClick="return false;">Live Chat</h2></th>
					<th id="topBarHelp" name="topBarHelp"  class="right"><h2><a href="http://optimum--tst.custhelp.com/app/utils/help_search/session/L3RpbWUvMTQwMDU1MzA4MS9zaWQvVFMydl9IVWw%3D">Help</h2></th>
				</tr>
			</thead>
		</table>
		
		<div class="title-askQuestion"><h2>Live Chat Support </h2></div>
			
			<div id="indicates_required" class="indicates_required"><span class="required">*</span>Indicate Required Fields</br></div>
				<div id="container">
				<div id="left"><label class="title_bold"><P>Live Chat support is available 24 hours a day, seven days a week.</P></label></div>
				<%--div id="right"><label><a href="http://www.google.com">Sign In</a> so we know who you are!</label></div--%>
			</div>
			
			<div style="background-color:#F4F4F4; border:1px solid #D5D5D5; margin:40px auto; padding:8px; float:left;">
				<p class="bold">IMPORTANT:</p>
				<p>You can also visit our <a href="http://www.optimum.net/Support" class="blue">Answer Center</a> for information online regarding frequently asked questions or click <a href="http://optimum.custhelp.com/app/ask/session/L3RpbWUvMTM5NzQ5MDUwOC9zaWQvZFUzazROUmw%3D" class="blue">here</a> for e-mail support.</p>
				<p>Click the following if you: <a href="https://idcenter.services.optimum.net/Services/PasswordReset?referer=/chat" class="blue">Forgot Password</a> or <a href="https://idcenter.services.optimum.net/Services/IDRecovery?referer=/chat" class="blue">Forgot Optimum ID</a>.</p> 
			</div>
			
			<p>Fill out the information below to launch a chat session. A live representative will help<br> you with your request.</p>
			
			<div id="messageBox1" name="messageBox1" class="large" style="display: none">
				<ul>
				</ul>
			</div>
			
			<div class="element-input" >
				<label class="title">First Name<span class="required">*</span></label>
				<c:if test="${not empty userData.firstName}">
				    <input name="custFirstName" class="large" type="text" required="required" value="${userData.firstName}"/>
				</c:if>
				<c:if test="${empty userData.firstName}">
				    <input name="custFirstName" class="large" type="text" required="required"/>
				</c:if>
			</div>
			
			<div class="element-input" >
				<label class="title">Last Name<span class="required">*</span></label>
				<c:if test="${not empty userData.lastName}">
				    <input name="custLastName" class="large" type="text" required="required" value="${userData.lastName}"/>
				</c:if>
				<c:if test="${empty userData.lastName}">
				    <input name="custLastName" class="large" type="text" required="required"/>
				</c:if>
			</div>
			
			
			<div class="element-input" >
				<label class="title">Email Address<span class="required">*</span></label>
				<c:if test="${not empty userData.emailAddress}">
				    <input name="emailAddress" class="large" type="email" required="required" value="${userData.emailAddress}"/>
				</c:if>
				<c:if test="${empty userData.emailAddress}">
				    <input name="emailAddress" class="large" type="email" required="required"/>
				</c:if>
			</div>
			
			<div class="element-input" >
				<label class="title">Phone Number on Your Account<span class="required">*</span></label>
				<input id="PhoneNum" class="large" type="text" name="PhoneNum" required="required"/>
			</div>
			
						
			<div id="product" class="element-select" >
				<label class="title">Chat Request Type<span class="required">*</span></label>
				<div class="medium"><span>
						<select name="CustProd" required="required" onChange='javascript:showSubproduct();'>
						<option value=''>--</option>
						<c:forEach var="i" begin="1" end="${fn:length(productListChat)}">
							<c:forEach var="product" items="${productListChat}">s
								<c:if test="${product.displayOrder == i }">
									<option productId="${product.productId}" value="${product.productCode}">${product.productName}</option>
								</c:if>	
							</c:forEach>
						</c:forEach>
						</select>
						</span>
				</div>
			</div>
			
			<div id="sub-product" class="element-select" style="display: none">
					<label class="title">Sub Product<span class="required">*</span></label>
					<div class="medium"><span>
						<select name="ServiceSubType" required="required">
							</select>
						</span>
					</div>
			</div>
			
			<div class="element-input" >
				<label class="title">Enter Your Question<span class="required">*</span></label>
				<input name="subject" class="large" type="text" required="required"/>
			</div>
				

			<div class="submit"><input type="button" name="chatSubmit" value="Continue..." onClick="javascript:chatFormSubmit(event);"/>
			<!--div class="submit"><input type="button" value="Continue..." onClick=""/-->
				<a id="submit-print" style="white-space: nowrap; padding-left: 15px;" href="javascript:window.print();" title="Print this form"><img align="absbottom" style="margin-right:3px; margin-bottom:7px;" src="${url}/images/Print.png" alt="">Print Copy of Your E-Mail to Us</a>
			</div>
			
			</br>
			</br>
		</form:form>
		</div>
	 </div>
	<script type="text/javascript" src="${url}/js/formoid-default-skyblue.js"></script>
	<script type="text/javascript" src="${url}/js/email.js"></script>
	<script type="text/javascript" src="${url}/js/jquery.browser.min.js"></script>
	<script type="text/javascript" src="${url}/js/commonCV_Forms.js"></script>
	
	<script type="text/javascript">
		changeEmail = true;
		changeChat = true;
		setTimeout(function(){
			console.log("Reached 22");
			$("th[name=topBarEmail]").each(function(){ $(this).click(function(){
				if(changeEmail){
						oldValue = $("th[name=topBarChat] a").css('color');
						newValue = $("th[name=topBarAnswers] a").css('color');
					   $("#emailFormContainer").show(); 
				       $("th[name=topBarEmail] a").css('color', oldValue); 
				       $("th[name=topBarChat] a").css('color', newValue);
				       $("#chatFormContainer").hide();
				       changeEmail=false;
				       changeChat=true;
					}
				}
			  )});

			$("th[name=topBarChat]").each(function(){ $(this).click(function(){
			if(changeChat){	
				oldValue = $("th[name=topBarEmail] a").css('color');
				newValue = $("th[name=topBarAnswers] a").css('color');
				$("#chatFormContainer").show(); 
				$("th[name=topBarChat] a").css('color', oldValue); 
				$("th[name=topBarEmail] a").css('color', newValue);
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
				oldValue = $("th[name=topBarEmail] a").css('color');
				newValue = $("th[name=topBarAnswers] a").css('color');
				$("#chatFormContainer").show(); 
				$("th[name=topBarChat] a").css('color', oldValue); 
				$("th[name=topBarEmail] a").css('color', newValue);
				$("#emailFormContainer").hide();
			       changeEmail=true;
			       changeChat=false;
			}
				getFormKvpEmail();
		}, 300);
		var isEmail = '<c:out value="${isEmail}"/>'
		var hostUrl = '<c:out value="${url}"/>';
	</script>
	

<%-- 
</body>
</html>--%>
