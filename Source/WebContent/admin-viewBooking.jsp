<!-- JSP headers -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">

		<title>SP Airlines | Admin Dashboard | View Booking</title>

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
				
			if (session.getAttribute("user") == null) {
				response.sendRedirect("login.html");
			} else {
				User u = (User)	session.getAttribute("user");
				firstName = u.getFirstName();
				lastName = u.getLastName();
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
			<li><a href="admin-dashboard.jsp">Admin Dashboard</a></li>
			<li class="active">View Booking</li>
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
								<legend>Add New</legend>
								<table class="fixed">
									<tr>
										<td><a href="admin-addNewAircraft.jsp"><img src="images/icons/aircraft.png" alt="Add New Aircraft"></a></td>
										<td><a href="admin-addNewFlightSchedule.jsp"><img src="images/icons/fs.png" alt="Add New Flight Schedule"></a></td>
									</tr>
									<tr>
										<td>Add New Aircraft</td>
										<td>Add New Flight Schedule</td>
									</tr>
								</table>
							</fieldset><br>

							<fieldset>
								<legend>Modify Existing</legend>
								<table class="fixed">
									<tr>
										<td><a href="admin-modifyAircraft.jsp"><img src="images/icons/aircraft.png" alt="Modify Aircraft"></a></td>
										<td><a href="admin-modifyFlightScheduleFilter.jsp"><img src="images/icons/fs.png" alt="Modify Flight Schedule"></a></td>
									</tr>
									<tr>
										<td>Modify Aircraft</td>
										<td>Modify Flight Schedule</td>
									</tr>
								</table>
							</fieldset><br>

							<fieldset>
								<legend>Delete</legend>
								<table class="fixed">
									<tr>
										<td><a href="admin-deleteAircraft.jsp"><img src="images/icons/aircraft.png" alt="Delete Aircraft"></a></td>
										<td><a href="admin-deleteFlightScheduleFilter.jsp"><img src="images/icons/fs.png" alt="Delete Flight Schedule"></a></td>
									</tr>
									<tr>
										<td>Delete Aircraft</td>
										<td>Delete Flight Schedule</td>
									</tr>
								</table>
							</fieldset><br>
							
							<fieldset>
								<legend>Reports</legend>
								<table class="fixed">
									<tr>
										<td><a href="admin-viewBookingFilter.jsp"><img src="images/icons/booking-active.png" alt="View Bookings"></a></td>
										<td><a href="admin-viewTopFlightRoute.jsp"><img src="images/icons/top.png" alt="View Top Flight Route"></a></td>
									</tr>
									<tr>
										<td>View Bookings</td>
										<td>View Top Flight Route</td>
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
					<h1 class="page-title">View Booking</h1>
				</header>
				
				<%
				
					if ((ArrayList<Booking>) request.getAttribute("viewBooking") != null) {
						
						ArrayList<Booking> alBooking = (ArrayList<Booking>) request.getAttribute("viewBooking");
						
						out.println("<a href='#' id='showInfo1'>Toggle additional information</a><br>");
						out.println("<table class='searchResults' id='1'>");
						
						for (Booking b:alBooking) {
							
							out.println("<tr class='breakRow'>");	
							out.println("<td><strong>Booking ID " + b.getBookingID() + "</strong></td>");
							out.println("<td><strong>Flight Schedule ID " + b.getFsID() + "</td>");
							out.println("</tr>");
							
							out.println("<tr>");	
							out.println("<td><strong>" + b.getDepart() + " (" + b.getDepartCode() + ")</strong></td>");
							out.println("<td><strong>" + b.getArrive() + " (" + b.getArriveCode() + ")</strong></td>");
							out.println("</tr>");
							
							out.println("<tr>");
							out.println("<td>" + b.getDepartCity() + ", " + b.getDepartCountry() + "</td>");
							out.println("<td>" + b.getArriveCity() + ", " + b.getArriveCountry() + "</td>");
							out.println("</tr>");
							
							if (b.getEconomy() == 1) {
								
								out.println("<tr class='breakRow'>");
									if (b.getChild() == 1) {
										out.println("<td>Child | Economy</td>");
										out.println("<td>$" + String.format("%.2f", b.getEconomyCost()/2.0) + "</td>");
									} else {
										out.println("<td>Adult | Economy</td>");
										out.println("<td>$" + String.format("%.2f", b.getEconomyCost()) + "</td>");
									}
								out.println("</tr>");
								
							} else if (b.getBusiness() == 1) {
								
								out.println("<tr class='breakRow'>");
									if (b.getChild() == 1) {
										out.println("<td>Child | Business</td>");
										out.println("<td>$" + String.format("%.2f", b.getBusinessCost()/2.0) + "</td>");
									} else {
										out.println("<td>Adult | Business</td>");
										out.println("<td>$" + String.format("%.2f", b.getBusinessCost()) + "</td>");
									}
								out.println("</tr>");
								
							} else {
								
								out.println("<tr class='breakRow'>");
									if (b.getChild() == 1) {
										out.println("<td>Child | First</td>");
										out.println("<td>$" + String.format("%.2f", b.getFirstCost()/2.0) + "</td>");
									} else {
										out.println("<td>Adult | First</td>");
										out.println("<td>$" + String.format("%.2f", b.getFirstCost()) + "</td>");
									}
								out.println("</tr>");
								
							}
							
							out.println("<tr class='moreInfo'>");
							out.println("<td>" + b.getCustTitle() + " " + b.getCustFirstName() + " " + b.getCustLastName() + "</td>");
							out.println("<td>" + b.getCardType() + " " + b.getCardNo() + "</td>");
							out.println("</tr>");
							
							out.println("<tr class='moreInfo'>");
							out.println("<td>" + b.getCustPhone() + " | " + b.getCustEmail() + "</td>");
							out.println("<td>Expiry " + b.getCardExpiry() + "</td>");
							out.println("</tr>");
							
							out.println("<tr>");
							out.println("<td class='tableBreak'><br></td>");
							out.println("<td class='tableBreak'><br></td>");
							out.println("</tr>");
							
						}
						
						out.println("</table>");
						
					} else {
						out.println("No bookings were found.");
					}
					
				%> 
				
			</article>		
			<!-- Main content END -->	
		</div>
	</div>
	
	<!-- JS libraries -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="js/headroom.min.js"></script>
	<script src="js/jQuery.headroom.min.js"></script>
	<script src="js/initResult.js"></script>
	
</body>
</html>