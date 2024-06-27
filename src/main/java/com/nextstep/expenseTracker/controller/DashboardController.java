package com.nextstep.expenseTracker.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.nextstep.expenseTracker.service1.AccountImpl;
import com.nextstep.expenseTracker.service1.AccountT;
import com.nextstep.expenseTracker.service1.Budget1;
import com.nextstep.expenseTracker.service1.BudgetImpl;
import com.nextstep.expenseTracker.service1.Category;
import com.nextstep.expenseTracker.service1.CategoryImpl;
import com.nextstep.expenseTracker.service1.Transactiontrack;
import com.nextstep.expenseTracker.service1.TransactiontrackImpl;
import com.nextstep.expensetarcker.model.AccountModel;
import com.nextstep.expensetarcker.model.BudgetModel;
import com.nextstep.expensetarcker.model.CategoryModel;
import com.nextstep.expensetarcker.model.TransactiontrackModel;

/**
 * Servlet implementation class DashboardController
 */
@WebServlet("/DashboardController")
public class DashboardController extends HttpServlet {
	Transactiontrack transaction=new TransactiontrackImpl();
	
	Category category=new CategoryImpl();
	
	Budget1 budget=new BudgetImpl();
	private static final long serialVersionUID = 1L;
  AccountT account=new AccountImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	                
		String navigate="";
		
		String action=request.getParameter("action");
		
		
//		we can use case "Transaction": in case of switch caee; break must be there 
		if(action.equalsIgnoreCase("Transation")) {
			 navigate = "Incomeexpense.jsp";
			    List<AccountModel> list = account.displayData();
			    request.setAttribute("accounts", list); // Use "accounts" instead of "action"
		}
		else if(action.equalsIgnoreCase("Login")) {
			navigate="Login.jsp";
		}
		
		else if(action.equalsIgnoreCase("ForgetPassword")) {
			navigate="Forget.jsp";
		}
		else if(action.equalsIgnoreCase("Logout")) {
			navigate="Signup.jsp";
		}
		else if(action.equalsIgnoreCase("DashBoard")) {
			navigate="Dashboard1.jsp";
		}
     else if(action.equalsIgnoreCase("Records")) {
    	 navigate="Records.jsp";
    	 List<TransactiontrackModel>list=transaction.displayTrackByIncome();
    	 List<TransactiontrackModel>list1=transaction.displayTrackByExpense();
    	 request.setAttribute("record",list);
    	 request.setAttribute("expense",list1);
		}

    else if(action.equalsIgnoreCase("Budget")) {
    	navigate="Budget.jsp";
    	 List<AccountModel> list = account.displayData();
		    request.setAttribute("accounts", list); // Us "accounts" instead of "action"
		    
		   
      }

    else if(action.equalsIgnoreCase("Accounts")) {
    	navigate="Accounts.jsp";
    }
    else if(action.equalsIgnoreCase("Category")) {
    
   	 navigate="Category.jsp";
   	 
		}
    else if(action.equalsIgnoreCase("delete")) {
    	Transactiontrack track=new TransactiontrackImpl();
    	int id=Integer.parseInt(request.getParameter("id"));
    	track.deleteById(id);
    	 navigate="Records.jsp";
    	 List<TransactiontrackModel>list=transaction.displayTrackByIncome();
    	 List<TransactiontrackModel>list1=transaction.displayTrackByExpense();
    	 request.setAttribute("record",list);
    	 request.setAttribute("expense",list1);
    	
    	
    }
		
		RequestDispatcher rd=request.getRequestDispatcher(navigate);
		rd.forward(request, response);
	}



}
