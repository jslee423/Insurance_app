<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Policies - Administrator</title>
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
			<h2>Policies</h2>
			<ul>
				<li><a href="/">Home</a> ></li>
				<li><a href="/admin">Admin</a> ></li>
				<li><a href="#">Policies</a></li>
			</ul>
		</div>
    </section>
	<div class="container admin text-center">
		<!-- <h2 class="text-center">Policies</h2> -->
		<h3>Pending approval:</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Policy #</th>
					<th>Customer</th>
					<th>Plan</th>
					<th>Open Date</th>
					<th>End Date</th>
					<th>Uploaded Documents</th>
					<th>Status</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<core:forEach items="${policies}" var="policy">
					<core:if test="${policy.get('status').asText() == 'PENDING'}">
						<tr>
							<td>${policy.get('id').asLong()}</td>
							<td>${policy.get('customer').get('firstName').asText()} ${policy.get('customer').get('lastName').asText()}</td>
							<td>${policy.get('plan').get('planName').asText()}</td>
							<td>${policy.get('openDate').asText()}</td>
							<td>${policy.get('endDate').asText()}</td>
							<td class="customerDocs">
								<a href="/documents/${policy.get('customer').get('addressDoc').asText()}" target="_blank"><button class='viewBtn'>view address doc</button></a>
								<a href="/documents/${policy.get('customer').get('govIdDoc').asText()}" target="_blank"><button class='viewBtn'>view gov id doc</button></a>
							</td>
							<td>${policy.get('status').asText()}</td>
							<td>
								<button class='approveBtn' data-policyid="${policy.get('id').asLong()}">Approve</button>
								<button class='denyBtn' data-policyid="${policy.get('id').asLong()}">Deny</button>
							</td>
						</tr>
					</core:if>
				</core:forEach>
			</tbody>
		</table>
		<h3>All policies:</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Policy #</th>
					<th>Customer</th>
					<th>Plan</th>
					<th>Open Date</th>
					<th>End Date</th>
					<th>Uploaded Documents</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<core:forEach items="${policies}" var="policy">
					<core:if test="${policy.get('status').asText() != 'PENDING'}">
						<tr>
							<td>${policy.get('id').asLong()}</td>
							<td>${policy.get('customer').get('firstName').asText()} ${policy.get('customer').get('lastName').asText()}</td>
							<td>${policy.get('plan').get('planName').asText()}</td>
							<td>${policy.get('openDate').asText()}</td>
							<td>${policy.get('endDate').asText()}</td>
							<td class="customerDocs">
								<a href="/documents/${policy.get('customer').get('addressDoc').asText()}" target="_blank"><button class='viewBtn'>view address doc</button></a>
								<a href="/documents/${policy.get('customer').get('govIdDoc').asText()}" target="_blank"><button class='viewBtn'>view gov id doc</button></a>
							</td>
							<td>${policy.get('status').asText()}</td>
						</tr>
					</core:if>
				</core:forEach>
			</tbody>
		</table>
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
		const policyId = $(this).attr("data-policyid")
		$.get("/approvePolicy/"+policyId, function(response) {
			alert('approved policy')
			location.reload()
		})
	})
	
	$(".denyBtn").click(function() {
		const policyId = $(this).attr("data-policyid")
		$.get("/denyPolicy/"+policyId, function(response) {
			alert('denied policy')
			location.reload()
		})
	})
</script>
</body>
</html>