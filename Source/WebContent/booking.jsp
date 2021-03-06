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

		<title>SP Airlines | Booking</title>

		<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
		<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,300italic,400italic,600italic' rel='stylesheet' type='text/css'>			
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-theme.css" media="screen" >
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="css/datepicker/datepicker.css">
		<link rel="stylesheet" href="css/nivo-slider.css">

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
						<li class="active"><a href="booking.jsp">Booking</a></li>
						<%=loginBtn%>
					</ul>
				</div>

			</div>
		</div>

	<!-- Header placeholder -->
	<header id="head" class="secondary"></header>

	<!-- Container for main components -->
	<div class="container">
		
		<!-- Breadcrumb -->
		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li class="active">Booking</li>
		</ol>

		<div class="row" id="bottom">
			
			<!-- Sidebar START -->
			<aside class="col-md-4 sidebar sidebar-left">

				<div class="row widget">
					<div class="col-xs-12">
						<h1 class="page-title">Search For Flights</h1>
						<hr>
						
						<%
						
							String departCodeChooser = DBSearch.airportSearch("depart");
							String arriveCodeChooser = DBSearch.airportSearch("arrive");
						
						%>
						
						<!-- Form START -->
						<form id="search" action="SearchFlights" method="post">
							<fieldset>
								<legend>Type of Trip</legend>

								<table class="fixed">
									<tr>
										<td>
											<input id="r1" type="radio" name="triptype" value="return" checked required>
											<label for="r1">Return</label>
										</td>
										<td>
											<input id="r2" type="radio" name="triptype" value="oneway" required>
											<label for="r2">One-way</label>
										</td>
									</tr>
								</table>
							</fieldset><br>

							<fieldset>
								<legend>Destinations</legend>
								<strong>Departure Airport:</strong><br>
								<select name="depart" class="select" id="depart" required>
									<%=departCodeChooser%>
								</select>
								<br>

								<strong>Arrival Airport:</strong><br>
								<select name="arrive" class="select" id="arrive" required>
									<%=arriveCodeChooser%>
								</select>
							</fieldset><br>

							<fieldset>
								<legend>Dates of Travel</legend>

								<table class="fixed">
									<tr>
										<td><strong>Departure Date:</strong></td>
										<td id="returnLabel"><strong>Return Date:</strong></td>
									</tr>
									<tr>
										<td><input type="text" name="departDate" id="departDate" pattern="^\d{4}-\d{2}-\d{2}$" required></td>
										<td><input type="text" name="returnDate" id="returnDate" pattern="^\d{4}-\d{2}-\d{2}$" required></td>
									</tr>
								</table>
							</fieldset><br>

							<fieldset>
								<legend>Additional Information</legend>

								<table class="fixed">
									<tr>
										<td><strong>Cabin Class:</strong></td>
										<td><strong>Adults:</strong></td>
										<td><strong>Children:</strong></td>
									</tr>
									<tr>
										<td>
											<select name="class" required>
											<option value="Economy">Economy</option>
											<option value="Business">Business</option>
											<option value="First">First</option>
											</select>
										</td>
										<td>
											<select name="adult" required>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											</select>
										</td>
										<td>
											<select name="child" required>
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											</select>
										</td>
									</tr>
								</table>
							</fieldset><br><br>

							<input type="submit" name="submit" value="Search">

						</form>
						<!-- Form END -->
					</div>
				</div>
			</aside>
			<!-- Sidebar END -->

			<!-- Main content START -->
			<article class="col-md-8 maincontent">
				<header class="page-header">
					<h1 class="page-title">Destination Attractions</h1>
				</header>

				<div id="slider" class="nivoSlider">
				    <img src="images/slide/1.jpg" alt="" />
				    <img src="images/slide/2.jpg" alt="" />
				    <img src="images/slide/3.jpg" alt="" />
				    <img src="images/slide/4.jpg" alt="" />
				    <img src="images/slide/5.jpg" alt="" />
				    <img src="images/slide/6.jpg" alt="" />
				    <img src="images/slide/7.jpg" alt="" />
				    <img src="images/slide/8.jpg" alt="" />
				    <img src="images/slide/9.jpg" alt="" />
				    <img src="images/slide/10.jpg" alt="" />
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
	<script src="js/datepicker.js"></script>
	<script src="js/jquery.nivo.slider.js"></script>
	
</body>
</html>