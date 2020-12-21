<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>


<title>User Registration Page</title>

<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	background: rgb(219, 226, 226);
}

.row {
	background: white;
	border-radius: 30px;
	box-shadow: 12px 12px 22px grey;
	margin-top: 70px;
}

img {
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
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

h1 {
	text-align: center;
}
</style>

</head>
<body>

	<%!String statusMessage = null;%>

	<%
		statusMessage = (String) session.getAttribute("registrationStatusMessage");
	%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="#"><h1 class="font-weight-bold py-3">LIBRARY
				MANAGEMENT SYSTEM</h1></a>

	</nav>

	<section class="Form my-4 mx-5">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-lg-5">
					<img src="../images/library1.jpg" class="img-fluid" alt="">
				</div>
				<div class="col-lg-7 pl-5 pt-10" id="divForForm">


					<h1 class="font-weight-bold pt-5 pb-3">Registration</h1>
					<form action="../../register" method="post">
						<div class="form-group col-lg-11 my-3">
							<label for="inputAddress2">Name</label> <input type="text"
								name="userName" class="form-control" id="inputAddress2"
								placeholder="Enter your full name" required>
						</div>
						<div class="form-row col-lg-11 my-3">
							<div class="form-group col-lg-6 ">
								<label for="inputEmail4">Email</label> <input type="email"
									name="userMailId" class="form-control" id="inputEmail4"
									placeholder="example@domain.com" required>
							</div>
							<div class="form-group col-lg-6 ">
								<label for="inputEmail4">Mobile Number</label> <input type="tel"
									name="userMobileNumber" class="form-control" id="inputMobile"
									placeholder="10-digit mobile number" required>
							</div>
						</div>



						<div class="form-row col-lg-11 my-3">
							<div class="form-group col-lg-6 ">
								<label for="inputEmail4">Password</label> <input type="password"
									name="userPassword" class="form-control" id="inputEmail4"
									placeholder="***********" required>
							</div>
							<div class="form-group col-lg-5">
								<label for="inputPassword4">Re-type Password</label> <input
									type="password" name="retypedPassword" class="form-control"
									id="inputPassword4" placeholder="***********" required>
							</div>
						</div>


						<div class="form-group col-lg-11 my-3">
							<label for="exampleFormControlTextarea1">Address</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="3" name="postalAddress"
								placeholder="Enter your postal address" required></textarea>
						</div>


						<div class="form-row col-lg-11 mt-5">
							<div class="form-group col-lg-6 ">
								<button type="submit" class="btn1">Register</button>
							</div>
							<div class="form-group col-lg-6 ">
								<button type="reset" class="btn1">Reset</button>
							</div>
						</div>
						<div class="col-lg-11">
							<p>
								Already have an account? <a href="login.jsp">Login here</a>
							</p>
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>

	<c:set var="message" value="<%=statusMessage%>" scope="session"></c:set>


	<c:choose>
		<c:when test="${message == 'EmailId error' }">
			<script type="text/javascript">
				alert("valid Email Address")
			</script>
		</c:when>
		<c:when test="${message == 'Mobile error' }">
			<script type="text/javascript">
				alert("Please enter valid mobile number" + "\n"
						+ "10-digit mobile number")
			</script>
		</c:when>
		<c:when test="${message == 'Password error' }">
			<script type="text/javascript">
				alert("Please enter valid password - Password Should contain :"
						+ "\n" + "1-Atleast 8 characters" + "\n"
						+ "2-Atleast one lower case alphabet" + "\n"
						+ "3-Atleast one upper case alphabet " + "\n"
						+ "4-Atleast one digit" + "\n"
						+ "5-Atleast one special character like [@#$%^&+=]"
						+ "\n" + "6-No White Spaces alllowed")
			</script>
		</c:when>

		<c:when test="${message == 'Password mismatch error' }">
			<script type="text/javascript">
				alert("Both-Password and retyped Password must have same values")
			</script>
		</c:when>
		<c:when test="${message == 'User Exists' }">
			<script type="text/javascript">
				alert("User already existed with given email-Id and password")
			</script>
		</c:when>

		<c:when test="${message == 'Registration Failed' }">
			<script type="text/javascript">
				alert("Registration Failed: Please try again after some time")
			</script>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>

</body>
</html>