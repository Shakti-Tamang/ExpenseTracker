package com.nextstep.expenseTracker.service1;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nextstep.expenseTracker.connection.DBConnection;
import com.nextstep.expensetarcker.model.TransactiontrackModel;

public class TransactiontrackImpl implements Transactiontrack{

	PreparedStatement ps=null;
	@Override
	public void saveTransaction(TransactiontrackModel model) {
	String sql="insert into incomeexpense(type,account,category,note,Amount,submissiondate)values(?,?,?,?,?,?)";
	
	try {
		ps=DBConnection.getConnection().prepareStatement(sql);
		ps.setString(1, model.getType());
		ps.setString(2,model.getAccount());
		ps.setString(3, model.getCategory());
		ps.setString(4, model.getNote());
		ps.setDouble(5, model.getAmount());
		ps.setString(6, model.getDate());
		ps.executeUpdate();
	}
	catch(Exception ex) {
		System.out.println(ex);
	}
	}
	
	@Override
	public List<TransactiontrackModel> displayTrackByIncome() {
		ArrayList<TransactiontrackModel>list=new ArrayList<TransactiontrackModel>();
		
		String sql="select * from incomeexpense where type='Income' ORDER BY id DESC";
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			TransactiontrackModel model=new TransactiontrackModel();
			model.setId(rs.getInt("id"));
			model.setType(rs.getString("type"));
			model.setAccount(rs.getString("account"));
			model.setCategory(rs.getString("category"));
			model.setNote(rs.getString("note"));
			model.setAmount(rs.getDouble("Amount"));
			model.setDate(rs.getString("submissiondate"));
			list.add(model);
			}
			
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
		
		return list;
	}

	@Override
	public List<TransactiontrackModel> displayTrackByExpense() {
ArrayList<TransactiontrackModel>list=new ArrayList<TransactiontrackModel>();
		
		String sql="select * from incomeexpense where type='Expenses' ORDER BY id DESC";
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			TransactiontrackModel model=new TransactiontrackModel();
			model.setId(rs.getInt("id"));
			model.setType(rs.getString("type"));
			model.setAccount(rs.getString("account"));
			model.setCategory(rs.getString("category"));
			model.setNote(rs.getString("note"));
			model.setAmount(rs.getDouble("Amount"));
			model.setDate(rs.getString("submissiondate"));
			list.add(model);
			}
			
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
		
		return list;
	}

	@Override
	public List<TransactiontrackModel> getIncome() {
		ArrayList<TransactiontrackModel>list=new ArrayList<TransactiontrackModel>();
		String sql = "SELECT Amount FROM incomeexpense WHERE type='Income'";

		
		try {
		ps=DBConnection.getConnection().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			TransactiontrackModel model=new TransactiontrackModel();
			model.setAmount(rs.getDouble("Amount"));
			list.add(model);
		}
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}

	@Override
	public List<TransactiontrackModel> getExpense() {
ArrayList<TransactiontrackModel>list=new ArrayList<TransactiontrackModel>();
		
String sql = "SELECT Amount FROM incomeexpense WHERE type='Expenses' ";

		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				TransactiontrackModel model=new TransactiontrackModel();
				model.setAmount(rs.getDouble("Amount"));
				list.add(model);
			}
			}
			catch(Exception ex) {
				System.out.println(ex);
			}
		return list;
	}

	@Override
	public List<TransactiontrackModel> getDate() {
	    ArrayList<TransactiontrackModel> list = new ArrayList<>();
	    String sql = "SELECT DISTINCT submissiondate FROM incomeexpense ORDER BY submissiondate";
	    try {
	        ps = DBConnection.getConnection().prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            TransactiontrackModel model = new TransactiontrackModel();
	            model.setDate(rs.getString("submissiondate"));
	            list.add(model);
	        }
	    } catch (Exception ex) {
	        System.out.println(ex);
	    }
	    return list;
	}

	@Override
	public void deleteById(int id) {
		String sql="delete from incomeexpense where id=?";
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
	public double totalIncome() {
		
		 double totalIncome = 0;
		ArrayList<TransactiontrackModel>list=new ArrayList<TransactiontrackModel>();
		
		 String sql = "SELECT SUM(Amount) AS total_income FROM incomeexpense WHERE type ='Income'";
		 try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
			
				totalIncome=rs.getDouble("total_income");
	                    
				
			}
		 }
		 catch(Exception ex) {
			 System.out.println(ex);
		 }
			return totalIncome;
	}

	@Override
	public double totalExpense() {
		double totalExpense= 0;
		ArrayList<TransactiontrackModel>list=new ArrayList<TransactiontrackModel>();
		 String sql = "SELECT SUM(Amount) AS total_expense FROM incomeexpense WHERE type='Expenses'";
		 try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
			
				totalExpense=rs.getDouble("total_expense");
				
			}
		 }
		 catch(Exception ex) {
			 System.out.println(ex);
		 }
			return totalExpense;
	}

}
