<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel="shortcut icon" href="images/favicon.png" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
<link rel="stylesheet" type="text/css" href="css/flexslider.css " />
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link href="/css/profile.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="clear"></div>
<div id="page-content">
	<section class="breadcrumb">
		<div class="container">
			<h2>My Profile</h2>
			<ul>
				<li><a href="/">Home</a> ></li>
				<li><a href="#">Profile</a></li>
			</ul>
		</div>
    </section>
	<div class="container profile text-center">
		<!-- <h2 class="text-center">My Profile</h2> -->
		<core:if test="${customer != null}">
			<h3>My Info:</h3>
			<div class='customerInfo'>
				<p>Customer id: ${customer.get('id').asLong()}</p>
				<p>Email: ${customer.get('email').asText()}</p>
				<h5>Address:</h5>
				<p>${customer.get('firstName').asText()} ${customer.get('lastName').asText()}</p>
				<p>${customer.get('address').get('addressLine1').asText()}</p>
				<p>${customer.get('address').get('city').asText()}, ${customer.get('address').get('state').asText()}</p>
				<p>${customer.get('address').get('zipCode').asText()}</p>
				<h5>Uploaded documents:</h5>
				<div class="uploadedDocs">
					<core:if test="${customer.get('addressDoc').asText().contains('null') && customer.get('addressDoc').asText().contains('null')}">
						<p>You have not uploaded any documents.</p>
					</core:if>
					<core:if test="${!customer.get('addressDoc').asText().contains('null')}">
						<a href="/documents/${customer.get('addressDoc').asText()}" target="_blank"><img src="/documents/${customer.get('addressDoc').asText()}" class="thumbnail" /></a>
					</core:if>
					<core:if test="${!customer.get('govIdDoc').asText().contains('null')}">
						<a href="/documents/${customer.get('govIdDoc').asText()}" target="_blank"><img src="/documents/${customer.get('govIdDoc').asText()}" class="thumbnail" /></a>
					</core:if>
				</div>
			</div>
		</core:if>
		
		<h3>To Do:</h3>
		<core:if test="${customer == null}">
			<p>You have no pending requirements.</p>
		</core:if>
		<core:if test="${message != null}">
			<p style="color: red;">${message}</p>
		</core:if>
		<core:if test="${successMessage != null}">
			<p style="color: green;">${successMessage}</p>
		</core:if>
		<core:if test="${customer != null}">
			<core:if test="${customer.get('addressDoc').asText() != 'null' && customer.get('govIdDoc').asText() != 'null'}">
				<p>You have no pending requirements.</p>
			</core:if>
			<core:if test="${customer.get('addressDoc').asText() == 'null' || customer.get('govIdDoc').asText() == 'null'}">
				<form:form method="POST" action="/upload" enctype="multipart/form-data">
					<ol>
						<core:if test="${customer.get('addressDoc').asText() == 'null'}">
							<li>Upload proof of address <input type="file" id="addressDoc" name="addressDoc" /></li>
						</core:if>
						<core:if test="${customer.get('govIdDoc').asText() == 'null'}">
							<li>Upload driver's license/government id <input type="file" id="govIdDoc" name="govIdDoc" /></li>
						</core:if>
					</ol>
					<input class="btn-default" type="submit" value="Upload files" />
				</form:form>
			</core:if>
		</core:if>
		
		<h3>My Claims:</h3>
		<core:if test="${claims.isEmpty()}">
			<p>You currently have no open claims.</p>
		</core:if>
		<core:if test="${!claims.isEmpty()}">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Claim #</th>
						<th>Policy #</th>
						<th>Claim date</th>
						<th>Open date</th>
						<th>Amount</th>
						<th>Reason</th>
						<th>Description</th>
						<th>Uploaded Doc</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<core:forEach items="${claims}" var="claim">
						<tr>
							<td>${claim.get('id').asLong()}</td>
							<td>${claim.get('policyId').asLong()}</td>
							<td>${claim.get('claimDate').asText()}</td>
							<td>${claim.get('openDate').asText()}</td>
							<td>${claim.get('amount').asDouble()}</td>
							<td>${claim.get('reason').asText()}</td>
							<td>${claim.get('description').asText()}</td>
							<td><a href="/documents/${claim.get('claimDoc').asText()}" target="_blank"><button class='viewBtn'>view doc</button></a></td>
							<td>${claim.get('status').asText()}</td>
						</tr>
					</core:forEach>
				</tbody>
			</table>
		</core:if>
		<core:if test="${!approvedPolicies.isEmpty() && customer != null}">
			<a href="/newClaim"><button class='btn-default' id="fileClaim">File a claim</button></a>
		</core:if>
		<core:if test="${approvedPolicies.isEmpty() || customer == null}">
			<a href="/newClaim"><button class='btn-default btn-disabled' id="fileClaimDisabled" disabled>File a claim</button></a>
			<p style="color: red;">You must have an approved and active policy to file a claim.</p>
		</core:if>
		
		<h3>My Policies:</h3>
		<core:if test="${policies == null}">
			<p>You currently have no policies. Check out our available <a href="/health">plans</a>.</p>
		</core:if>
		<core:if test="${policies != null}">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Policy #</th>
						<th>Plan</th>
						<th>Premium</th>
						<th>Open date</th>
						<th>End date</th>
						<th>Status</th>
					</tr>
				</thead>
				<core:forEach items="${policies}" var="policy">
					<tr>
						<td>${policy.get('id').asLong()}</td>
						<td>${policy.get('plan').get('planName').asText()}</td>
						<td>$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${policy.get('price').asDouble()}"/></td>
						<td>${policy.get('openDate').asText()}</td>
						<td>${policy.get('endDate').asText()}</td>
						<td>${policy.get('status').asText()}</td>
					</tr>
				</core:forEach>
			</table>
		</core:if>
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
<script>
	$("#fileClaim").click(function() {
		
	})
</script>
</body>
</html>