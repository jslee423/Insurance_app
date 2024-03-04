<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File a claim</title>
<link rel="shortcut icon" href="images/favicon.png" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
<link rel="stylesheet" type="text/css" href="css/flexslider.css " />
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link href="/css/claimForm.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="clear"></div>
<div id="page-content">
	<section class="breadcrumb">
		<div class="container">
			<h2>File a claim</h2>
			<ul>
				<li><a href="/">Home</a> ></li>
				<li><a href="/profile">Profile</a> ></li>
				<li><a href="#">File a claim</a></li>
			</ul>
		</div>
    </section>
	<div class="container claimForm text-center">
		<div class="formDiv">
		<core:if test="${message != null}">
			<p style="color: red;">${message}</p>
		</core:if>
		<core:if test="${successMessage != null}">
			<p style="color: green;">${successMessage}</p>
		</core:if>
		<form:form method="POST" action="/saveClaim" enctype="multipart/form-data">
			<div class="error"></div>
			<input type="number" id='customerId' name='customerId' value="${customer.get('id').asLong()}" hidden />
			<input type='text' onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="Claim date*" id="claimDate" name='claimDate' />
			<select id="policyId" name='policyId'>
				<option value="" disabled="true" selected="true">Select policy*</option>
				<core:forEach items="${policies}" var="policy">
					<option value="${policy.get('id')}" label="${policy.get('plan').get('planName').asText()}" />
				</core:forEach>
			</select>
			<input type='number' id="amount" name='amount' step="0.01" placeholder="Total amount*" />
			<input type='text' id='reason' name='reason' placeholder='Reason for claim*' />
			<textarea rows="1" cols="1" placeholder="Provide all details related to your claim*" id="description" name='description'></textarea>
			<div class='claimDocSec'>
				<label for='claimDoc'>Upload proof of claim:</label>
				<input type="file" id="claimDoc" name="claimDoc" />
			</div>
			<input type='submit' value='file claim' class='btn-default' id="submitClaim" />
		</form:form>
		</div>
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
	/* $("#submitClaim").click(function() {
		const claimDate = $("#claimDate").val()
		const policyId = $("#policy option:selected").val()
		const reason = $("#reason").val()
		const description = $("#description").val()
		const customerId = $("#customerId").val()
		const claimDoc = $("#claimDoc").val().replace(/C:\\fakepath\\/i, '')
		const amount = $("#amount").val()
		console.log($("#claimDoc").prop('files')[0])
		
		$(".error").empty()
		if (claimDate == "") {
			$(".error").append("<p>please enter claimDate</p>")
		} else if (policyId == "") {
			$(".error").append("<p>select policy</p>")
		} else if (reason == "" || description == "") {
			$(".error").append("<p>enter details of your claim</p>")
		} else if ($("#message").val() == "") {
			$(".error").append("<p>please enter message</p>")
		} else {
			const claim = {
				status: "PENDING",
				claimDate: claimDate,
				customerId: customerId,
				policyId: policyId,
				reason: reason,
				description: description,
				claimDoc: customerId+"_claimDoc_"+claimDate+"_"+claimDoc,
				amount: amount
				
			}
			
			$.ajax({
				type: "POST",
				contentType: "application/json",
				url: "/saveClaim",
				data: JSON.stringify(claim),
				dataType: "json",
				success: function(savedClaim) {
					console.log("saved claim", savedClaim)
					$(".error").append("<p style='color: green;'>Claim successfully submitted!</p>")
					
					
				},
				error: function(e) {
					alert("error saving claim")
					$(".error").append("<p>error submitting claim. Please try again.</p>")
				}
			})
			
			console.log(claim)
		}
	}) */
</script>
</body>
</html>