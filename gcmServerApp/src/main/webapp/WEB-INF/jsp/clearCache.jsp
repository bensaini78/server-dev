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
	<title>Clear Cache</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--  link rel="stylesheet" href="${url}/css/formoid-default-skyblue.css" type="text/css" />
	<link rel="stylesheet" href="${url}/css/ask.css" type="text/css" />-->
	<link rel="stylesheet" href="https://www.optimum.net/core-and-parts.css?201406031307">
    <link rel="stylesheet" href="/cvContactUs/css/live.css" type="text/css"/>
	<link media="screen" href="/cvContactUs/css/jquery.msg.css" rel="stylesheet" type="text/css">
</head>

<!--body class="blurBg-false" style="background-color:#FFFFFF"-->
	<script type="text/javascript" src="/cvContactUs//js/jquery.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.formatter.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.center.min.js"></script>
	<script type="text/javascript" src="/cvContactUs/js/jquery.msg.min.js"></script>
	<section class="live">
		<div class="container">
		<div class="row">
    	<div id="formContainers">
		<div id="emailFormContainer" class="span12">
		<form:form modelAttribute="uploadForm" id='clearCacheForm' name="clearCacheForm" action="/cvContactUs/rest/cache/clearCache" method="post" >
						
		<div id="left"><label class="title_bold"><p>Select the cache you wish to clear:</p></label></div>

		
		<div class="row">
			<div id="product" class="element-input span6" >
				<label for="CustProd" class="title">Cache Keys:<span class="required-label">*</span></label>
				<div class="medium">
				<span>
						<select id="cacheKeys" name="cacheKeys" required="required" multiple="multiple">
						<option value="getProductByProductId">getProductByProductId</option>
						<option value="findProductsByTreeCode">findProductsByTreeCode</option>
						<option value="findSubproductsByProductID">findSubproductsByProductID</option>
						</select>
						</span>
				</div>
			</div>
			</div>
			<!-- 
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
			 -->
			
			
			<div class="row">
			<div class="submit span12">
					<input value="Continue..." class="btn btn--secondary btn-save" onclick="javascript:submitNamedForm('emailForm');" type="submit">
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
	
	
	

<%-- 
</body>
</html>--%>
