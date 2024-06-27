package com.nextstep.expenseTracker.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

import com.nextstep.expenseTracker.service1.AccountImpl;
import com.nextstep.expenseTracker.service1.AccountT;
import com.nextstep.expensetarcker.model.AccountModel;

/**
 * Servlet implementation class Account
 */
@WebServlet("/Account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountT account=new AccountImpl();
		String accountName=request.getParameter("accountName");
		String accountType=request.getParameter("accountType");
		
		AccountModel model=new AccountModel();
		
		model.setAccountName(accountName);
		model.setAccountType(accountType);  
		
		account.saveAccount(model);
		response.sendRedirect("Accounts.jsp");
	}

}
