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
import com.nextstep.expenseTracker.service1.Category;
import com.nextstep.expenseTracker.service1.CategoryImpl;
import com.nextstep.expensetarcker.model.CategoryModel;

/**
 * Servlet implementation class Catagory
 */
@WebServlet("/Catagory")
public class Catagory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Category List=new CategoryImpl();
	   protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	      
	        String action = request.getParameter("action");

	        if (action.equalsIgnoreCase("CategoryIncome")) {
	            List<CategoryModel> list =List.DiplayCategoryIncome();
	            sendJsonResponse(response, list);
	            return;
	        } else if (action.equalsIgnoreCase("CategoryExpenses")) {
	            List<CategoryModel> list = List.DiplayCategoryExpenses();
	            sendJsonResponse(response, list);
	            return;
	        }

	        // handle other actions if needed...
	        else if (action.equalsIgnoreCase("delete")) { // Add this condition
	            int id = Integer.parseInt(request.getParameter("id"));
	            List.deleteById(id);
	            String categoryType = request.getParameter("categoryType"); // Get categoryType parameter
	            List<CategoryModel> list = null;
	            if (categoryType.equalsIgnoreCase("Income")) {
	                list = List.DiplayCategoryIncome();
	            } else if (categoryType.equalsIgnoreCase("Expenses")) {
	                list = List.DiplayCategoryExpenses();
	            }
	            SendJsonResponse(response, list);
	            return;
	        
	        }
	        

	        if (action.equalsIgnoreCase("getCategories")) {
	            String type = request.getParameter("type");
	            List<CategoryModel> categories = List.displayByCatagory(type);
	            sendJsonResponse1(response, categories);
	            return;
	               
	        }
	    }
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		String type=request.getParameter("categoryType");
		System.out.println(type);
		String catagory=request.getParameter("newCategory");
		
		CategoryModel model=new CategoryModel();
		model.setType(type);
		model.setCategory(catagory);
	
		List.saveCategory(model);
	}
	  private void sendJsonResponse(HttpServletResponse response, List<CategoryModel> list) throws IOException {
	        Gson gson = new Gson();
	        String json = gson.toJson(list);
	        response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        out.print(json);
	        out.flush();
	    }

private void SendJsonResponse(HttpServletResponse response, List<CategoryModel> list) throws IOException {
    Gson gson = new Gson();
    String json = gson.toJson(list);
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    out.print(json);
    out.flush();
}
private void sendJsonResponse1(HttpServletResponse response, List<CategoryModel> list) throws IOException {
    Gson gson = new Gson();
    String json = gson.toJson(list);
    response.setContentType("application/json");
    PrintWriter out = response.getWriter();
    out.print(json);
    out.flush();
}

}
