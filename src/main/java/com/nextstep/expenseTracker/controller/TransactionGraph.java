package com.nextstep.expenseTracker.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.nextstep.expenseTracker.service1.Transactiontrack;
import com.nextstep.expenseTracker.service1.TransactiontrackImpl;
import com.nextstep.expensetarcker.model.TransactiontrackModel;

/**
 * Servlet implementation class TransactionGraph
 */
@WebServlet("/TransactionGraph")
public class TransactionGraph extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Transactiontrack transactionService=new TransactiontrackImpl();
   
	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        List<TransactiontrackModel> incomeList = transactionService.getIncome();
	        List<TransactiontrackModel> expenseList = transactionService.getExpense();
	        List<TransactiontrackModel> dateList = transactionService.getDate();

	        String jsonData = new Gson().toJson(new TransactionGraphData(incomeList, expenseList, dateList));

	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(jsonData);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }

	    private static class TransactionGraphData {
	        private List<TransactiontrackModel> incomeList;
	        private List<TransactiontrackModel> expenseList;
	        private List<TransactiontrackModel> dateList;

	        public TransactionGraphData(List<TransactiontrackModel> incomeList,
	        		List<TransactiontrackModel> expenseList, List<TransactiontrackModel> dateList) {
	            this.incomeList = incomeList;
	            this.expenseList = expenseList;
	            this.dateList = dateList;
	        }
	    }
	}