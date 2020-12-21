<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page isELIgnored="false" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<title>User Login Page</title>
<style>
   *{
     padding:0;
     margin:0;
     box-sizing:border-box;
   }
   
   body{
     background:rgb(219,226,226);
   }
   
   .row{
     background: white;
     border-radius:30px;
     box-shadow:12px 12px 22px grey;
     margin-top:70px;
     
   }
   
   img{
    border-top-left-radius:30px;
    border-bottom-left-radius:30px;
    
   }
   .btn1{
    border:none;
    outline:none;
    height: 50px;
    width:100%;
    background-color:black;
    color:white;
    border-radius:4px;
    font-weight:bold;
   }
   .btn1:hover{
      background: white;
      border: 1px solid;
      color:black;
    }
    
  h1{
 text-align:center;
}
    
</style>
</head>
<body>
  <%!
    String statusMessage=null;
  %>
  
  <%
    statusMessage = (String)session.getAttribute("loginStatusMessage");
    
  %>
    
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#" ><h1 class="font-weight-bold py-3">LIBRARY MANAGEMENT SYSTEM</h1></a>
  
   </nav>
    
    <section class="Form my-4 mx-5">
     <div class="container">
       <div class="row no-gutters">
         <div class="col-lg-5">
           <img src="../images/library3.jpg" class="img-fluid" alt="">
         </div>
         <div class="col-lg-7 pl-5 pt-10"  id="divForForm">
            
            
            <h1 class="font-weight-bold col-lg-8 pt-4 pb-3">Login </h1>
             <form action="../../login" method="post">
                <div class="form-row col-lg-11 my-3">
                  <div class="col-lg-10" >
                    <input type="email" name="email" placeholder ="Enter email" class="form-control px-4 py-2" required>
                  </div>
                </div>
                <div class="form-row col-lg-11 my-3">
                  <div class="col-lg-10">
                    <input type="password" name="password" placeholder ="Enter Password" class="form-control my-3 px-4 py-2"  required>
                  </div>
                </div>
                <div class="form-row col-lg-11 ">
                  <div class="col-lg-10">
                    <input type="submit"  class="btn1 mt-3 mb-5" value="Login">
                  </div>
                </div>
                <div class="col-lg-11 my-2">
                  <a href="#">Forgot Password</a>
                </div>
                <div class="col-lg-11">
                <p>Don't have an account? <a href="userRegister.jsp">Register here</a></p>
                </div>
             </form>
         </div>
       </div>
     </div>
    </section>
      <c:set var="message" value="<%= statusMessage %>" scope="session"></c:set>

     <c:if test = "${message == 'Enter valid Password' }">
        <script type="text/javascript"> alert("Enter valid Password!")</script>
     </c:if>
     
      <c:if test = "${message == 'Login failed. Try again' }">
        <script type="text/javascript"> alert("Wrong  credentials ")</script>
     </c:if>
     
     <c:if test = "${message == 'User registered Successfully!' }">
        <script type="text/javascript"> alert("User registered Successfully!")</script>
     </c:if>
    
    
</body>
</html>