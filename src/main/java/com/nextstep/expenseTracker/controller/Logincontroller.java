package com.nextstep.expenseTracker.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nextstep.expenseTracker.service1.User;
import com.nextstep.expenseTracker.service1.userImpl;
import com.nextstep.expensetarcker.model.UserModel;

/**
 * Servlet implementation class Logincontroller
 */
@WebServlet("/Logincontroller")
public class Logincontroller extends HttpServlet {
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
	
		String name=null;
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		System.out.println(email);
		System.out.println(password);
	 UserModel model=new UserModel();
	 model.setEmail(email);
	 model.setPassword(password);
	 
	 User user=new userImpl();
	 name=user.login(model);
	 System.out.println(name);
	 
	 
 
	 if(name==null || name.isEmpty()) {
		  request.setAttribute("message", "Email or password is incorrect"); // Set the error message here

	        RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp?error=1");
	       
	        
	        
	        
	        dispatcher.forward(request, response);
	        
		 
	 }
	 else {
		 
		 
		 HttpSession session = request.getSession();
         session.setAttribute("name", name);
         response.sendRedirect("Dashboard1.jsp");  // Ensure this matches your JSP file name correctly
		
	 }
	 
	}

}
