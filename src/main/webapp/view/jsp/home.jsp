<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.ilms.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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

.vl {
	border-left: 6px solid grey;
	height: 900px;
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

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav-right {
  float: right;
}
</style>

<title>Home Page</title>



</head>
<body>
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
	 <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#" ><h1 class="font-weight-bold py-3">LIBRARY MANAGEMENT SYSTEM</h1></a>
  
   </nav>
	<div class="row no-gutters">
		<div class="col-lg-3">
			<div class="container ">
				<div class="d-flex justify-content-center mt-5">
					<img src="../images/user_avatar.png" class="rounded-circle" alt="">
				</div>
				<hr />

				<div class="d-flex justify-content-center mt-3">
					<h1>USER PROFILE</h1>
				</div>

				<div class="d-flex justify-content-center mt-5">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th scope="row">NAME</th>
								<td><%=name %></td>
							</tr>
							<tr>
								<th scope="row">EMAIL ID</th>
								<td><%=email %></td>
							</tr>
							<tr>
								<th scope="row">MOBILE NO.</th>
								<td><%=mobile %></td>
							</tr>
							<tr>
								<th scope="row">ADDRESS</th>
								<td><%=address %></td>
							</tr>
						</tbody>

					</table>
				</div>

				<div class="d-flex justify-content-center mt-5">
					<div class="form-group col-lg-6 ">
					     <form action="userInfoUpdation.jsp">
						<button type="submit" class="btn1">Update</button>
					</form>
						
					</div>


				</div>

				<div class="d-flex justify-content-center mt-2">
				  <div class="form-group col-lg-6 ">
				     <form action="../../logout">
						<input class="btn1" type="submit" value="Logout">
					</form>
				  </div>
					
				</div>

			</div>

		</div>
		<div class="vl col-lg-1"></div>
		<div class="col-lg-8">
			<div class="container row mt-5">
				<a href="#">
				<div class="d-flex justify-content-center mx-4 my-5">
					<figure>
						<img class="rounded-circle" src="../images/searchBook.png" alt="Trulli">
						<figcaption style="font-weight:bold;text-align:center;margin-top:20px">Find Book</figcaption>
					</figure>
				</div>
				</a>
				<a href="#">
				<div class="d-flex justify-content-center mx-4 my-5">
					<figure>
						<img class="rounded-circle" src="../images/requestBook.png" alt="Trulli">
						<figcaption style="font-weight:bold;text-align:center;margin-top:20px">Request for a Book</figcaption>
					</figure>
				</div>
				</a>
				<a href="#">
				<div class="d-flex justify-content-center mx-4 my-5">
					<figure>
						<img class="rounded-circle" src="../images/borrowedBookHistory.png" alt="Trulli">
						<figcaption style="font-weight:bold;text-align:center;margin-top:20px">My Books</figcaption>
					</figure>
				</div>
				</a>
				<a href="#">
				<div class="d-flex justify-content-center mx-4 my-5">
					<figure>
						<img  class="rounded-circle" src="../images/fineHistory.jpg" alt="Trulli">
						<figcaption style="font-weight:bold;text-align:center;margin-top:20px">Fines</figcaption>
					</figure>
				</div>
				</a>

			</div>
		</div>
	</div>




</body>
</html>