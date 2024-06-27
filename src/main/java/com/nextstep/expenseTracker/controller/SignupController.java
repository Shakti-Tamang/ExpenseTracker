package com.nextstep.expenseTracker.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nextstep.expenseTracker.service1.User;
import com.nextstep.expenseTracker.service1.userImpl;
import com.nextstep.expensetarcker.model.UserModel;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/SignupController")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		User user=new userImpl();
		
		String name=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String confirmPassword=request.getParameter("confirm_password");
		
		System.out.println(name);
		System.out.println(email);
		System.out.println(password);
		System.out.println(confirmPassword);
		
		UserModel model=new UserModel();
		
		model.setName(name);
		model.setEmail(email);
		model.setPassword(password);
		model.setConfirmpassword(confirmPassword);
		


	    // Check if the email already exists
	    boolean found = user.found(email);
	    
	    if (found) {
	        // If email already exists, set an error message and forward to the signup page
	        request.setAttribute("message", "Invalid credentials. Email already exists. Please provide a new email.");
	        RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
	        rd.forward(request, response);
	       
	    } else {
	        // If email does not exist, save user details and forward to the login page
	        user.saveUserDetails(model);
	        response.sendRedirect("Login.jsp"); // Using sendRedirect instead of RequestDispatcher
	    }
	}
}
