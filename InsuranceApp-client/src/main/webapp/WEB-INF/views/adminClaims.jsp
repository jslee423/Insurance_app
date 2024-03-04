<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Claims - Administrator</title>
<link rel="shortcut icon" href="/images/favicon.png" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="/css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/easy-responsive-tabs.css " />
<link rel="stylesheet" type="text/css" href="/css/flexslider.css " />
<link rel="stylesheet" type="text/css" href="/css/owl.carousel.css">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link href="/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="clear"></div>
<div id="page-content">
	<section class="breadcrumb">
		<div class="container">
			<h2>Claims</h2>
			<ul>
				<li><a href="/">Home</a> ></li>
				<li><a href="/admin">Admin</a> ></li>
				<li><a href="#">Claims</a></li>
			</ul>
		</div>
    </section>
	<div class="container admin text-center">
		<h3>Open Claims:</h3>
		<core:if test="${pendingClaims.isEmpty()}">
			<p>There are currently no open claims.</p>
		</core:if>
		<core:if test="${!pendingClaims.isEmpty()}">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Claim #</th>
						<th>Policy #</th>
						<th>Claim date</th>
						<th>Open date</th>
						<th>Reason</th>
						<th>Description</th>
						<th>Proof</th>
						<th>Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<core:forEach items="${pendingClaims}" var="claim">
						<tr>
							<td>${claim.get('id').asLong()}</td>
							<td>${claim.get('policyId').asLong()}</td>
							<td>${claim.get('claimDate').asText()}</td>
							<td>${claim.get('openDate').asText()}</td>
							<td>${claim.get('reason').asText()}</td>
							<td>${claim.get('description').asText()}</td>
							<td><a href="/documents/${claim.get('claimDoc').asText()}" target="_blank"><button class='viewBtn'>view doc</button></a></td>
							<td>${claim.get('status').asText()}</td>
							<core:if test="${claim.get('status').asText() == 'PENDING'}">
								<td>
									<button class='approveBtn' data-claimid="${claim.get('id').asLong()}">Approve</button>
									<button class='denyBtn' data-claimid="${claim.get('id').asLong()}">Deny</button>
								</td>
							</core:if>
						</tr>
					</core:forEach>
				</tbody>
			</table>
		</core:if>
		
		<h3>Closed Claims:</h3>
		<core:if test="${closedClaims.isEmpty()}">
			<p>There are currently no closed claims.</p>
		</core:if>
		<core:if test="${!closedClaims.isEmpty()}">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Claim #</th>
						<th>Policy #</th>
						<th>Claim date</th>
						<th>Open date</th>
						<th>Reason</th>
						<th>Description</th>
						<th>Uploaded Doc</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<core:forEach items="${closedClaims}" var="claim">
						<tr>
							<td>${claim.get('id').asLong()}</td>
							<td>${claim.get('policyId').asLong()}</td>
							<td>${claim.get('claimDate').asText()}</td>
							<td>${claim.get('openDate').asText()}</td>
							<td>${claim.get('reason').asText()}</td>
							<td>${claim.get('description').asText()}</td>
							<td><a href="/documents/${claim.get('claimDoc').asText()}" target="_blank"><button class='viewBtn'>view doc</button></a></td>
							<td>${claim.get('status').asText()}</td>
						</tr>
					</core:forEach>
				</tbody>
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
<script src="/js/jquery.flexslider-min.js"></script>
<script src="/js/easyResponsiveTabs.js"></script>
<script src="/js/owl.carousel.js"></script>
<script src="/js/custom.js"></script>
<script>
	$(".approveBtn").click(function() {
		const claimId = $(this).attr("data-claimid")
		$.get("/updateClaimStatus/"+claimId+"/"+"APPROVED", function(response) {
			alert('claim approved')
			location.reload()
		})
	})
	
	$(".denyBtn").click(function() {
		const claimId = $(this).attr("data-claimid")
		$.get("/updateClaimStatus/"+claimId+"/"+"DENIED", function(response) {
			alert('claim denied')
			location.reload()
		})
	})
</script>
</body>
</html>