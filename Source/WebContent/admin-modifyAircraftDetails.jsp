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

		<title>SP Airlines | Admin Dashboard | Modify Aircraft</title>

		<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
		<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,300italic,400italic,600italic' rel='stylesheet' type='text/css'>			
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-theme.css" media="screen" >
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
			<li class="active">Modify Aircraft</li>
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
										<td><a href="admin-modifyAircraft.jsp"><img src="images/icons/aircraft-active.png" alt="Modify Aircraft"></a></td>
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
					<h1 class="page-title">Modify Aircraft</h1>
				</header>
				
				<%
					int aircraftID = Integer.parseInt(request.getParameter("aircraftID"));
					String model = "";
					String flightNum = "";
					int economyCap = 0;
					int businessCap = 0;
					int firstCap = 0;
					int totalCap = 0;
					String economyImage = "";
					String businessImage = "";
					String firstImage = "";
						
					out.println("<strong>Details for Aircraft ID " + aircraftID + ":</strong><br>");
											
					Aircraft a = DBSearch.singleAircraftSearch(aircraftID);
						
					out.println("<table class='searchResults'>");
					
					out.println("<tr class='breakRow'>");
					out.println("<td><strong>Aircraft ID</strong></td>");
					out.println("<td><strong>Model</strong></td>");
					out.println("<td><strong>Flight Number</strong></td>");
					out.println("<td><strong>Economy Capacity</strong></td>");
					out.println("<td><strong>Business Capacity</strong></td>");
					out.println("<td><strong>First<br>Capacity</strong></td>");
					out.println("<td><strong>Total Capacity</strong></td>");
					out.println("</tr>");
					
					model = a.getModel();
					flightNum = a.getFlightNum();
					economyCap = a.getEconomyCap();
					businessCap = a.getBusinessCap();
					firstCap = a.getFirstCap();
					totalCap = a.getTotalCap();
					economyImage = a.getEconomyImage();
					businessImage = a.getBusinessImage();
					firstImage = a.getFirstImage();
					
					out.println("<tr>");
					out.println("<td>" + aircraftID + "</td>");
					out.println("<td>" + model + "</td>");
					out.println("<td>" + flightNum + "</td>");
					out.println("<td>" + economyCap + "</td>");
					out.println("<td>" + businessCap + "</td>");
					out.println("<td>" + firstCap + "</td>");
					out.println("<td>" + totalCap + "</td>");
					out.println("</tr>");
					
					out.println("<tr>");
					out.println("<td></td>");
					out.println("<td colspan='2'>");
					out.println("&#9679; <a class='nivo' href='" + Misc.imgLink() + economyImage + "'>" + economyImage + "</a>");
					out.println("</td>");
					out.println("<td colspan='2'>");
					out.println("&#9679; <a class='nivo' href='" + Misc.imgLink() + businessImage + "'>" + businessImage + "</a>");
					out.println("</td>");
					if (!firstImage.equals("")) {
						out.println("<td colspan='2'>");
						out.println("&#9679; <a class='nivo' href='" + Misc.imgLink() + firstImage + "'>" + firstImage + "</a>");
						out.println("</td>");
					} else {
						out.println("<td colspan='2'></td>");
					}
					out.println("</tr>");
					
					out.println("</table><br>");
					
				%>
				
				<strong>Please enter the updated aircraft details:</strong><br>
				
				<!-- Form START -->
				<form action="ModifyAircraft" method="post" enctype="multipart/form-data">
					<input type="hidden" name="aircraftID" value="<%=aircraftID%>">
					<table class="adminFixed">
						<tr>
							<td>Aircraft Model:</td>
							<td><input type="text" name="model" value="<%=model%>" required></td>
						</tr>
						<tr>
							<td>Flight Number:</td>
							<td><input type="text" name="flightNum" value="<%=flightNum%>" pattern="^SP\s\d{2,3}$" required></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td>Economy Class Capacity:</td>
							<td><input type="text" name="economyCap" value="<%=economyCap%>" pattern="^\d+$" required></td>
						</tr>
						<tr>
							<td>Business Class Capacity:</td>
							<td><input type="text" name="businessCap" value="<%=businessCap%>" pattern="^\d+$" required></td>
						</tr>
						<tr>
							<td>First Class Capacity:</td>
							<td><input type="text" name="firstCap" value="<%=firstCap%>" pattern="^\d+$"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td><label for="imageEditCheck">Edit flight seat layouts</label></td>
							<td><input type="checkbox" name="imageEditCheck" id="imageEditCheck" value="yes"></td>
						</tr>
						<tr class="imageEdit">
							<td>Economy Seat Layout:</td>
							<td><input type="file" accept="image/jpeg" name="economyImage"></td>
						</tr>
						<tr class="imageEdit">
							<td>Business Seat Layout:</td>
							<td><input type="file" accept="image/jpeg" name="businessImage"></td>
						</tr>
						<tr class="imageEdit">
							<td>First Seat Layout:</td>
							<td><input type="file" accept="image/jpeg" name="firstImage"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Modify"></td>
						</tr>
					</table>
				</form>
				<!-- Form END -->
				
			</article>		
			<!-- Main content END -->	
		</div>
	</div>
	
	<!-- JS libraries -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="js/headroom.min.js"></script>
	<script src="js/jQuery.headroom.min.js"></script>
	<script src="js/initAircraftDetails.js"></script>
	<script src="js/nivo/nivo-lightbox.min.js"></script>
	
</body>
</html>