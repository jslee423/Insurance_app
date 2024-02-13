<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Health Insurance</title>
<link rel="shortcut icon" href="images/favicon.png" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
<link rel="stylesheet" type="text/css" href="css/flexslider.css " />
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/health.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="clear"></div>
<div id="page-content">
	<div class="container-fluid health">
		<h2 class="text-center">Compare Health Plans:</h2>
		<nav>
			<ul class="nav nav-tabs nav-justified">
				<!-- <li role="presentation" class="active"><a href="#hmo" aria-controls="hmo" role="tab" data-toggle="tab">Health Maintenance Organizations (HMO)</a></li>
				<li role="presentation"><a href="#ppo" aria-controls="ppo" role="tab" data-toggle="tab">Preferred Provider Organizations (PPO)</a></li> -->
				<core:forEach items='${insurances}' var="insurance" varStatus="status">
					<li role="presentation" class='${status.first ? "active" : ""}'>
						<a
							href='#${insurance.get("name").toString().replace("\"", "").substring(insurance.get("name").toString().replace("\"", "").indexOf("(") + 1, insurance.get("name").toString().replace("\"", "").indexOf(")"))}'
							aria-controls='${insurance.get("planType").toString().replace("\"", "")}'
							role="tab"
						>
							${insurance.get("name").toString().replace('\"', "")}
						</a>
					</li>
				</core:forEach>	
			</ul>
		</nav>
		<div class="tab-content">
			<core:forEach items='${insurances}' var="insurance" varStatus="status">
				<div role="tabpanel" class="tab-pane ${status.first ? 'active' : ''}" id='${insurance.get("planType").toString().replace("\"", "")}'>
					<section class="product-tab health-tab ${insurance.get('name').toString().contains('PPO') ? 'product-tab-ppo' : ''}">
						<div class="container">
				            <div class="row">
				            	<div class="parentVerticalTab">
				            		<h2 class="${insurance.get('name').toString().contains('PPO') ? 'tab-header-ppo' : ''}">
				            			${insurance.get("planType").toString().replace('\"', '')}'s
			            			</h2>
			            			<ul class="resp-tabs-list hor_1 col-sm-3 col-md-3 col-lg-3 ${insurance.get('name').toString().contains('PPO') ? 'col-sm-offset-9 col-md-offset-9 col-lg-offset-9' : ''}">
				            			<core:forEach items="${plans}" var="plan">
				            				<core:if test='${plan.get("planType").toString() == insurance.get("planType").toString()}'>
					            				<core:if test="${plan.get('planName').toString().contains('Gold')}">
						            				<li><i class="fa fa-heart"></i> ${plan.get("planName").toString().replace('\"', '')}</li>
					            				</core:if>
					            				<core:if test="${plan.get('planName').toString().contains('Silver')}">
						            				<li><i class="fa fa-heart-o"></i> ${plan.get("planName").toString().replace('\"', '')}</li>
					            				</core:if>
					            				<core:if test="${plan.get('planName').toString().contains('Basic')}">
						            				<li><i class="ti-heart-broken"></i> ${plan.get("planName").toString().replace('\"', '')}</li>
					            				</core:if>
				            				</core:if>
				            			</core:forEach>
				                    </ul>
				                    <div class="col-sm-5 col-md-5 col-lg-5 resp-tabs-container hor_1 ${insurance.get('name').toString().contains('PPO') ? 'col-sm-offset-0 col-md-offset-4 col-lg-offset-4' : ''}">
				                    	<core:forEach items="${plans}" var="plan">
				                    		<core:if test='${plan.get("planType").toString() == insurance.get("planType").toString()}'>
						                    	<div>
						                            <div class="prod-tab-content">
						                                <h4>
						                                    <span class="prod-cion" style="background-color: ${plan.get('planName').toString().contains('Gold') ? '#FFD700' : plan.get('planName').toString().contains('Silver') ?  '#dc2e17' : '#0582b6'}"><i class="fa fa-heart"></i></span>
						                                    InsurancePress ${plan.get("planName").toString().replace('\"', '')}
						                                </h4>
						                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna, euismod ut ornare non, volutpat vel tortor. Integer</p>
						                                <p>et placerat suscipit. Sed sodales scelerisque commodo. Nam porta cursus lectus. </p>
						                                <p style="margin: 0"><a href="#">Summary of Benefits and Coverage</a></p>
						                                <p style="margin: 0"><a href="#">Benefits chart</a></p>
						                                <p>
						                                    <a class="btn-default" href="/apply">Apply Now!</a>
						                                </p>
						                            </div>
						                            <img src="images/product-img.jpg" alt="" class="img-responsive" />
						                        </div>
				                    		</core:if>
				                    	</core:forEach>
				                    </div>
				            	</div>
			            	</div>
		            	</div>
					</section>
				</div>
			</core:forEach>
		    <div role="tabpanel" class="tab-pane" id="messages">647...</div>
		    <div role="tabpanel" class="tab-pane" id="settings">75474...</div>
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
	/* $(document).ready(function() {
		$.get("/findAllInsurance", function(response) {
			$.each(response, function(index, insurance) {
				let nameShort = insurance.name.substring(insurance.name.indexOf("(") + 1, insurance.name.lastIndexOf(")"))
				console.log(nameShort)
				if (nameShort == "HMO") {
					$('.nav-tabs').append('<li role="presentation" class="active"><a href="#' + nameShort + '" aria-controls="' + nameShort + '" role="tab" data-toggle="tab">' + insurance.name + '</a></li>')					
				} else {
					$('.nav-tabs').append('<li role="presentation"><a href="#' + nameShort + '" aria-controls="' + nameShort + '" role="tab" data-toggle="tab">' + insurance.name + '</a></li>')
				}
			})
		})
	}) */
</script>
</body>
</html>