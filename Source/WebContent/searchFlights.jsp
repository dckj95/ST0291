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

		<title>SP Airlines | Flight Search</title>

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
			<li class="active">Flight Search</li>
		</ol>

		<%
			// Get values
			String triptype = request.getParameter("triptype");
			String depart = request.getParameter("depart");
			String arrive = request.getParameter("arrive");
			String departDate = request.getParameter("departDate");
			String cabinClass = request.getParameter("class");
			int adult = Integer.parseInt(request.getParameter("adult"));
			int child = Integer.parseInt(request.getParameter("child"));
			String returnDate = null;
			
			// If return trip, get returnDate
			if (triptype.equals("return")) {
				returnDate = request.getParameter("returnDate");
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
					<h1 class="page-title">Search Results</h1>
				</header>
				
				<form action="AddToCart" method="post">
				<input type="hidden" name="triptype" value="<%=triptype%>">
				<input type="hidden" name="class" value="<%=cabinClass%>">
				<input type="hidden" name="adult" value="<%=adult%>">
				<input type="hidden" name="child" value="<%=child%>">
				
				<%	
				
					out.println("<strong>" + depart + " to " + arrive + "</strong>");
						
					if (request.getAttribute("search") != null) {
						ArrayList<FlightSchedule> search = (ArrayList<FlightSchedule>) request.getAttribute("search");
						
						out.println(" - <a href='#' id='showInfo1'>Toggle prices and additional information</a><br>");
						out.println("<table id='1' class='searchResults'>");
						
						
						for (FlightSchedule fs:search) {
							
							out.println("<tr class='breakRow'>");
							out.println("<td colspan='2'></td>");
							out.println("<td colspan='8'><strong>" + fs.getFlightNum() + "</strong></td>");
							out.println("<td colspan='8'>Flight Time: " + fs.getFlightTime() + "</td>");
							out.println("</tr>");
							
							out.println("<tr>");
							out.println("<td colspan='2'></td>");
							out.println("<td colspan='8'><strong>" + fs.getDepart() + " (" + fs.getDepartCode() + ")</strong></td>");
							out.println("<td colspan='8'><strong>" + fs.getArrive() + " (" + fs.getArriveCode() + ")</strong></td>");
							out.println("</tr>");
							
							out.println("<tr>");
							out.println("<td></td>");
							out.println("<td><input type='radio' name='bookDepart' value='" + fs.getFsID() + "' required></td>");
							out.println("<td colspan='8'>" + fs.getDepartCity() + ", " + fs.getDepartCountry() + "</td>");
							out.println("<td colspan='8'>" + fs.getArriveCity() + ", " + fs.getArriveCountry() + "</td>");
							out.println("</tr>");
							
							out.println("<tr class='breakRow'>");
							out.println("<td colspan='2'></td>");
							out.println("<td colspan='8'>" + fs.getDepartDate() + " | " + fs.getDepartTime() + "</td>");
							out.println("<td colspan='8'>" + fs.getArriveDate() + " | " + fs.getArriveTime() + "</td>");
							out.println("</tr>");
							
							out.println("<tr class='moreInfo'>");
							out.println("<td colspan='2'></td>");
							out.println("<td colspan='8'>Economy: $" + String.format("%.2f", fs.getEconomyCost()) + "</td>");
							if (!fs.getEconomyImage().equals("")) {
								out.println("<td colspan='8'><a class='nivo' href='" + Misc.imgLink() + fs.getEconomyImage() + "'>Economy Seat Layout</a></td>");
							}
							out.println("</tr>");
							
							out.println("<tr class='moreInfo'>");
							out.println("<td colspan='2'></td>");
							out.println("<td colspan='8'>Business: $" + String.format("%.2f", fs.getBusinessCost()) + "</td>");
							if (!fs.getBusinessImage().equals("")) {
								out.println("<td colspan='8'><a class='nivo' href='" + Misc.imgLink() + fs.getBusinessImage() + "'>Business Seat Layout</a></td>");
							}
							out.println("</tr>");
							
							if (fs.getFirstCost() != 0.00) {
								out.println("<tr class='moreInfo'>");
								out.println("<td colspan='2'></td>");
								out.println("<td colspan='8'>First: $" + String.format("%.2f", fs.getFirstCost()) + "</td>");
								if (!fs.getFirstImage().equals("")) {
									out.println("<td colspan='8'><a class='nivo' href='" + Misc.imgLink() + fs.getFirstImage() + "'>First Seat Layout</a></td>");
								}
								out.println("</tr>");
							}
							
							out.println("<tr>");
							out.println("<td colspan='2' class='tableBreak'><br></td>");
							out.println("<td colspan='8' class='tableBreak'><br></td>");
							out.println("<td colspan='8' class='tableBreak'><br></td>");
							out.println("</tr>");
							
						}
						
						out.println("</table>");
					} else {
						out.println("<br>No flights were found.<br><a href='booking.jsp'>Click here</a> to try again.<br><br>");
					}
					
					if (triptype.equals("return")) {
						
						out.println("<strong>" + arrive + " to " + depart + "</strong>");
							
						if (request.getAttribute("Rsearch") != null) {
							ArrayList<FlightSchedule> Rsearch = (ArrayList<FlightSchedule>) request.getAttribute("Rsearch");
							out.println(" - <a href='#' id='showInfo2'>Toggle prices and additional information</a><br>");
							out.println("<table id='2' class='searchResults'>");
							
							for (FlightSchedule fs:Rsearch) {
								
								out.println("<tr class='breakRow'>");	
								out.println("<td colspan='2'></td>");
								out.println("<td colspan='8'><strong>" + fs.getFlightNum() + "</strong></td>");
								out.println("<td colspan='8'>Flight Time: " + fs.getFlightTime() + "</td>");
								out.println("</tr>");
								
								out.println("<tr>");	
								out.println("<td colspan='2'></td>");
								out.println("<td colspan='8'><strong>" + fs.getDepart() + " (" + fs.getDepartCode() + ")</strong></td>");
								out.println("<td colspan='8'><strong>" + fs.getArrive() + " (" + fs.getArriveCode() + ")</strong></td>");
								out.println("</tr>");
								
								out.println("<tr>");
								out.println("<td></td>");
								out.println("<td><input type='radio' name='bookReturn' value='" + fs.getFsID() + "' required></td>");
								out.println("<td colspan='8'>" + fs.getDepartCity() + ", " + fs.getDepartCountry() + "</td>");
								out.println("<td colspan='8'>" + fs.getArriveCity() + ", " + fs.getArriveCountry() + "</td>");
								out.println("</tr>");
								
								out.println("<tr class='breakRow'>");
								out.println("<td colspan='2'></td>");
								out.println("<td colspan='8'>" + fs.getDepartDate() + " | " + fs.getDepartTime() + "</td>");
								out.println("<td colspan='8'>" + fs.getArriveDate() + " | " + fs.getArriveTime() + "</td>");
								out.println("</tr>");
								
								out.println("<tr class='moreInfo'>");
								out.println("<td colspan='2'></td>");
								out.println("<td colspan='8'>Economy: $" + fs.getEconomyCost() + "</td>");
								if (!fs.getEconomyImage().equals("")) {
									out.println("<td colspan='8'><a class='nivo' href='" + Misc.imgLink() + fs.getEconomyImage() + "'>Economy Seat Layout</a></td>");
								}
								out.println("</tr>");
								
								out.println("<tr class='moreInfo'>");
								out.println("<td colspan='2'></td>");
								out.println("<td colspan='8'>Business: $" + fs.getBusinessCost() + "</td>");
								if (!fs.getBusinessImage().equals("")) {
									out.println("<td colspan='8'><a class='nivo' href='" + Misc.imgLink() + fs.getBusinessImage() + "'>Business Seat Layout</a></td>");
								}
								out.println("</tr>");
								
								if (fs.getFirstCost() != 0.00) {
									out.println("<tr class='moreInfo'>");
									out.println("<td colspan='2'></td>");
									out.println("<td colspan='8'>First: $" + fs.getFirstCost() + "</td>");
									if (!fs.getFirstImage().equals("")) {
										out.println("<td colspan='8'><a class='nivo' href='" + Misc.imgLink() + fs.getFirstImage() + "'>First Seat Layout</a></td>");
									}
									out.println("</tr>");
								}
								
								out.println("<tr>");
								out.println("<td colspan='2' class='tableBreak'><br></td>");
								out.println("<td colspan='8' class='tableBreak'><br></td>");
								out.println("<td colspan='8' class='tableBreak'><br></td>");
								out.println("</tr>");
								
							}
							
							out.println("</table>");
						} else {
							out.println("<br>No flights were found.<br><a href='booking.jsp'>Click here</a> to try again.<br><br>");
						}
						
					}
					
					if (request.getAttribute("search") != null || request.getAttribute("Rsearch") != null) {
						out.println("<input type='submit' value='Add to Cart'>");
					}
					
				%>
				
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
	<script src="js/initResult.js"></script>
	<script src="js/nivo/nivo-lightbox.min.js"></script>

</body>
</html>