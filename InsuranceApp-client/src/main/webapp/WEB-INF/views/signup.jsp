<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<link rel="shortcut icon" href="images/favicon.png" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
<link rel="stylesheet" type="text/css" href="css/flexslider.css " />
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/signup.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="clear"></div>
<div id="page-content">
	<div class="container signup text-center">
		<h2 class="text-center">Register</h2>
		<form:form action = 'saveNewUser' method='post'>
			<core:if test="${Message != null}">
				<p style="color: red;">${Message}</p>
			</core:if>
			<div class='form-group row'>
				<div class="col-sm-4 col-sm-offset-4">
					<label>Username:</label>
					<input class='form-control' type = 'text' name='username' placeholder="enter username"/>
				</div>
			</div>
			<div class='form-group row'>
				<div class="col-sm-4 col-sm-offset-4">
					<label>Email:</label>
					<input class='form-control' type = 'text' name='email' placeholder="enter email"/>
				</div>
			</div>
			<div class='form-group row'>
				<div class="col-sm-4 col-sm-offset-4">
					<label>Password:</label>
					<input class='form-control' type = 'password' name='password' placeholder="enter password"/>
				</div>
			</div>
			<div><span class='text-muted'>Forgot your password? </span ><a href='#'>Reset Here!</a></div>
			<div><span class='text-muted'>Already have an account? </span ><a href='/login'>Login here!</a></div>
			<div class='text-center'>
				<input class='btn-default' type = 'submit' value='Submit'/>
			</div>
			<sec:csrfInput/>
		</form:form>
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