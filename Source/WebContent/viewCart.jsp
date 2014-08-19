<!-- JSP headers -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">

		<title>SP Airlines | View Cart</title>

		<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
		<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,300italic,400italic,600italic' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-theme.css" media="screen">
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="js/nivo/nivo-lightbox.css">
		<link rel="stylesheet" href="js/nivo/themes/default/default.css">

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
			<li class="active">View Cart</li>
		</ol>

		<%
		
			// Init
			String triptype = "-";
			String cabinClass =  "-";
			int adult = 0;
			int child = 0;
			
			FlightSchedule bookDepart = null;
			FlightSchedule bookReturn = null;
			
			String depart = "-";
			String arrive = "-";
			String departDate = "-";
			String returnDate = "-";
		
			try {
		
				// Get values from session
				triptype = (String) session.getAttribute("triptype");
				cabinClass = (String) session.getAttribute("cabinClass");
				adult = Integer.parseInt(session.getAttribute("adult").toString());
				child = Integer.parseInt(session.getAttribute("child").toString());
				
				bookDepart = (FlightSchedule) session.getAttribute("bookDepart");
				depart = bookDepart.getDepartCode();
				arrive = bookDepart.getArriveCode();
				departDate = bookDepart.getDepartDate();
				
				if (triptype.equals("return")) {
					
					bookReturn = (FlightSchedule) session.getAttribute("bookReturn");
					returnDate = bookReturn.getDepartDate();
					
				}
				
			} catch (Exception e) {
				
				triptype = "-";
				cabinClass =  "-";
				adult = 0;
				child = 0;
				depart = "-";
				arrive = "-";
				departDate = "-";
				returnDate = "-";
				
				System.out.println(Misc.getDate() + "View Cart session extraction failed - " + e);
				
			}

		%>

		<div class="row" id="bottom">

			<!-- Sidebar START -->
			<aside class="col-md-4 sidebar sidebar-left">

				<div class="row widget">
					<div class="col-xs-12">
						<h1 class="page-title">Your Input</h1>
						<hr>
						<form>
							<fieldset>
								<legend>Destinations</legend>
								<strong>Departure Airport:</strong><br>
								<%=depart%>
								<br> <strong>Arrival Airport:</strong><br>
								<%=arrive%>
							</fieldset>
							<br>

							<fieldset>
								<legend>Dates of Travel</legend>

								<table class="fixed">
									<tr>
										<td><strong>Departure Date:</strong></td>
										<%if (triptype.equals("return")) {
											out.println("<td><strong>Return Date:</strong></td>");}%>
									</tr>
									<tr>
										<td><%=departDate%></td>
										<%if (triptype.equals("return")) {
											out.println("<td>" + returnDate + "</td>");}%>
									</tr>
								</table>
							</fieldset>
							<br>

							<fieldset>
								<legend>Additional Information</legend>

								<table class="fixed">
									<tr>
										<td><strong>Cabin Class:</strong></td>
										<td><strong>Adults:</strong></td>
										<td><strong>Children:</strong></td>
									</tr>
									<tr>
										<td><%=cabinClass%></td>
										<td><%=adult%></td>
										<td><%=child%></td>
									</tr>
								</table>
							</fieldset>
							<br> <br>
						</form>
					</div>
				</div>

			</aside>
			<!-- Sidebar END -->

			<!-- Main content START -->
			<article class="col-md-8 maincontent">

				<header class="page-header">
					<h1 class="page-title">Items in Cart</h1>
				</header>
				
				<%	
				
					if (bookDepart != null) {
				
						out.println("<strong>" + bookDepart.getDepartCode() + " to " + bookDepart.getArriveCode() + "</strong>");
					
						out.println(" - <a href='#' id='showInfo1'>Toggle prices and additional information</a><br>");
						out.println("<table id='1' class='searchResults'>");
						
						out.println("<tr class='breakRow'>");
						out.println("<td><strong>" + bookDepart.getFlightNum() + "</strong></td>");
						out.println("<td>Flight Time: " + bookDepart.getFlightTime() + "</td>");
						out.println("</tr>");
						
						out.println("<tr>");
						out.println("<td><strong>" + bookDepart.getDepart() + " (" + bookDepart.getDepartCode() + ")</strong></td>");
						out.println("<td><strong>" + bookDepart.getArrive() + " (" + bookDepart.getArriveCode() + ")</strong></td>");
						out.println("</tr>");
						
						out.println("<tr>");
						out.println("<td>" + bookDepart.getDepartCity() + ", " + bookDepart.getDepartCountry() + "</td>");
						out.println("<td>" + bookDepart.getArriveCity() + ", " + bookDepart.getArriveCountry() + "</td>");
						out.println("</tr>");
						
						out.println("<tr class='breakRow'>");
						out.println("<td>" + bookDepart.getDepartDate() + " | " + bookDepart.getDepartTime() + "</td>");
						out.println("<td>" + bookDepart.getArriveDate() + " | " + bookDepart.getArriveTime() + "</td>");
						out.println("</tr>");
						
						out.println("<tr class='moreInfo'>");
						out.println("<td>Economy: $" + String.format("%.2f", bookDepart.getEconomyCost()) + "</td>");
						if (!bookDepart.getEconomyImage().equals("")) {
							out.println("<td><a class='nivo' href='" + Misc.imgLink() + bookDepart.getEconomyImage() + "'>Economy Seat Layout</a></td>");
						}
						out.println("</tr>");
						
						out.println("<tr class='moreInfo'>");
						out.println("<td>Business: $" + String.format("%.2f", bookDepart.getBusinessCost()) + "</td>");
						if (!bookDepart.getBusinessImage().equals("")) {
							out.println("<td><a class='nivo' href='" + Misc.imgLink() + bookDepart.getBusinessImage() + "'>Business Seat Layout</a></td>");
						}
						out.println("</tr>");
						
						if (bookDepart.getFirstCost() != 0.00) {
							out.println("<tr class='moreInfo'>");
							out.println("<td>First: $" + String.format("%.2f", bookDepart.getFirstCost()) + "</td>");
							if (!bookDepart.getFirstImage().equals("")) {
								out.println("<td><a class='nivo' href='" + Misc.imgLink() + bookDepart.getFirstImage() + "'>First Seat Layout</a></td>");
							}
							out.println("</tr>");
						}
						
						out.println("<tr>");
						out.println("<td class='tableBreak'><br></td>");
						out.println("<td class='tableBreak'><br></td>");
						out.println("</tr>");
						
						out.println("</table>");
						
						if (triptype.equals("return")) {
							
							out.println("<strong>" + bookReturn.getDepartCode() + " to " + bookReturn.getArriveCode() + "</strong>");
							
							out.println(" - <a href='#' id='showInfo2'>Toggle prices and additional information</a><br>");
							out.println("<table id='2' class='searchResults'>");
							
							out.println("<tr class='breakRow'>");
							out.println("<td><strong>" + bookReturn.getFlightNum() + "</strong></td>");
							out.println("<td>Flight Time: " + bookReturn.getFlightTime() + "</td>");
							out.println("</tr>");
							
							out.println("<tr>");
							out.println("<td><strong>" + bookReturn.getDepart() + " (" + bookReturn.getDepartCode() + ")</strong></td>");
							out.println("<td><strong>" + bookReturn.getArrive() + " (" + bookReturn.getArriveCode() + ")</strong></td>");
							out.println("</tr>");
							
							out.println("<tr>");
							out.println("<td>" + bookReturn.getDepartCity() + ", " + bookReturn.getDepartCountry() + "</td>");
							out.println("<td>" + bookReturn.getArriveCity() + ", " + bookReturn.getArriveCountry() + "</td>");
							out.println("</tr>");
							
							out.println("<tr class='breakRow'>");
							out.println("<td>" + bookReturn.getDepartDate() + " | " + bookReturn.getDepartTime() + "</td>");
							out.println("<td>" + bookReturn.getArriveDate() + " | " + bookReturn.getArriveTime() + "</td>");
							out.println("</tr>");
							
							out.println("<tr class='moreInfo'>");
							out.println("<td>Economy: $" + String.format("%.2f", bookReturn.getEconomyCost()) + "</td>");
							if (!bookReturn.getEconomyImage().equals("")) {
								out.println("<td><a class='nivo' href='" + Misc.imgLink() + bookReturn.getEconomyImage() + "'>Economy Seat Layout</a></td>");
							}
							out.println("</tr>");
							
							out.println("<tr class='moreInfo'>");
							out.println("<td>Business: $" + String.format("%.2f", bookReturn.getBusinessCost()) + "</td>");
							if (!bookReturn.getBusinessImage().equals("")) {
								out.println("<td><a class='nivo' href='" + Misc.imgLink() + bookReturn.getBusinessImage() + "'>Business Seat Layout</a></td>");
							}
							out.println("</tr>");
							
							if (bookReturn.getFirstCost() != 0.00) {
								out.println("<tr class='moreInfo'>");
								out.println("<td>First: $" + String.format("%.2f", bookReturn.getFirstCost()) + "</td>");
								if (!bookReturn.getFirstImage().equals("")) {
									out.println("<td><a class='nivo' href='" + Misc.imgLink() +  bookReturn.getFirstImage() + "'>First Seat Layout</a></td>");
								}
								out.println("</tr>");
							}
							
							out.println("<tr>");
							out.println("<td class='tableBreak'><br></td>");
							out.println("<td class='tableBreak'><br></td>");
							out.println("</tr>");
							
							out.println("</table>");
							
						}
						
						out.println("<form action='checkout.jsp' method='post'>");
						out.println("<input type='submit' value='Enter Passenger Details'>");
						out.println("</form>");
					
					} else {
						
						out.println("There are no items in your cart.<br>");
						out.println("<a href='booking.jsp'>Click here</a> to search for flights!");
						
					}
					
				%>
				
			</article>
			<!-- Main content END -->

		</div>
	</div>

	<!-- JS libraries -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="js/headroom.min.js"></script>
	<script src="js/jQuery.headroom.min.js"></script>
	<script src="js/initResult.js"></script>
	<script src="js/nivo/nivo-lightbox.min.js"></script>

</body>
</html>