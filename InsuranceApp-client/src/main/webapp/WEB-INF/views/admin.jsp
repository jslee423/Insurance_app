<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator</title>
<link rel="shortcut icon" href="images/favicon.png" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
<link rel="stylesheet" type="text/css" href="css/flexslider.css " />
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="clear"></div>
<div id="page-content">
	<div class="container admin text-center">
		<h2 class="text-center">Administrator</h2>
		<h4 id="pendingCount"><a href="/admin/policies">Pending Applications: ${pendingPolicies.size()}</a></h4>
		<h4 id="pendingCount"><a href="/admin/claims">Open Claims: ${pendingClaims.size()}</a></h4>
		<section class="services">
	        <div class="container">
	            <div class="row">
		            <a href="/admin/insurances">
		                <div class="col-sm-3 services-dtl">
		                    <span class="fa fa-life-bouy"></span>
		                    <h3>Insurances</h3>
		                    <p>Check current insurance types & plans</p>
		                </div>
		            </a>
	                <div class="col-sm-3 services-dtl">
	                    <span class="ti-pencil disabled"></span>
	                    <h3>Plans</h3>
	                    <p>Update/modify plan details</p>
	                </div>
	                <div class="col-sm-3 services-dtl">
	                    <span class="ti-email disabled"></span>
	                    <h3>Customers</h3>
	                    <p>Manage customer information</p>
	                </div>
	                <a href="/admin/policies">
		                <div class="col-sm-3 services-dtl">
		                    <span class="fa fa-money"></span>
		                    <h3>Policies</h3>
		                    <p>Manage customer policies</p>
		                </div>
	                </a>
	                <a href="/admin/claims">
		                <div class="col-sm-3 services-dtl">
		                    <span class="ti-wallet"></span>
		                    <h3>Claims</h3>
		                    <p>View/manage/update claims</p>
		                </div>
	                </a>
	                <div class="col-sm-3 services-dtl">
	                    <span class="fa fa-laptop disabled"></span>
	                    <h3>Users</h3>
	                    <p>Manage user accounts and settings</p>
	                </div>
	                <div class="col-sm-3 services-dtl">
	                    <!-- <span class="ti-lock"></span> -->
	                    <h3></h3>
	                    <p></p>
	                </div>
	                <div class="col-sm-3 services-dtl">
	                    <!-- <span class="ti-book"></span> -->
	                    <h3></h3>
	                    <p></p>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
</div>
<div class="clear"></div>
<%@ include file="footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-hover-dropdown/2.2.1/bootstrap-hover-dropdown.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script src="js/jquery.flexslider-min.js"></script>
<script src="js/easyResponsiveTabs.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/custom.js"></script>
</body>
</html>