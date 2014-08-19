<!-- JSP headers -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>
    
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">

		<title>SP Airlines | Checkout</title>

		<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
		<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,300italic,400italic,600italic' rel='stylesheet' type='text/css'>			
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-theme.css" media="screen" >
		<link rel="stylesheet" href="css/main.css">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
		<![endif]-->
		
	</head>

	<body>
	
		<%
			
			String firstName = "";
			String lastName = "";
			String loginBtn = "";
				
			if (session.getAttribute("user") == null) {
				loginBtn = "<li><a class='btn' href='login.html'>Login</a></li>";
			} else {
				User u = (User)	session.getAttribute("user");
				firstName = u.getFirstName();
				lastName = u.getLastName();
				loginBtn = "<li><a class='btn' href='Dashboard'>Logged in as: " + firstName + " " + lastName + "</a></li>\n" + 
				"<li><a class='btn' href='Logout'>Logout</a></li>";
			}
		
		%>

	<!-- START Navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom">
		<div class="container">

			<!-- START Logo + Button for smaller screens -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><img
					src="images/logo.png" alt="SP Airlines"></a>
			</div>
			<!-- END logo -->

			<!-- START Nav links -->
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="index.jsp">Home</a></li>
					<li class="active"><a href="booking.jsp">Booking</a></li>
					<%=loginBtn%>
				</ul>
			</div>
			<!-- END Nav links -->

		</div>
	</div>
	<!-- END Navbar -->

	<!-- Header placeholder -->
	<header id="head" class="secondary"></header>

	<!-- Container for main content -->
	<div class="container">

		<!-- Breadcrumb -->
		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="booking.jsp">Booking</a></li>
			<li><a href="javascript:void(0)">Flight Search</a></li>
			<li><a href="viewCart.jsp">View Cart</a></li>
			<li class="active">Checkout</li>
		</ol>

		<div class="row">
		
			<%
			
				int checkoutStatus;
				String output = "";
			
				if (request.getAttribute("checkoutStatus") != null) {
					if (Integer.parseInt(request.getAttribute("checkoutStatus").toString()) == 0) {
						output = "Congratulations, your booking has been confirmed!<br>Thank you for choosing SP Airlines";
					} else {
						output = "An unknown error has occurred.<br><a href='booking.jsp'>Click here</a> to try again";
					}
				} else {
					output = "An unknown error has occurred.<br><a href='booking.jsp'>Click here</a> to try again";
				}
				
			%>
			
			<!-- Main content START -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Checkout</h1>
				</header>
				
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">Booking Confirmation</h3>
							<p class="text-center text-muted">
							<%=output%>
							</p>
							
							<hr>
							
						</div>
					</div>

				</div>
				
			</article>
			<!-- Main content END -->

		</div>
	</div>

	<!-- JS libraries -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="js/headroom.min.js"></script>
	<script src="js/jQuery.headroom.min.js"></script>
	<script src="js/init.js"></script>
	
</body>
</html>