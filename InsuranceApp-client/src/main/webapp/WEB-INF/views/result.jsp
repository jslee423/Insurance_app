<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application Results</title>
<link rel="shortcut icon" href="/images/favicon.png" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="/css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/easy-responsive-tabs.css " />
<link rel="stylesheet" type="text/css" href="/css/flexslider.css " />
<link rel="stylesheet" type="text/css" href="/css/owl.carousel.css">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link href="/css/result.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="clear"></div>
<div id="page-content">
	<div class="container result text-center">
		<h2 class="text-center">Application Success!</h2>
		<h4>Date: ${policy.get('openDate').asText()}</h4>
		<h4>Status: REVIEW ${policy.get('status').asText()}</h4>
		<h4>Payment: $<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${policy.get('price').asDouble()}"/></h4>
		<p>Payment #: ${chargeId}</p>
		<p>Please check your inbox for additional requirements</p>
		
		<div><span>Check latest status in </span ><a href='/profile'>My Profile</a>.</div>
	</div>
</div>
<div class="clear"></div>
<%@ include file="footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-hover-dropdown/2.2.1/bootstrap-hover-dropdown.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script src="/js/jquery.flexslider-min.js"></script>
<script src="/js/easyResponsiveTabs.js"></script>
<script src="/js/owl.carousel.js"></script>
<script src="/js/custom.js"></script>
</body>
</html>