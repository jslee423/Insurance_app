<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insurance Application</title>
<link rel="shortcut icon" href="images/favicon.png" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
<link rel="stylesheet" type="text/css" href="css/flexslider.css " />
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/apply.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="clear"></div>
<div id="page-content">
	<div class="container apply text-center">
		<nav class="applyTabs">
			<ul>
				<li class="active" id="startedTab">Get Started</li>
				<li class="" id="infoTab">Coverage Information</li>
				<!-- <li class="" id="prefTab">Preferences</li> -->
				<li class="" id="planTab">Plan Selection</li>
			</ul>
		</nav>
		
		<div class="section" id="startedSection">
			<h2>In what zip code do you/your family permanently reside?</h2>
			<input type="text" name="zipCode" id="zipCode" placeholder="Zip Code*" />
			<div class="error errorStart"></div>
			<button class="btn-default" id="startNext">Next</button>
		</div>
		<div class="section" id="infoSection">
			<h2>Who needs coverage?</h2>
			<div class="infoForm">
				<h4>Myself</h4>	
				<input type="text" name="firstName" id="firstName" placeholder="First name*" />
				<input type="text" name="lastName" id="lastName" placeholder="Last name*" />
				<!-- <input type="text" name="age" id="age" placeholder="Age*" /> -->
				<input type="text" onfocus="(this.type='date')" onblur="(this.type='text')" name="dob" id="dob" placeholder="DOB*" />
				<select id="gender">
					<option value="" disabled="true" selected="true">Gender*</option>
					<core:forEach items="${genders}" var="gender">
						<option value="${gender}" label="${gender}" />
					</core:forEach>
				</select>
				<div class="error errorInfo"></div>
			</div>
			<div class="infoForm">
				<h4 style="margin: 0"><i class="fa fa-plus"></i> Add Spouse</h4>	
			</div>
			<div class="infoForm">
				<h4 style="margin: 0"><i class="fa fa-plus"></i> Add Child</h4>	
			</div>
			<button class="btn-default btn-back" id="infoBack">Back</button>
			<button class="btn-default" id="infoNext">Next</button>
		</div>
		<div class="section activeSection" id="planSection">
			<h2>What plan is right for you?</h2>
			<div class='container-fluid'>
				<div class="row">
					<core:forEach items="${plans}" var="plan">
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="planSectionPlans">
								<p hidden="true">${plan.get("id")}</p>
								<core:if test="${plan.get('planName').toString().contains('Gold')}">
		            				<h3><i class="fa fa-heart"></i> ${plan.get("planName").toString().replace('\"','')}</h3>
	            				</core:if>
	            				<core:if test="${plan.get('planName').toString().contains('Silver')}">
		            				<h3><i class="fa fa-heart-o"></i> ${plan.get("planName").toString().replace('\"','')}</h3>
	            				</core:if>
	            				<core:if test="${plan.get('planName').toString().contains('Basic')}">
		            				<h3><i class="ti-heart-broken"></i> ${plan.get("planName").toString().replace('\"','')}</h3>
	            				</core:if>
								<p>${plan.get("description")}</p>
								<h4>Monthly premium: $${plan.get("premium")}</h4>
								<h5>Details:</h5>
								<ul class="planDetails">
									<li>Deductible: $${plan.get("deductible")}</li>
									<li>PCP Visit: $${plan.get("pcpVisitPrice")}</li>
									<li>Specialist visit: $${plan.get("specialistPrice")}</li>
									<li>Prescription: $${plan.get("prescriptionPrice")}</li>
								</ul>
							</div>
						</div>
					</core:forEach>
				</div>
			</div>
			<button class="btn-default btn-back" id="planBack">Back</button>
			<button class="btn-default" id="planNext">Next</button>
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
<script src="js/jquery.flexslider-min.js"></script>
<script src="js/easyResponsiveTabs.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/custom.js"></script>
<script>
	$(document).ready(function() {
		$("#startNext").click(function() {
			const zipCode = $("#zipCode").val()
			$(".error").empty()
			if (zipCode == "") {
				$(".errorStart").append("<p>please enter zip code</p>")
			} else if (!/^\d+$/.test(zipCode) || zipCode.length < 5) {
				$(".errorStart").append("<p>enter correct zip code</p>")
			} else {
				$(".apply nav #infoTab").addClass('active')
		    		$(".apply nav #infoTab").siblings().removeClass('active')
				$(".apply nav #startedTab").prepend('<i class="fa fa-check-circle"></i> ')
		    		$(this).parent().removeClass("activeSection")
				$("#infoSection").addClass("activeSection")
			}
		})
		
		$("#infoNext").click(function() {
			const dob = $("#dob").val()
			const gender = $("#gender option:selected").val()
			const firstName = $("#firstName").val()
			const lastName = $("#lastName").val()
			$(".error").empty()
			if (firstName == "") {
				console.log("error name")
				$(".errorInfo").append("<p>please enter first name</p>")
			} else if (lastName == "") {
				$(".errorInfo").append("<p>please enter last name</p>")
			} else if (dob == "") {
				$(".errorInfo").append("<p>please enter dob</p>")
			} else if (gender == "") {
				$(".errorInfo").append("<p>select gender</p>")
			} else {
				$(this).parent().removeClass("activeSection")
				
				$(".apply nav #planTab").addClass('active')
	    			$(".apply nav #planTab").siblings().removeClass('active')
				$(".apply nav #infoTab").prepend('<i class="fa fa-check-circle"></i> ')
				$(this).parent().removeClass("activeSection")
				$("#planSection").addClass("activeSection")
			}
		})
		
		$("#infoBack").click(function() {
			$(this).parent().removeClass("activeSection")
			$("#startedSection").addClass("activeSection")
			$("#startedTab").empty()
			$("#startedTab").append("Get Started")

	    	$(".apply nav #startedTab").addClass('active')
	    	$(".apply nav #startedTab").siblings().removeClass('active')
		})
		
		$("#planBack").click(function() {
			$(this).parent().removeClass("activeSection")
			$("#infoSection").addClass("activeSection")
			$("#infoTab").empty()
			$("#infoTab").append("Coverage Information")

	    	$(".apply nav #infoTab").addClass('active')
	    	$(".apply nav #infoTab").siblings().removeClass('active')
		})
		
		$(".planSectionPlans").click(function() {
			$(this).addClass("active")
			$(this).parent().siblings().children(".planSectionPlans").removeClass("active")
		})
	})
</script>
</body>
</html>