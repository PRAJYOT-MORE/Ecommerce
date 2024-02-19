<%@include file="admin/authentication/admin-authentication.jsp" %>

<%
	String status = request.getParameter("status");
	if(status != null){
		session.removeAttribute("token");
		session.setAttribute("msg", "Logged out successfully!");
		response.sendRedirect("adminlogin.jsp");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">


    <title>Admin Tasks</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/admintasks.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
 
  <div class="container mt-5 pt-4">
    
    <h3 style="text-align: center;"> </h3>
        
    
        
        <h1 style="text-align: center; color: #7fad39" class="title mb-4">ADMIN PANEL</h1>
        <br><br>
      	
        <div class="row">
        
        	<div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                    
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">insert</span>
                        <h5>Add Department</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="add-department.jsp" class="btn btn-success">Add Department</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                    
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">delete</span>
                        <h5>Remove Department</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="remove-department.jsp" class="btn btn-danger">Remove Department</a>
                        </div>
                    </div>
                </div>
            </div>
         
         	<div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                    
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">read</span>
                        <h5>Order History</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="orderhistory.jsp" class="btn btn-dark">Order History</a>
                        </div>
                    </div>
                </div>
            </div>
         	
         	<div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                    
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">insert</span>
                        <h5>Add Category</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="add-category.jsp" class="btn btn-success">Add Category</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                    
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">delete</span>
                        <h5>Remove Category</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="remove-category.jsp" class="btn btn-danger">Remove Category</a>
                        </div>
                    </div>
                </div>
            </div>
         
         	<div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                    
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">read</span>
                        <h5>Check Order</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="order.jsp" class="btn btn-dark">Check Order</a>
                        </div>
                    </div>
                </div>
            </div>
         
         	<div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                    
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">insert</span>
                        <h5>Add Product</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="add-product.jsp" class="btn btn-success">Add Product</a>
                        </div>
                    </div>
                </div>
            </div>           
         
         	<div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                    
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">read</span>
                        <h5>Read Product</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="readproducts.jsp" class="btn btn-dark">Read Product</a>
                        </div>
                    </div>
                </div>
            </div>
         
            <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">read</span>
                        <h5>Contact List</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="read-contacts.jsp" class="btn btn-dark">Read Message</a>
                        </div>
                    </div>
                </div>
            </div> 
            
            <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                <div class="card border-0 bg-light rounded shadow">
                    <div class="card-body p-4">
                    
                        <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">visit</span>
                        <h5>Visit Main Website</h5>
                        <div class="mt-3">
                            <span class="text-muted d-block"><i class="fa fa-home" aria-hidden="true"></i>Online Grocery</span>
                            <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"></i>
                                INDIA</span>
                        </div>
                        <div class="mt-3">
                            <a href="home.jsp" class="btn btn-info">Visit Website</a>
                        </div>
                    </div>
                </div>
            </div>
 
            
            <!-- A button to open the popup form -->
            
            <div style="text-align: center; padding-top: 50px;" class="mt-3">
            
            
            <button  class="open-button" onclick="openForm()">CHANGE CREDENTIALS</button>   
			
			<!-- The form -->
			<div class="form-popup" id="myForm">
			  <form action="changeadmincredentials" method="post" class="form-container">
			    <h1>CHANGE</h1>
			    
			    <label for="email"><b>New Username</b></label>
			    <input type="text" placeholder="Enter old username" name="newusername" required>
			
			    <label for="email"><b>Confirm New Username</b></label>
			    <input type="text" placeholder="Enter old password" name="confirmusername" required>
			
			    <label for="psw"><b>New Password</b></label>
			    <input type="password" placeholder="Enter Password" name="newpassword" required>
			    
			    <label for="psw"><b>Confirm New Password</b></label>
			    <input type="password" placeholder="Enter Confirm Password" name="confirmpassword" required>
			
			    <button type="submit" class="btn">Update</button>
			    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
			  </form>
			</div>
            
               <!--  <form action="Auth" method="post" >
                    <input type="hidden" name="check" value="logout" >
                    <button class="btn btn-primary" >LOGOUT</button>
                </form> -->
                
                 <a class="btn btn-primary" href="admintasks.jsp?status=logout">logout</a><br>
            </div>
        </div>
    </div>
    
     <script>
    
       function openForm() {
    	  document.getElementById("myForm").style.display = "block";
    	}

    	function closeForm() {
    	  document.getElementById("myForm").style.display = "none";
    	}
    
    </script>
   
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>  
    <script type="text/javascript">

    </script>

</body>
</html>
  
    



