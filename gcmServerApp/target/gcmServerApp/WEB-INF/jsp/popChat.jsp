<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--html-->
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="url">${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}</c:set>

<c:set var="chatAlias">${chatAlias}</c:set>
<c:set var="userId" value="${userId}" />
<c:set var="secureKey" value="${secureKey}" />
<c:set var="scriptPos" value="${scriptPos}" />

<head>
	<title>Optimum Chat!</title>
	<link type="text/css" rel="stylesheet" href="${url}/css/style.css" />
</head>

<div id="wrapper">
    <div id="menu">
        <p class="welcome">Welcome, <b></b></p>
        <p class="logout"><a id="exit" href="#">Exit Chat</a></p>
        <div style="clear:both"></div>
    </div>
     
    <div id="chatbox"></div>
    
    <form name="message" action="#">
    	<textarea name="usermsg" id="usermsg"/></textarea>
        <input name="submitmsg"  type="button"  id="submitmsg" value="Send" />
    </form>
 </div>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="${url}/js/chat.js"></script>
<script type="text/javascript" src="${url}/js/jquery.linkify.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		exitButtonListener();
		submitUserMessages();
		document.onkeydown = checkKeycode;
		chatAlias = '<c:out value="${chatAlias}"/>';
		secureKey = '<c:out value="${secureKey}"/>';
		userId = '<c:out value="${userId}"/>';
		scriptPos = '<c:out value="${scriptPos}"/>';
		hostUrl = '<c:out value="${url}"/>';
		setRefresh(7000);
		heartBeat();
	});
</script>

<%-- 
</body>
</html>--%>
