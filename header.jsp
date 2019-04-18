<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>FoodOrdering | Home</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Snacks Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>

	<!-- for veg and nonveg result-->
	<script type="text/javascript">
		function rm(id)
		{
			id.submit();
		}
	</script>
	<!--// Meta tag Keywords -->

	<!-- Custom-Files -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Bootstrap-Core-CSS -->
	<link rel="stylesheet" href="css/smoothbox.css" type='text/css' media="all" />
	<!-- gallery light box -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //Custom-Files -->

	<!-- Web-Fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext"
	    rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=latin-ext"
	    rel="stylesheet">
	<!-- //Web-Fonts -->
	<link rel="shortcut icon" href="images/favicon.png"/>

</head>	

<body>
	<!-- header -->
	<header  id="home" style="background-color: rgb(120,50,20);">
		<nav class="navbar navbar-expand-lg navbar-light py-4">
			<div class="container">
				<h1>
					<a class="navbar-brand" href="index.jsp">
						<i class="fas fa-utensils"></i>FoodOrdering
					</a>
				</h1>
				<button class="navbar-toggler ml-md-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
				    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">

					<ul class="navbar-nav mx-auto text-center">
						<li class="nav-item active">
							<a class="nav-link" href="index.jsp">Home
								<span class="sr-only">(current)</span>
							</a>
						</li>
						
						<%
						String s=(String)session.getAttribute("user");
						if(s==null)
						s=""; 
						if(s.equals("customer") || session.getAttribute("user")==null){%>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
							    aria-haspopup="true" aria-expanded="false">
								Restaurant
							</a>
							<div class="dropdown-menu text-lg-left text-center" aria-labelledby="navbarDropdown">
								<form action="restaurent.jsp" onclick="javascript:rm(this)">
									<input type="hidden" name="type" value="veg">
									<a class="dropdown-item" style="cursor: pointer;">Veg Only</a>
								</form>
								<form action="restaurent.jsp" onclick="javascript:rm(this)">
									<input type="hidden" name="type" value="non-veg">
									<a class="dropdown-item" style="cursor: pointer;">Non-Veg</a>
								</form>
							</div>
						</li>
						<%}%>
						
											</ul>
					
					<%-- alert when user entered wrong password--%>
					<% if(session.getAttribute("logout")!=null) { %>
					<script>
					alert("Invalid email or password");
				    </script>
					<% session.removeAttribute("logout");} %>
					<%-- alert close --%>


					<%-- alert when user entered wrong password--%>
					<% if(session.getAttribute("register")!=null) { %>
					<script>
					alert("Registration succesful !");
				    </script>
					<% session.removeAttribute("register");} %>
					<%-- alert close --%>


					<% if(session.getAttribute("email")==null) {%>
					<div class='forms-w3ls-agilesm text-center mt-lg-0 mt-4'>
						<ul>
							<li class='login-list-w3ls d-inline border-right pr-3 mr-3'>
								<a href='#' class='text-white' data-toggle='modal' data-target='#exampleModalCenter1'>Login</a>
							</li>
							<li class='login-list-w3ls d-inline'>
								<a href='#' class='text-white' data-toggle='modal' data-target='#exampleModalCenter2'>Register</a>
							</li>
						</ul>
					</div>
					<%} else 
					  { String path=(String)session.getAttribute("path"); %>
					
					  <!-- Menu -->
					  <ul class="navbar-nav mx-auto text-center">
					  	<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
							    aria-haspopup="true" aria-expanded="false">
								<table><tr><td><img src="<%=path%>" style="width: 40px;height: 40px"></td><td><%= session.getAttribute("name")%></td></tr></table>
							</a>
							<div class="dropdown-menu text-lg-left text-center" aria-labelledby="navbarDropdown">
								<a class="dropdown-item " href="profile.jsp">Profile</a>
								<% if(session.getAttribute("user").equals("customer")){%>
								<a class="dropdown-item " href="orderhistory.jsp">OrderHistory</a>
								<a class="dropdown-item " href="deliveryaddress.jsp">Delivery address</a>
								<%}else{%>
								<a class="dropdown-item " href="restaurent_registration.jsp">Your Restaurent</a>
								<a class="dropdown-item " href="restaurent_menu.jsp">Restaurent Menu</a>
								<a class="dropdown-item " href="recived_order.jsp">Recived Order</a>
								<%}%>
								<div class="dropdown-divider"></div>
								<form action="logout" method="post"><a class="dropdown-item"><button class="btn btn-danger">Logout</button></a></form>
							</div>
						</li>
					  </ul>




					<%}%>
					
				</div>
			</div>
		</nav>
	</header>

		<!-- login -->
	<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="login px-sm-4 mx-auto mw-100">
						<h5 class="text-center mb-4">Login Now</h5>
						<form action="/foodordering/login" method="post">
				
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" name="email" placeholder="Enter your email" required="">
							</div>
							
							<div class="form-group">
								<label class="mb-2">Password</label>
								<input type="password" class="form-control" name="password" placeholder="Enter password" required="">
							</div>
							<br>
							<div class="form-group">
								<label>Who are You</label><br>
								Customer&nbsp;<input type="radio" class="mb-2" name="user" id="user" value="customer" checked required="">
								&nbsp;&nbsp;Restaurant manager&nbsp;<input type="radio" class="" name="user" id="user" value="restaurent" required="">
							</div>
							
							<button type="submit" class="btn btn-primary submit mb-4">Login</button>
							
							<p class="text-center pb-4 create-w3ls">
								Don't have an account?
								<a href="#" data-toggle="modal" data-target="#exampleModalCenter2">Create one now</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	<!-- register -->
	<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="login px-sm-4 mx-auto mw-100">
						<h5 class="text-center mb-4">Register Now</h5>
						<form action="/foodordering/register" method="POST" enctype="multipart/form-data">
							<div class="form-group">
								<label>Your Name</label>
								<input type="text" class="form-control" name="name" placeholder="Enter your fullname" required="">
							</div>
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" name="email" placeholder="Enter your email" required="">
							</div>

							<div class="form-group">
								<label>Mobile No.</label>
								<input type="tel" class="form-control" name="phone" placeholder="Enter your mobile number" required="">
							</div>

							<div class="">
								<label>Display pic.</label>
								<input type="file" class="form-control" name="fileToUpload" >
								<p style="color: red">*Note : allowed only png and jpg/jpeg format</p>
							</div>

							
							<div class="form-group">
								<label>Gender</label><br>
								Male&nbsp;<input type="radio" class="" name="gender" id="gender" value="male" checked required="">
								&nbsp;&nbsp; Female&nbsp;<input type="radio" class="" name="gender" id="gender" value="female" required="">
							</div>

							<div class="form-group">
								<label class="mb-2">Password</label>
								<input type="password" class="form-control" name="password" id="password1" placeholder="Enter password"required="">
							</div>
							<div class="form-group">
								<label>Confirm Password</label>
								<input type="password" class="form-control" name="password" id="password2" placeholder="Re-enter password" required="">
							</div>
							
							<div class="form-group">
								<label>Who are You</label><br>
								Customer&nbsp;<input type="radio" class="" name="user" id="user" value="customer" checked required="">
								&nbsp;&nbsp; Restaurant manager&nbsp;<input type="radio" class="" name="user" id="user" value="restaurant" required="">
							</div>
							
							<button type="submit" class="btn btn-primary submit mb-4">Register</button>
							<p class="text-center pb-4">
								<a href="#">By clicking Register, I agree to your terms</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //register -->
	<!-- //header -->
	
	

	