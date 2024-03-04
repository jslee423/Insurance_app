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
<link href="css/checkout.css" rel="stylesheet" type="text/css">
<script src="https://js.stripe.com/v3/"></script>
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
				<li class="" id="detailTab">Checkout</li>
			</ul>
		</nav>
		
		<div class="section activeSection" id="startedSection">
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
				<input type="text" name="phoneNumberMyself" id="phoneNumberMyself" placeholder="123-456-7890*" />
				<h5>Address:</h5>
				<input type="text" id="addressLine1" placeholder="Address line 1*" />
				<input type="text" id="addressLine2" placeholder="Address line 2*" />
				<input type="text" id="city" placeholder="City*" />
				<input type="text" id="state" placeholder="State*" />
				<input type="text" id="country" placeholder="Country*" />
				<input type="text" id="addressZipCode" placeholder="Zip code*" />
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
		<div class="section " id="planSection">
			<h2>What plan is right for you?</h2>
			<div class='container-fluid'>
				<div class="row">
					<core:forEach items="${plans}" var="plan">
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="planSectionPlans">
								<p hidden="true" class="planId">${plan.get("id")}</p>
								<p hidden="true" class="planName">${plan.get("planName").asText()}</p>
								<input type="number" step="0.01" class="planAmount" value="${plan.get('premium').asDouble()}" hidden="true" />
								<core:if test="${plan.get('planName').toString().contains('Gold')}">
		            				<h3><i class="fa fa-heart"></i> ${plan.get("planName").asText()}</h3>
	            				</core:if>
	            				<core:if test="${plan.get('planName').toString().contains('Silver')}">
		            				<h3><i class="fa fa-heart-o"></i> ${plan.get("planName").asText()}</h3>
	            				</core:if>
	            				<core:if test="${plan.get('planName').toString().contains('Basic')}">
		            				<h3><i class="ti-heart-broken"></i> ${plan.get("planName").asText()}</h3>
	            				</core:if>
								<p>${plan.get("description")}</p>
								<h4>Monthly premium: $<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${plan.get('premium').asDouble()}"/></h4>
								<h5>Details:</h5>
								<ul class="planDetails">
									<li>Deductible: $<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${plan.get('deductible').asDouble()}"/></li>
									<li>PCP Visit: $<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${plan.get('pcpVisitPrice').asDouble()}"/></li>
									<li>Specialist visit: $<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${plan.get('specialistPrice').asDouble()}"/></li>
									<li>Prescription: $<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${plan.get('prescriptionPrice').asDouble()}"/></li>
								</ul>
							</div>
						</div>
					</core:forEach>
				</div>
			</div>
			<button class="btn-default btn-back" id="planBack">Back</button>
			<button class="btn-default" id="planNext">Next</button>
		</div>
		<div class="section" id="detailSection">
			<div class="container checkout text-center">
				<h1>Checkout</h1>
				<div class="row">
			           <div class="col-lg-6 col-md-8 col-12 paymentForm">
			               <h1>
			                   Stripe One-Time Charge
			               </h1>
			               <p class="lead">
			                   Please fill the form below to complete the order payment
			               </p>
			               <div class="card">
			                   <div class="card-body">
			                       <h5 id="selectedPlan"></h5>
			                       <p class="lead checkoutPrice">USD </p>
			                   </div>
			               </div>
			               <form action="#" id="payment-form" method="post">
			                   <input id="api-key" type="hidden" value="${stripePublicKey}">
			                   <input id="amount" type="hidden" value="">
			                   <input id="userId" type="hidden" value="${currentUser.getId()}" />
			                   <div class="form-group">
			                       <label class="font-weight-medium" for="card-element">
			                           Enter credit or debit card below
			                       </label>
			                       <div class="w-100" id="card-element">
			                           <!-- A Stripe Element will be inserted here. -->
			                       </div>
			                   </div>
			                   <div class="form-group">
			                       <input class="form-control" id="email" name="email"
			                              placeholder="Email Address" type="email" required>
			                   </div>
			                   <!-- Used to display Element errors. -->
			                   <div class="text-danger w-100" id="card-errors" role="alert"></div>
			                   <div class="form-group pt-2">
			                       <button class="btn btn-primary btn-block btn-default" id="submitButton" type="submit">
			                           Pay With Your Card
			                       </button>
			                       <div class="small text-muted">
			                           Pay securely with Stripe. By clicking the button above, you agree
			                           to our <a target="_blank" href="#">Terms of Service</a>,
			                           <a target="_blank" href="#">Privacy</a> and
			                           <a target="_blank" href="#">Refund</a> policies.
			
			                       </div>
			                   </div>
			               </form>
			           </div>
			       </div>
			</div>
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
				$("#addressZipCode").val($("#zipCode").val())
			}
		})
		
		$("#infoNext").click(function() {
			const dob = $("#dob").val()
			const gender = $("#gender option:selected").val()
			const firstName = $("#firstName").val()
			const lastName = $("#lastName").val()
			const addressLine1 = $("#addressLine1").val()
			const addressLine2 = $("#addressLine2").val()
			const city = $("#city").val()
			const state = $("#state").val()
			const country = $("#country").val()

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
			} else if (addressLine1 == "" || city == "" || state == "" || country == "") {
				$(".errorInfo").append("<p>enter full address</p>")
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
			//$("#startedTab").empty()
			//$("#startedTab").append("Get Started")
			$("#startedTab").children('i').remove()

	    	$(".apply nav #startedTab").addClass('active')
	    	$(".apply nav #startedTab").siblings().removeClass('active')
		})
		
		$("#planBack").click(function() {
			$(this).parent().removeClass("activeSection")
			$("#infoSection").addClass("activeSection")
			//$("#infoTab").empty()
			//$("#infoTab").append("Coverage Information")
			$("#infoTab").children('i').remove()
			
	    	$(".apply nav #infoTab").addClass('active')
	    	$(".apply nav #infoTab").siblings().removeClass('active')
		})
		
		$("#planNext").click(function() {
			$(".apply nav #detailTab").addClass('active')
	    	$(".apply nav #detailTab").siblings().removeClass('active')
			$(".apply nav #planTab").prepend('<i class="fa fa-check-circle"></i> ')
	    	$(this).parent().removeClass("activeSection")
			$("#detailSection").addClass("activeSection")
			
			$("#firstNameMyself").val($("#firstName").val())
			$("#lastNameMyself").val($("#lastName").val())
			$("#dobMyself").val($("#dob").val())
			$("#genderMyself option[value='" + $("#gender option:selected").val() + "']").prop("selected", true)
			
			console.log($(".planSectionPlans.active").children(".planName").text())
			console.log($("#selectedPlan"))
			$("#selectedPlan").append('InsurancePress ' + $(".planSectionPlans.active").children(".planName").text())
			$("#amount").val($(".planSectionPlans.active").children(".planAmount").val())
			$(".checkoutPrice").append($(".planSectionPlans.active").children(".planAmount").val())
		})
		
		var selectedPlan = null
		$(".planSectionPlans").click(function() {
			$(this).addClass("active")
			$(this).parent().siblings().children(".planSectionPlans").removeClass("active")
			console.log($(this).children('.planId').text())
			$(this).children('.planId').addClass('selected')
			$(this).parent().siblings().children(".planSectionPlans").children(".planId").removeClass('selected')
			$("#chargeBtn").attr("href", "/charge?planId="+$("p.selected").text())
			
		})
		
		$("#detailBack").click(function() {
			$(this).parent().removeClass("activeSection")
			$("#planSection").addClass("activeSection")
			//$("#planTab").empty()
			//$("#planTab").append("Plan Selection")
			$("#planTab").children('i').remove()

	    	$(".apply nav #planTab").addClass('active')
	    	$(".apply nav #planTab").siblings().removeClass('active')
		})
	})
</script>
<script>
    $(function () {
        var API_KEY = $('#api-key').val();
        // Create a Stripe client.
        var stripe = Stripe(API_KEY);

        // Create an instance of Elements.
        var elements = stripe.elements();

        // Create an instance of the card Element.
        var card = elements.create('card');

        // Add an instance of the card Element into the `card-element` <div>.
        card.mount('#card-element');

        // Handle real-time validation errors from the card Element.
        card.addEventListener('change', function (event) {
            var displayError = document.getElementById('card-errors');
            if (event.error) {
                displayError.textContent = event.error.message;
            } else {
                displayError.textContent = '';
            }
        });

        // Handle form submission.
        var form = document.getElementById('payment-form');
        form.addEventListener('submit', function (event) {
            event.preventDefault();
            // handle payment
            handlePayments();
        });

        //handle card submission
        function handlePayments() {
            stripe.createToken(card).then(function (result) {
                if (result.error) {
                    // Inform the user if there was an error.
                    var errorElement = document.getElementById('card-errors');
                    errorElement.textContent = result.error.message;
                } else {
                    // Send the token to your server.
                    var token = result.token.id;
                    var email = $('#email').val();
                    var amount = $("#amount").val();
 
                    $.post("/create-charge", {email: email, token: token, amount: amount}, 'json')
                    .done(function (data) {
                    	alert("Success! Your charge id is " + data.details);
                    		let address = {
                					addressLine1: $("#addressLine1").val(),
                					addressLine2: $("#addressLine2").val(),
                					city: $("#city").val(),
                					state: $("#state").val(),
                					country: $("#country").val(),
                					zipCode: $("#addressZipCode").val()
              					}
                    			
                   			let customer = {
                  					//id
                  					firstName: $("#firstName").val(),
                  					lastName: $("#lastName").val(),
                  					email: $("#email").val(),
                  					dob: $("#dob").val(),
                  					gender: $("#gender option:selected").val(),
                  					phoneNumber: $("#phoneNumber").val(),
                  					address: address,
                  					//govIdDoc
                  					//addressDoc
                  					userId: $("#userId").val()
                  					//policies
                   			}
                            console.log(customer)
                            $.ajax({
								type: "POST",
								contentType: "application/json",
								url: "/saveCustomer",
								data: JSON.stringify(customer),
								dataType: "json",
								success: function(savedCust) {
									console.log("saved customer", savedCust)
									
									let plan = {
										id: $("p.selected").text()
									}
									
									let policy = {
										customer: savedCust,
										status: "PENDING",
										//openDate
										//endDate
										//renewDate
										plan: plan,
										price: amount
									}
									$.ajax({
										type: "POST",
										contentType: "application/json",
										url: "/savePolicy",
										data: JSON.stringify(policy),
										dataType: "json",
										success: function(savedPolicy) {
											console.log("saved policy", savedPolicy)
											
											let payment = {
												policy: savedPolicy,
												chargeId: data.details,
												amount: amount,
												paymentDate: savedPolicy.openDate
											}
											
											$.ajax({
												type: "POST",
												contentType: "application/json",
												url: "/savePayment",
												data: JSON.stringify(payment),
												dataType: "json",
												success: function(savedPayment) {
													console.log("saved payment", savedPayment)
													
													window.location.href = "/result/"+savedPolicy.id+"/"+data.details;
													
												},
												error: function(e) {
													alert("error saving payment")
												}
											})
											
										},
										error: function(e) {
											alert("error saving policy")
										}
									})
								},
								error: function(e) {
									alert("error saving customer")
								}
							})
                    })
                    .fail(function() {
                    	alert('checkout failed try again')
                    });
                }
            });
        }
    });
</script>
</body>
</html>