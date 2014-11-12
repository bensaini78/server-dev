<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="/cvContactUs/js/jquery.min.js"></script>
<script type="text/javascript" src="/cvContactUs/js/adminTest.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="adminCVforms" name="forms">
		
			Lang<input id="lang" name="lang" value="en-us"/>
			AppName<input id="appName" name="appName" value="Optnet.resi"/>
			AccessKey<input id="accessKey" name="accessKey" value="Optnet.resi"/>
			Payload<input id="payload" name="payload" value='{"optId":"netdev2"}'/>
			<button id="button" value="submit"/>Submit</button>
		
	</div>
	<script>
	$(window).load(function(){
		hookevent();
	});
	</script>
</body>
</html>