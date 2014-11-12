<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--html-->
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="url">${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}</c:set>
<head>
		<link href="/cvContactUs/css/jquery.msg.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/cvContactUs/js/jquery-1.9.0.min.js"></script>
</head>

<section class="live">
		<div class="container">
			<div class="row">
    			<div id="formContainers">
		<div id="emailFormContainer" class="span12">
		<div id="topBar" class="headerPart visible-desktop hidden-phone visible-tablet">
		<ul class="span9 padding-0">
			
					<li id="topBarAnswers" name="topBarAnswers" class="left"><h2><a href="${ctx['resi_net.answers.list']}">Answers</a></h2></th>
					<li id="topBarEmail" class="active" name="topBarEmail"><h2><a onClick="javascript: window.location = this.href;" href="/support/livepage/email">Email Us</a></h2></th>
					<li id="topBarChat" name="topBarChat"><h2><a onclick="javascript: window.location = this.href;"href="/support/livepage/chat">Live Chat</a></h2></th>
		</ul>
			<ul class="span3 right">
					<li id="topBarHelp" class="right" name="topBarHelp"><h2><a href="${ctx['resi_net.help.page']}">Help</a></h2></li>
			</ul>
		</div>
		
		<div class="row"> 
	    <div class="span8">
	 	<div id="rn_PageTitle" class="span12 rn_AskQuestion padding-0">
								<h2 id="rn_Summary">Your Question has been Submitted</h2><br>
		</div>
				
				<div id="left"><label class="title_bold"><p>Thanks for your email.</p></label></div>
				<div id="left"><label class="title_bold"><p>Your questions and comments are important to us.</p></label></div>
				<div id="left"><label class="title_bold"><p>We'll be sure to get back to you within the next 30 minutes.</p></label></div>
				
		</div>
		</div>
	
		
		<script>
		$("li[name=topBarEmail]").each(function(){ $(this).click(function(){
			$("#topBarEmail").find("a").click();
			}
		  )});

		$("li[name=topBarChat]").each(function(){ $(this).click(function(){
			$("#topBarChat").find("a").click();
			}
		 )});
		
		</script>
					</div>
				</div>
			</div>
		</div>
</section>
		
		

		