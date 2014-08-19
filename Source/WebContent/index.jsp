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

		<title>SP Airlines | Home</title>

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
	
	<body class="home">
	
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
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="booking.jsp">Booking</a></li>
						<%=loginBtn%>
					</ul>
				</div>

			</div>
		</div>

		<!-- Header -->
		<header id="head">
			<div class="container">
				<div class="row">
					<h1 class="lead">SP Airlines</h1>
					<p class="tagline">Giving you the freedom of travel</p>
					<p><a class="btn btn-default btn-lg" href="#intro">Read More</a> 
					<a class="btn btn-action btn-lg" href="booking.jsp">Book Now!</a></p>
				</div>
			</div>
		</header>

		<!-- Intro -->
		<div id="intro" class="container text-center">
			<br> <br>
			<h2>Welcome to <strong>SP Airlines</strong>.</h2>
			<h3>
				We aim to extend your boundaries by making affordable and reliable travel possible.<br>
				Check out some of our destinations:
			</h3>
		</div>
		
		<!-- Cities (styled with Jumbotron for Bootstrap) -->
		<div class="jumbotron">
			<div class="container">
				<div class="row">

					<div class="col-md-4">
						<img class="colPic" src="images/cities/tokyo.jpg" alt="Tokyo">
						<div class="colName">
							<h4>Tokyo</h4>
						</div>
						<div class="colDesc">
							<p>From the busy <strong>Tsukiji Fish Market</strong>, to the scenic <strong>Mt. Fuji</strong>, and the famous <strong>Shibuya Crossing</strong>, the hustle and bustle of Tokyo's vibrant city life is sure to keep you entertained and occupied with sights and sounds that will create lasting memories.</p>
						</div>
					</div>

					<div class="col-md-4">
						<img class="colPic" src="images/cities/hongkong.jpg" alt="Hong Kong">
						<div class="colName">
							<h4>Hong Kong</h4>
						</div>
						<div class="colDesc">
							<p>With endless streets filled with sumptuous food and addictive shopping, you're sure to have a blast in Hong Kong! Bringing along the little ones? The <strong>Hong Kong Disneyland Resort</strong> will be a dream come true for your little princes and princesses alike!</p>
						</div>
					</div>

					<div class="col-md-4">
						<img class="colPic" src="images/cities/sf.jpg" alt="San Francisco">
						<div class="colName">
							<h4>San Francisco</h4>
						</div>
						<div class="colDesc">
							<p>World-famous sights like the <strong>Golden Gate Bridge</strong>, <strong>Alcatraz Island</strong> and <strong>Fisherman's Wharf</strong> will leave deep impressions in your heart. Get in touch with your creative side by visiting places like the <strong>Museum of Modern Art</strong> and the <strong>Fine Arts Museum of San Francisco</strong>.</p>
						</div>
					</div>
					
				</div>
			</div>
		</div>

		<!-- Showcase -->
		<div class="container">
			<br><br>
			<h2 class="text-center">Why <strong>SP Airlines</strong>?</h2>
			<br>
			<div class="row" id="bottom">

				<div class="col-md-4">
					<img class="colPic" src="images/showcase/comfort.jpg" alt="Comfort">
					<div class="colName">
						<h4>Comfort</h4>
					</div>
					<div class="colDesc">
						<p>Wider and fluffier seats, paired with the tastiest selection of food, our flight interiors are sure to make you feel right at home.</p>
					</div>
				</div>

				<div class="col-md-4">
					<img class="colPic" src="images/showcase/safety.jpg" alt="Safety">
					<div class="colName">
						<h4>Safety</h4>
					</div>
					<div class="colDesc">
						<p>Our aircrafts are checked daily for faults and undergo routine maintenance every week. Safety is our first priority!</p>
					</div>
				</div>

				<div class="col-md-4">
					<img class="colPic" src="images/showcase/afford.jpg" alt="Affordability">
					<div class="colName">
						<h4>Affordability</h4>
					</div>
					<div class="colDesc">
						<p>What's the point of having all these features if no one can afford it? Our prices are always kept competitive so that you'll always have the freedom of travel.</p>
					</div>
				</div>
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