<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<header>
    <div class="top-bar">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 address">
                    <i class="ti-location-pin"></i> 1234 W Broad St #123 Philadelphia, PA 19019
                </div>
                <div class="col-sm-6 social">
                    <ul>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                        <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="/">Insurance<span>Press</span></a>
                <p>Call Us Now <b>+1 (555) 555-5555</b></p>
            </div>
            <div class="collapse navbar-collapse navbar-main-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/">Home</a></li>
                    <li><a href="/health">Plans</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="/chatGPT">ChatGPT</a></li>
                    <sec:authorize access="hasAuthority('ADMIN') || hasAuthority('DBA')">
                    	<li><a href="/admin">Admin</a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAuthority('USER')">
                    	<li><a href="/profile">My Profile</a></li>
                    </sec:authorize>
                    <li>
                    	<sec:authorize access="isAuthenticated()">
                    		<a href="/login?logout" id="logout">Log out <i class="ti-arrow-right"></i></a>
                    	</sec:authorize>
                    	<sec:authorize access="!isAuthenticated()">
	                        <a href="/login" class="btn-default">Log in/Register</a>
                    	</sec:authorize>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</body>
</html>