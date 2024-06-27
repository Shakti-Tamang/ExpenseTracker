package com.nextstep.expenseTracker.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.nextstep.expenseTracker.service1.Budget1;
import com.nextstep.expenseTracker.service1.BudgetImpl;
import com.nextstep.expensetarcker.model.BudgetModel;

@WebServlet("/BudgetController")
public class BudgetController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Budget1 budget = new BudgetImpl();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch budget data
        List<BudgetModel> budgetList = budget.Display();

        // Convert list to JSON
        Gson gson = new Gson();
        String json = gson.toJson(budgetList);

        // Send JSON response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String accountName = request.getParameter("account");
        String amountString = request.getParameter("category-amount");
        double amount = Double.parseDouble(amountString);
               
        
        // Create a BudgetModel object
        BudgetModel model = new BudgetModel();
        model.setAccountName(accountName);
        model.setAmount(amount);

        // Save budget data using BudgetImpl
        budget.saveBudget(model);

        // Redirect back to the JSP page
        response.sendRedirect("Budget.jsp");
    }
}

