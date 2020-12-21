package com.ilms.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ilms.dao.ApplicationDAO;
import com.ilms.model.User;

@WebServlet("/register")
public class RegisterController extends HttpServlet 
{
	User registrationUser;
	ApplicationDAO dataAccessObject;
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			registrationUser = new User();
			dataAccessObject = new ApplicationDAO();
			registrationUser.setUserName(request.getParameter("userName"));
			registrationUser.setEmailAddress(request.getParameter("userMailId"));
			registrationUser.setMobileNumber(request.getParameter("userMobileNumber"));
			registrationUser.setPassword(request.getParameter("userPassword"));
			registrationUser.setRole("non-admin");
			registrationUser.setPostalAddress(request.getParameter("postalAddress"));
			HttpSession session = request.getSession();
			int registrationStatus = dataAccessObject.registerUser(registrationUser);
			if( registrationStatus == 1)
			{
				
				session.setAttribute("loginStatusMessage","User registered Successfully!");
				session.removeAttribute("registrationStatusMessage");
				response.sendRedirect("view/jsp/login.jsp");
			}
			else
			{  
				if(registrationStatus == -1)
					session.setAttribute("registrationStatusMessage", "User Exists");
				else
					session.setAttribute("registrationStatusMessage", "Registration Failed");
				response.sendRedirect("view/jsp/userRegister.jsp");
			}
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
     
		
	}

}
