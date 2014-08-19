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

		<title>SP Airlines | Checkout</title>

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
			<li><a href="viewCart.jsp">View Cart</a></li>
			<li class="active">Checkout</li>
		</ol>

		<%
		
			// Init
			String triptype = "";
			String cabinClass =  "";
			int adult = 0;
			int child = 0;
			
			FlightSchedule bookDepart = null;
			FlightSchedule bookReturn = null;
			
			String depart = "";
			String arrive = "";
			String departDate = "";
			String returnDate = "";
			
			double totalCost = 0;
		
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
				System.out.println(Misc.getDate() + "View Cart session extraction failed - " + e);
			}

		%>

		<div class="row" id="bottom">

			<!-- Sidebar START -->
			<aside class="col-md-4 sidebar sidebar-left">

				<div class="row widget">
					<div class="col-xs-12">
						<h1 class="page-title">Items in Cart</h1>
						<hr>

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
											out.println("<td><a class='nivo' href='" + Misc.imgLink() + bookReturn.getFirstImage() + "'>First Seat Layout</a></td>");
										}
										out.println("</tr>");
									}
									
									out.println("<tr>");
									out.println("<td class='tableBreak'><br></td>");
									out.println("<td class='tableBreak'><br></td>");
									out.println("</tr>");
									
									out.println("</table>");
									
								}
								
							} else {
								
								out.println("There are no items in your cart.<br>");
								out.println("<a href='booking.jsp'>Click here</a> to search for flights!");
								
							}
						
						%>

					</div>
				</div>

			</aside>
			<!-- Sidebar END -->
			
			<!-- Main content START -->
			<form action="Checkout" method="post">
			<article class="col-md-4 maincontent">

				<header class="page-header">
					<h1 class="page-title">Passenger Details</h1>
				</header>
				
				<%	
				
					if (bookDepart != null) {
				
						for (int i = 1; i <= adult; i++) {
							
							out.println("<h5>Adult #" + i + "</h5>");
							
							out.println("<table class='passenger'>");
							
							out.println("<tr>");
								out.println("<td>Title:</td>");
								out.println("<td colspan='3'>");
									out.println("<select name='adult" + i + "Title' required>");
									out.println("<option value='Mr'>Mr</option>");
									out.println("<option value='Mrs'>Mrs</option>");
									out.println("<option value='Ms'>Ms</option>");
									out.println("<option value='Miss'>Miss</option>");
									out.println("<option value='Mdm'>Mdm</option>");
									out.println("</select>");
								out.println("</td>");
							out.println("</tr>");
							
							out.println("<tr>");
								out.println("<td>First Name:</td>");
								out.println("<td><input type='text' name='adult" + i + "FirstName' pattern='^[A-Za-z\\s]+$' required></td>");
							out.println("</tr>");
							
							out.println("<tr>");
								out.println("<td>Last Name:</td>");
								out.println("<td><input type='text' name='adult" + i + "LastName' pattern='^[A-Za-z\\s]+$' required></td>");
							out.println("</tr>");
							
							out.println("<tr>");
								out.println("<td>Email Address:</td>");
								out.println("<td><input type='text' name='adult" + i + "Email' pattern='[\\w]+@[A-Za-z]+\\.[\\w]*' required></td>");
							out.println("</tr>");
							
							out.println("<tr>");
								out.println("<td>Phone Number:</td>");
								out.println("<td><input type='text' name='adult" + i + "Phone' pattern='^\\d+$' required></td>");
							out.println("</tr>");
							
							out.println("</table><br>");
							
						}
						
						if (child > 0) {
							
							for (int i = 1; i <= child; i++) {
								
								out.println("<h5>Child #" + i + "</h5>");
								
								out.println("<table class='passenger'>");
								
								out.println("<tr>");
									out.println("<td>Title:</td>");
									out.println("<td colspan='3'>");
										out.println("<select name='child" + i + "Title' required>");
										out.println("<option value='Master'>Master</option>");
										out.println("<option value='Miss'>Miss</option>");
										out.println("</select>");
									out.println("</td>");
								out.println("</tr>");
								
								out.println("<tr>");
									out.println("<td>First Name:</td>");
									out.println("<td><input type='text' name='child" + i + "FirstName' pattern='^[A-Za-z\\s]+$' required></td>");
								out.println("</tr>");
								
								out.println("<tr>");
									out.println("<td>Last Name:</td>");
									out.println("<td><input type='text' name='child" + i + "LastName' pattern='^[A-Za-z\\s]+$' required></td>");
								out.println("</tr>");
								
								out.println("<tr>");
									out.println("<td>Email Address:</td>");
									out.println("<td><input type='text' name='child" + i + "Email' pattern='[\\w]+@[A-Za-z]+\\.[\\w]*' required></td>");
								out.println("</tr>");
								
								out.println("<tr>");
									out.println("<td>Phone Number:</td>");
									out.println("<td><input type='text' name='child" + i + "Phone' pattern='^\\d+$' required></td>");
								out.println("</tr>");
								
								out.println("</table><br>");
							
							}
							
						}
						
					} else {
						out.println("-");
					}
					
				%>
				
			</article>

			<article class="col-md-4">
			
				<header class="page-header">
					<h1 class="page-title">Payment Information</h1>
				</header>
				
				<%
				
					if (bookDepart != null) {
						
						out.println("<h5>Cost Summary</h5>");
						out.println("<table class='passenger'>");
				
						out.println("<tr>");
							out.println("<td>Adult x " + adult + ":</td>");
							out.println("<td>");
								if (triptype.equals("return")) {
									if (cabinClass.equals("Economy")) {
										totalCost += adult*(bookDepart.getEconomyCost() + bookReturn.getEconomyCost());
										out.println("$ " + String.format("%.2f", adult*(bookDepart.getEconomyCost() + bookReturn.getEconomyCost())));
									} else if (cabinClass.equals("Business")) {
										totalCost += adult*(bookDepart.getBusinessCost() + bookReturn.getBusinessCost());
										out.println("$ " + String.format("%.2f", adult*(bookDepart.getBusinessCost() + bookReturn.getBusinessCost())));
									} else if (cabinClass.equals("First")) {
										totalCost += adult*(bookDepart.getFirstCost() + bookReturn.getFirstCost());
										out.println("$ " + String.format("%.2f", adult*(bookDepart.getFirstCost() + bookReturn.getFirstCost())));
									}
								} else {
									if (cabinClass.equals("Economy")) {
										totalCost += adult*(bookDepart.getEconomyCost());
										out.println("$ " + String.format("%.2f", adult*(bookDepart.getEconomyCost())));
									} else if (cabinClass.equals("Business")) {
										totalCost += adult*(bookDepart.getBusinessCost());
										out.println("$ " + String.format("%.2f", adult*(bookDepart.getBusinessCost())));
									} else if (cabinClass.equals("First")) {
										totalCost += adult*(bookDepart.getFirstCost());
										out.println("$ " + String.format("%.2f", adult*(bookDepart.getFirstCost())));
									}
								}
							out.println("</td>");
						out.println("</tr>");
						
						if (child > 0) {
							
							out.println("<tr>");
								out.println("<td>Child x " + child + ":</td>");
								out.println("<td>");
									if (triptype.equals("return")) {
										if (cabinClass.equals("Economy")) {
											totalCost += 0.5*child*(bookDepart.getEconomyCost() + bookReturn.getEconomyCost());
											out.println("$ " + String.format("%.2f", 0.5*child*(bookDepart.getEconomyCost() + bookReturn.getEconomyCost())));
										} else if (cabinClass.equals("Business")) {
											totalCost += 0.5*child*(bookDepart.getBusinessCost() + bookReturn.getBusinessCost());
											out.println("$ " + String.format("%.2f", 0.5*child*(bookDepart.getBusinessCost() + bookReturn.getBusinessCost())));
										} else if (cabinClass.equals("First")) {
											totalCost += 0.5*child*(bookDepart.getFirstCost() + bookReturn.getFirstCost());
											out.println("$ " + String.format("%.2f", 0.5*child*(bookDepart.getFirstCost() + bookReturn.getFirstCost())));
										}
									} else {
										if (cabinClass.equals("Economy")) {
											totalCost += 0.5*child*(bookDepart.getEconomyCost());
											out.println("$ " + String.format("%.2f", 0.5*child*(bookDepart.getEconomyCost())));
										} else if (cabinClass.equals("Business")) {
											totalCost += 0.5*child*(bookDepart.getBusinessCost());
											out.println("$ " + String.format("%.2f", 0.5*child*(bookDepart.getBusinessCost())));
										} else if (cabinClass.equals("First")) {
											totalCost += 0.5*child*(bookDepart.getFirstCost());
											out.println("$ " + String.format("%.2f", 0.5*child*(bookDepart.getFirstCost())));
										}
									}
								out.println("</td>");
							out.println("</tr>");
							
						}
						
						out.println("<tr>");
							out.println("<td>Total:</td>");
							out.println("<td>$ " + String.format("%.2f", totalCost) + "</td>");
						out.println("</tr>");
						
						session.setAttribute("totalCost", totalCost);
						
						out.println("</table>");
				
				%>
								
				<br>
				<h5>Credit Card Details</h5>
				
				<table class="passenger">
				
					<tr>
						<td>Card Type:</td>
						<td>
							<select name="cardType" required>
							<option value="Visa">Visa</option>
							<option value="Mastercard">Mastercard</option>
							</select>
						</td>
					</tr>
				
					<tr>
						<td>Card Number:</td>
						<td><input type="text" name="cardNo"  pattern='^[45]\d{15}$' required></td>
					</tr>
					
					<tr>
						<td>Expiry:</td>
						<td>
						
							<select name="cardExpiryMonth" required>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							</select>
							
							<select name="cardExpiryYear" required>
							<%
								for (int i = 2014; i < 2100; i++) {
									out.println("<option value='" + i + "'>" + i + "</option>");
								}
							%>
							</select>
							
						
						</td>
					</tr>
					
					<tr>
						<td>Card Security Code:</td>
						<td><input type="text" name="CSC" pattern="^\d{3}$" required></td>
					</tr>
				
				</table>
				
				<br>
				<input type="submit" value="Checkout">
				
				<%} else {
						out.println("-");
					}%>
			
			</article>
			<!-- Main content END -->
			</form>
			
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