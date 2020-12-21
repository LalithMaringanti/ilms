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


@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String emailId="";   
    private String password="";
    
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		emailId = request.getParameter("email");
		password  = request.getParameter("password");
		
		try 
		{
			ApplicationDAO dao = new ApplicationDAO();
			User user = dao.getUserByEmailAndPassword(emailId, password);
			HttpSession session = request.getSession();
			if(user!=null)
			{
				session.setAttribute("user", user);
				if(user.getRole().equals("admin"))
			    {
					response.sendRedirect("view/jsp/adminHome.jsp");
					
			    }
			    else
			    {
			    	response.sendRedirect("view/jsp/home.jsp");
			    	
			    }
				
				
			}
			else
			{
				session.setAttribute("loginStatusMessage", "Login failed. Try again");
				response.sendRedirect("view/jsp/login.jsp");
			}
			
		}
		catch (ClassNotFoundException | SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
