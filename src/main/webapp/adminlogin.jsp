<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">


<title>Admin Login</title>   
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/admin-login.css" rel="stylesheet" >
</head>
<body>
	<div id="main-wrapper" class="container">
		<div class="row justify-content-center">
			<div class="col-xl-10">
				<div class="card border-0">
					<div class="card-body p-0">
						<div class="row no-gutters">
							<div class="col-lg-6">
								<div class="p-5">
									<div class="mb-5">
										<h3 class="h4 font-weight-bold text-theme">Admin Login</h3>
										<h3 style="color: red;" > <%@include file="messagebox/message.jsp" %> </h3>
									</div>
									<h6 class="h5 mb-0">Welcome back!</h6>
									<p class="text-muted mt-2 mb-5">Enter your username and password to access the admin panel.</p>
										
									<form action="adminlogin" method="post">
										<div class="form-group">
											<label for="exampleInputUsername1">Username</label> 
						<input name="username" type="text" class="form-control" id="exampleInputUsername1" required="required">
										</div>
										<div class="form-group mb-5">
											<label for="exampleInputPassword1">Password</label> 
						<input name="password" type="password" class="form-control" id="exampleInputPassword1" required="required">
										</div>
										<button type="submit" class="btn btn-theme">Login</button>
									</form>
								</div>
							</div>
							<div class="col-lg-6 d-none d-lg-inline-block">
								<div class="account-block rounded-right">
									<div class="overlay rounded-right"></div>
									<div class="account-testimonial">
									   
										<h4 class="text-white mb-4">Online Grocery</h4>
										<p class="lead text-white">"We believe in delivering not just groceries but smiles to your doorstep."</p>
										<p>- online grocery</p>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>

	</div>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>
     