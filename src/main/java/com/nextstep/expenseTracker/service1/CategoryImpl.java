package com.nextstep.expenseTracker.service1;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nextstep.expenseTracker.connection.DBConnection;
import com.nextstep.expensetarcker.model.CategoryModel;

public class CategoryImpl implements Category {

	PreparedStatement ps=null;
	@Override
	public void saveCategory(CategoryModel model) {
		String sql="insert into categories(type,category)values(?,?)";
		try {
		ps=DBConnection.getConnection().prepareStatement(sql);
		 String type = model.getType();
	        if (!type.equals("Income") && !type.equals("Expenses")) {
	            throw new IllegalArgumentException("Invalid 'type' value. It must be either 'Income' or 'Expenses'.");
	        }
		ps.setString(1, model.getType());
		ps.setString(2, model.getCategory());
		ps.executeUpdate();
		 System.out.println("Category saved successfully.");
		}
		catch(Exception ex) {
			  System.out.println("Error saving category: " + ex.getMessage());
		        ex.printStackTrace(); // Log the full stack trace for debugging
		}
	}
	@Override
	public List<CategoryModel> DiplayCategoryIncome() {
		ArrayList<CategoryModel>list=new ArrayList<CategoryModel>();
		
		String sql="select * from categories where type='Income'";
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				CategoryModel model=new CategoryModel();
				model.setId(rs.getInt("id"));
				model.setCategory(rs.getString("category"));
				list.add(model);
			}
		}
		catch (Exception ex) {
			System.out.println(ex);
		}
		return list;
		
	}
	@Override
	public List<CategoryModel> DiplayCategoryExpenses() {
	ArrayList<CategoryModel>list=new ArrayList<CategoryModel>();
		
		String sql="select * from categories where type='Expenses'";
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				CategoryModel model=new CategoryModel();
				model.setId(rs.getInt("id"));
				model.setCategory(rs.getString("category"));
				list.add(model);
			}
		}
		catch (Exception ex) {
			System.out.println(ex);
		}
		return list;
		
	}
	@Override
	public void deleteById(int id) {
	String sql="delete from categories where id=?";
	try {
		ps=DBConnection.getConnection().prepareStatement(sql);
		ps.setInt(1, id);
		ps.executeUpdate();
		
	}
	catch(Exception ex) {
		System.out.println(ex);
	}
		
	}
	@Override
	public List<CategoryModel> displayByCatagory(String typo) {
		ArrayList<CategoryModel>list=new ArrayList<CategoryModel>();
		
		String sql="select * from categories where type=?";
		try {
		ps=DBConnection.getConnection().prepareStatement(sql);
		ps.setString(1,typo);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			CategoryModel model=new CategoryModel();
			model.setCategory(rs.getString("category"));
			list.add(model);
		}
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
		
	}
	

}
