<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ilms.model.User"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	background: rgb(219, 226, 226);
}

.btn1 {
	border: none;
	outline: none;
	height: 50px;
	width: 100%;
	background-color: black;
	color: white;
	border-radius: 4px;
	font-weight: bold;
}

.btn1:hover {
	background: white;
	border: 1px solid;
	color: black;
}

.row {
	background: white;
	border-radius: 30px;
	box-shadow: 12px 12px 22px grey;
	margin-top: 70px;
}
</style>
<%!String name = "";
	   String email = "";
	   String mobile = "";
	   String address = "";
	  %>
	<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	User instantUser = (User)session.getAttribute("user");
	if(instantUser != null)
	{
	name = instantUser.getUserName();
	email = instantUser.getEmailAddress();
	mobile = instantUser.getMobileNumber();
	address = instantUser.getPostalAddress();
	}
	else
	{
	response.sendRedirect("login.jsp");
	}
	%>

</head>
<body>
  
   <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="home.jsp" ><h1 class="font-weight-bold py-3">LIBRARY MANAGEMENT SYSTEM</h1></a>
  
   </nav>

   <section class="Form my-4 mx-5">
     <div class="container" >
          <div class="d-flex justify-content-center mt-5">
				
            <form class="row" action="#" method="post">
                          
                             <h1 style="justify-content:center">UPDATE INFO</h1>
						
						<div class="form-row col-lg-11 my-3">
							<div class="form-group col-lg-6 ">
								<label for="inputAddress2">Name</label> <input type="text"
								name="userName" class="form-control" id="inputAddress2"
								placeholder=<%=name %> >
							</div>
							<div class="form-group col-lg-6 ">
								<label for="inputEmail4">Mobile Number</label> <input type="tel"
									name="userMobileNumber" class="form-control" id="inputMobile"
									placeholder=<%=mobile %> >
							</div>
						</div>
						
						<div class="form-row col-lg-11 my-3">
							<div class="form-group col-lg-6 ">
								<label for="inputEmail4">Email</label> <input type="email"
									name="userMailId" class="form-control" id="inputEmail4"
									placeholder=<%=email %> >
							</div>
							<div class="form-group col-lg-6 ">
								<label for="inputEmail4">Password</label> <input type="password"
									name="userOldPassword" class="form-control" id="inputEmail4"
									placeholder="***********" required>
							</div>
						</div>



						<div class="form-row col-lg-11 my-3">
							<div class="form-group col-lg-6 ">
								<label for="inputEmail4">New Password</label> <input type="password"
									name="userNewPassword" class="form-control" id="inputEmail4"
									placeholder="***********" required>
							</div>
							<div class="form-group col-lg-5">
								<label for="inputPassword4">Re-type New Password</label> <input
									type="password" name="retypedNewPassword" class="form-control"
									id="inputPassword4" placeholder="***********" required>
							</div>
						</div>


						<div class="form-group col-lg-11 my-3">
							<label for="exampleFormControlTextarea1">Address</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3" name="postalAddress"
								placeholder=<%=address %> ></textarea>
						</div>


						<div class="form-row col-lg-11 my-5">
							<div class="form-group col-lg-6 ">
								<button type="submit" class="btn1">Update</button>
							</div>
							<div class="form-group col-lg-6 ">
								<button type="reset" class="btn1">Reset</button>
							</div>
						</div>

					</form>
          
				</div>
     </div>
   </section>

     
</body>
</html>