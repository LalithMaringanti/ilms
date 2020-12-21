package com.ilms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/register")
public class RegistrationValidationFilter implements Filter {

	
	private String userMailId="";
	private String userPassword="";
	private String confirmPassword="";
	private String userMobileNumber="";
	
    /**
     * Default constructor. 
     */
    public RegistrationValidationFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse)response;
		HttpSession session = httpServletRequest.getSession();
		userMailId = request.getParameter("userMailId");
		userMobileNumber = request.getParameter("userMobileNumber");
		userPassword = request.getParameter("userPassword");
		confirmPassword = request.getParameter("retypedPassword");
		System.out.println("\n"+"pass : "+userPassword+"\n"+"Retyped pass :"+confirmPassword+" \n");
		
		if(!(validateUserMailId(userMailId)))
		{
			session.setAttribute("registrationStatusMessage", "EmailId error");
			httpServletResponse.sendRedirect("view/jsp/userRegister.jsp");
		}
		else if(!(validateUserMobileNumber(userMobileNumber)))
		{
			session.setAttribute("registrationStatusMessage", "Mobile error");
			httpServletResponse.sendRedirect("view/jsp/userRegister.jsp");
			
		}
		else if((validateUserPassword(userPassword,confirmPassword)) == 0)
		{
			session.setAttribute("registrationStatusMessage", "Password mismatch error");
			httpServletResponse.sendRedirect("view/jsp/userRegister.jsp");
		}
		else if((validateUserPassword(userPassword,confirmPassword)) == -1)
		{
			session.setAttribute("registrationStatusMessage", "Password error");
			httpServletResponse.sendRedirect("view/jsp/userRegister.jsp");
		}
		else
		{
			System.out.println("In do-filter");
			chain.doFilter(request, response);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	private boolean validateUserMailId(String emailId)
	{
		/*
		 *  ^ matches the starting of the sentence.

		[a-zA-Z0-9+_.-] matches one character from the English alphabet (both cases), digits, “+”, “_”, “.” and, “-” before the @ symbol.

		+ indicates the repetition of the above-mentioned set of characters one or more times.

		@ matches itself.

		[a-zA-Z0-9-] matches one character from the English alphabet (both cases), digits, “.” and “–” after the @ symbol.

        . indicates itself
        
		$ indicates the end of the sentence.
		 */
		String emailRegex = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9-]+.[a-zA-z]+$";
		if(emailId.matches(emailRegex))
			return true;
		return false;
	}
	
	private boolean validateUserMobileNumber(String mobileNumber)
	{
		/*
		 * ^     #Match the beginning of the string
		  [6-9]	 #Match a 6, 7, 8 or 9
			\d    #Match a digit (0-9 and anything else that is a "digit" in the regex engine)
			{9}   #Repeat the previous "\d" 9 times (9 digits)
			$     #Match the end of the string
		 */
		String mobileRegex = "^[6-9]\\d{9}$";
		if(mobileNumber.matches(mobileRegex))
			return true;
		return false;
	}
	
	private int validateUserPassword(String userPassword,String confirmPassword)
	{
		/*
		 * ^                 # start-of-string
(?=.*[0-9])       # a digit must occur at least once
(?=.*[a-z])       # a lower case letter must occur at least once
(?=.*[A-Z])       # an upper case letter must occur at least once
(?=.*[@#$%^&+=])  # a special character must occur at least once
(?=\S+$)          # no whitespace allowed in the entire string
.{8,}             # anything, at least eight places though
$                 # end-of-string
		 * */
		int resultInteger=1;
		String passwordRegex="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
		System.out.println("userPassword.equals(confirmPassword)  : "+(!userPassword.equals(confirmPassword)));
			if(!(userPassword.matches(passwordRegex)))
				resultInteger = -1;
			if(!userPassword.equals(confirmPassword))
				resultInteger = 0;
		
		return resultInteger;
	}

}
