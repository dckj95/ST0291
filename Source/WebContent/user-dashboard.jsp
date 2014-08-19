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

		<title>SP Airlines | User Dashboard</title>

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
			String username = "";
				
			if (session.getAttribute("user") == null) {
				response.sendRedirect("login.html");
			} else {
				User u = (User)	session.getAttribute("user");
				firstName = u.getFirstName();
				lastName = u.getLastName();
				username = u.getUsername();
			}
		
		%>
	
		<!-- Navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top headroom" >
			<div class="container">
			
				<!-- Logo + Button for smaller screens -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					</button>
					<a class="navbar-brand" href="index.jsp"><img src="images/logo.png" alt="SP Airlines"></a>
				</div>
				
				<!-- Right links -->
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav pull-right">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="booking.jsp">Booking</a></li>
						<li><a class="btn" href="javascript:void(0)">Logged in as: <%=firstName%> <%=lastName%></a></li>
						<li><a class="btn" href="Logout">Logout</a></li>
					</ul>
				</div>

			</div>
		</div>

	<!-- Header placeholder -->
	<header id="head" class="secondary"></header>

	<!-- Container for main content -->
	<div class="container">

		<!-- Breadcrumb -->
		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">User Dashboard</li>
		</ol>

		<div class="row" id="bottom">

			<!-- Sidebar START -->
			<aside class="col-md-4 sidebar sidebar-left">

				<div class="row widget">
					<div class="col-xs-12">
						<h1 class="page-title">Quick Links</h1>
						<hr>
						
						<!-- Form START -->
						<form id="sideLinks">
							<fieldset>
								<legend>Book Flights</legend>
								<table class="fixed">
									<tr>
										<td><a href="viewCart.jsp"><img src="images/icons/cart.png" alt="View Cart"></a></td>
										<td><a href="checkout.jsp"><img src="images/icons/checkout.png" alt="Checkout"></a></td>
									</tr>
									<tr>
										<td>View Cart</td>
										<td>Checkout</td>
									</tr>
								</table>
							</fieldset><br><br>
						</form>
						<!-- Form END -->
						
					</div>
				</div>
			</aside>
			<!-- Sidebar END -->
			
			<article class="col-md-1"></article>
			
			<!-- Main content START -->
			<article class="col-md-7 maincontent">
				<header class="page-header">
					<h1 class="page-title">Welcome <%=firstName%></h1>
				</header>
				
				<%
				
					int points = DBSearch.generateUserStats(username);
				
				%>
				
				<h6>
					You have:<br>
					<strong><%=points%></strong> points<br>
				</h6>
				 
			</article>
			<!-- Main content END -->
			
		</div>
	</div>
	
	<!-- JS libraries -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="js/headroom.min.js"></script>
	<script src="js/jQuery.headroom.min.js"></script>
	<script src="js/initBasic.js"></script>
	
</body>
</html>