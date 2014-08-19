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

		<title>SP Airlines | Admin Dashboard | Delete Flight Schedule</title>

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
			<li class="active">Delete Flight Schedule</li>
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
										<td><a href="admin-deleteFlightScheduleFilter.jsp"><img src="images/icons/fs-active.png" alt="Delete Flight Schedule"></a></td>
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
										<td><a href="admin-viewBookingFilter.jsp"><img src="images/icons/booking.png" alt="View Bookings"></a></td>
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
					<h1 class="page-title">Delete Flight Schedule</h1>
				</header>
				
				<%
				
					String aircraftModelChooser = DBSearch.generateFSChooser("model");
					String departDateChooser = DBSearch.generateFSChooser("departDate");
					String departCodeChooser = DBSearch.generateFSChooser("departCode");
					String arriveCodeChooser = DBSearch.generateFSChooser("arriveCode");
				
				%>
				
				<h5>Filter by:</h5>
				
				<form action="admin-deleteFlightSchedule.jsp" method="post" id="fsFilterForm">
				
					<table id="fsFilter">
					
						<tr>
						
							<td id="fsFilterLeft">
									<input id="fsFilter-aircraftModel" type="radio" name="fsFilter" value="fsFilter-aircraftModel">
									<label for="fsFilter-aircraftModel">Aircraft Model</label>
									<br>
									
									<input id="fsFilter-departDate" type="radio" name="fsFilter" value="fsFilter-departDate">
									<label for="fsFilter-departDate">Departure Date</label>
									<br>
									
									<input id="fsFilter-departCode" type="radio" name="fsFilter" value="fsFilter-departCode">
									<label for="fsFilter-departCode">Departure Airport</label>
									<br>
									
									<input id="fsFilter-arriveCode" type="radio" name="fsFilter" value="fsFilter-arriveCode">
									<label for="fsFilter-arriveCode">Arrival Airport</label>
									<br>
									
									<input id="fsFilter-all" type="radio" name="fsFilter" value="fsFilter-all" checked>
									<label for="fsFilter-all">Show All</label>
							</td>
							
							<td colspan="3" id="fsFilterRight">
								<div class="fsFilterDiv" id="fsFilterDiv-aircraftModel">
									Select an Aircraft model:<br>
									<select name="aircraftModel">
										<%=aircraftModelChooser%>
									</select>
								</div>
								
								<div class="fsFilterDiv" id="fsFilterDiv-departDate">
									Select a Departure date:<br>
									<select name="departDate">
										<%=departDateChooser%>
									</select>
								</div>
								
								<div class="fsFilterDiv" id="fsFilterDiv-departCode">
									Select a Departure Airport:<br>
									<select name="departCode">
										<%=departCodeChooser%>
									</select>
								</div>
								
								<div class="fsFilterDiv" id="fsFilterDiv-arriveCode">
									Select an Arrival Airport:<br>
									<select name="arriveCode">
										<%=arriveCodeChooser%>
									</select>
								</div>
							</td>
							
						</tr>
						
					</table>
					
					<br>
					<input type="submit" value="Filter">
				
				</form>
				
			</article>		
			<!-- Main content END -->	
		</div>
	</div>
	
	<!-- JS libraries -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="js/headroom.min.js"></script>
	<script src="js/jQuery.headroom.min.js"></script>
	<script src="js/initFSFilter.js"></script>
	
</body>
</html>