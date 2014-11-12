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

<section class="live">
		<div class="container">
			<div class="row">
    			<div id="formContainers">
		<div id="emailFormContainer" class="span12">
		<form:form modelAttribute="uploadForm" id='emailForm' name="emailForm" action="/cvContactUs/rest/sendEmailWithAttachment" enctype="multipart/form-data" method="post" >
		<div id="topBar" class="headerPart">
		<ul class="span9 padding-0">
			
					<li id="topBarAnswers" name="topBarAnswers" class="left"><h2><a href="http://optimum--tst.custhelp.com/app/answers/list">Answers</a></h2></th>
					<li id="topBarEmail" class="active" name="topBarEmail"><h2><a onClick="return false;" href="https://stage2.optimum.net/support/live?page=email">Email Us</a></h2></th>
					<li id="topBarChat" name="topBarChat"><h2><a onClick="return false;" href="https://stage2.optimum.net/support/live?page=chat">Live Chat</a></h2></th>
		</ul>
			<ul class="span3 right">
					<li id="topBarHelp" class="right" name="topBarHelp"><h2><a href="http://optimum--tst.custhelp.com/app/utils/help_search/session/L3RpbWUvMTQwMDU1MzA4MS9zaWQvVFMydl9IVWw%3D">Help</a></h2></li>
			</ul>
		</div>
		
		<div class="row"> 
	    <div class="span8">
	 	<div id="rn_PageTitle" class="span12 rn_AskQuestion padding-0">
								<h2 id="rn_Summary">Failure Generic</h2><br>
		</div>
				
				<div id="left"><label class="title_bold"><p>The reference number for your question is #${transactionId}</p></label></div>
				<div id="left"><label class="title_bold"><p>You will receive an email response within 30 minutes.</p></label></div>
		</div>
		</div>
	
		<!--
          Failed URL: ${url}
          Exception:  ${exception}
	      Exception Message:  ${exception.message}
          Full StackTrace:
	      <c:forEach items="${exception.stackTrace}" var="ste">    ${ste} 
          </c:forEach>
        -->
		</form:form>
					</div>
				</div>
			</div>
		</div>
</section>
		
		

		