package com.ilms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/login")
public class LoginValidationFilter implements Filter {

	private String emailId = "";
	private String password = "";

	private String emailRegex = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9.-]+$";
	/*
	 * ^ matches the starting of the sentence.
	 * 
	 * [a-zA-Z0-9_.-] matches one character from the English alphabet (both cases),
	 * digits, “+”, “_”, “.” and, “-” before the @ symbol.
	 * 
	 * + indicates the repetition of the above-mentioned set of characters one or
	 * more times.
	 * 
	 * @ matches itself.
	 * 
	 * [a-zA-Z0-9.-] matches one character from the English alphabet (both cases),
	 * digits, “.” and “–” after the @ symbol.
	 * 
	 * $ indicates the end of the sentence.
	 */

	private String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&-+=()])(?=\\\\S+$).{8,20}$";
	/*
	 * ^ represents starting character of the string. (?=.*[0-9]) represents a digit
	 * must occur at least once. (?=.*[a-z]) represents a lower case alphabet must
	 * occur at least once. (?=.*[A-Z]) represents an upper case alphabet that must
	 * occur at least once. (?=.*[@#$%^&-+=()] represents a special character that
	 * must occur at least once. (?=\\S+$) white spaces don’t allowed in the entire
	 * string. .{8, 20} represents at least 8 characters and at most 20 characters.
	 * $ represents the end of the string.
	 **/

	/**
	 * Default constructor.
	 */
	public LoginValidationFilter() {

	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {

	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if ((request.getParameter("email") != null) && (request.getParameter("password") != null)) {
			emailId = request.getParameter("email");
			password = request.getParameter("password");

			HttpServletRequest httpServletRequest = (HttpServletRequest) request;
			HttpServletResponse httpServletResponse = (HttpServletResponse) response;
			HttpSession session = httpServletRequest.getSession();
			RequestDispatcher rd = httpServletRequest.getRequestDispatcher("view/jsp/login.jsp");

			if (emailId.matches(emailRegex)) {
				chain.doFilter(request, response);
			} else if (!(emailId.matches(emailRegex))) {
				session.setAttribute("loginStatusMessage", "Enter valid Email!");
				rd.forward(httpServletRequest, httpServletResponse);

			} else if (!(password.matches(passwordRegex))) {
				session.setAttribute("loginStatusMessage", "Enter valid Password");
				rd.forward(httpServletRequest, httpServletResponse);
			}

		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
