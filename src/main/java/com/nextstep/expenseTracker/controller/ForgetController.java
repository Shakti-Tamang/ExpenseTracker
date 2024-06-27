package com.nextstep.expenseTracker.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nextstep.expenseTracker.service1.User;
import com.nextstep.expenseTracker.service1.userImpl;
import com.nextstep.expensetarcker.model.UserModel;

/**
 * Servlet implementation class ForgetController
 */
@WebServlet("/ForgetController")
public class ForgetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user=new userImpl();
	
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		UserModel model=new UserModel();
		model.setEmail(email);
		model.setPassword(password);
		
		user.updateUser(model);
		response.sendRedirect("Login.jsp");
		
	
	}

}
