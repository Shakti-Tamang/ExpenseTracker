package com.nextstep.expenseTracker.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nextstep.expenseTracker.service1.Budget1;
import com.nextstep.expenseTracker.service1.BudgetImpl;
import com.nextstep.expenseTracker.service1.Transactiontrack;
import com.nextstep.expenseTracker.service1.TransactiontrackImpl;
import com.nextstep.expensetarcker.model.BudgetModel;
import com.nextstep.expensetarcker.model.TransactiontrackModel;

/**
 * Servlet implementation class Transaction
 */
@WebServlet("/Transaction")
public class Transaction extends HttpServlet {
	Transactiontrack track=new TransactiontrackImpl();
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Budget1 budget=new BudgetImpl();
		
		
		String type=request.getParameter("type");
		String account=request.getParameter("account");
		String Category=request.getParameter("category");
		String note=request.getParameter("note");
		double amount=Double.parseDouble(request.getParameter("amount"));
		String Date=request.getParameter("date");
		
		TransactiontrackModel model=new TransactiontrackModel();
		model.setType(type);
		model.setAccount(account);
		model.setCategory(Category);
		model.setNote(note);
		model.setAmount(amount);
		model.setDate(Date);
		
		
//		for case of adding or decreasing amunt during traction in budget section
		BudgetModel budgetModel=new BudgetModel();
		if(type.equalsIgnoreCase("income")) {
			
			budgetModel.setAccountName(account);
			budgetModel.setAmount(amount);
			budget.IncreaseInBudget(budgetModel);
			  request.setAttribute("key", " amount is successfully added to account");
			
		}
		else if(type.equals("Expenses")) {
			
			budgetModel.setAccountName(account);
			budgetModel.setAmount(amount);
			budget.decreaseInBudget(budgetModel);
			  request.setAttribute("key", " amount is successfully withdrawn from account");
			
		
		}
	
		
		track.saveTransaction(model);
		 double incomeAmount=track.totalIncome();
		    System.out.println(incomeAmount);
		    double expenseAmount=track.totalExpense();
		    System.out.println(expenseAmount);

		 // Set attributes in session scope
		 HttpSession session = request.getSession();
		 session.setAttribute("key1", incomeAmount);
		 session.setAttribute("key2", expenseAmount);
		  RequestDispatcher dispatcher = request.getRequestDispatcher("Budget.jsp");
		    dispatcher.forward(request, response);
		    
		 
		    
		   
		
	}

}
