package com.nextstep.expenseTracker.service1;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nextstep.expenseTracker.connection.DBConnection;
import com.nextstep.expensetarcker.model.BudgetModel;

public class BudgetImpl implements Budget1{

	PreparedStatement ps=null;
	@Override

	public void saveBudget(BudgetModel model) {
		String accountName = model.getAccountName();
		
		try {
			
//			it checks weather accountExist is true or not
			// Check if the account already exists
            if (accountExists(accountName)) {
                // If account exists, update the amount
                String sql = "UPDATE budget SET budgetamount = budgetamount + ? WHERE accountname = ?";
                	ps=DBConnection.getConnection().prepareStatement(sql);
                ps.setDouble(1, model.getAmount());
                ps.setString(2, model.getAccountName());
                ps.executeUpdate();
            } else {
                // If account does not exist, insert a new record
                String insertSql = "INSERT INTO budget (accountname, budgetamount) VALUES (?, ?)";
              ps=DBConnection.getConnection().prepareStatement(insertSql);
                ps.setString(1, model.getAccountName());
                ps.setDouble(2, model.getAmount());
                ps.executeUpdate();
            }
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
		
	}
		
		
	
	@Override
	public List<BudgetModel> Display() {
	ArrayList<BudgetModel>list=new ArrayList<BudgetModel>();
	
	String sql="select accountname,budgetamount from budget";
	
	
	try {
		ps=DBConnection.getConnection().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			BudgetModel model=new BudgetModel();
			model.setAccountName(rs.getString("accountname"));
			model.setAmount(rs.getDouble("budgetamount"));
			list.add(model);
			
		}
	}
	
	catch(Exception ex) {
		System.out.println(ex);
	}
		return list;
	}



	@Override
	public boolean accountExists(String accountName) {
		
//		we can do it in same as login process  by using login propcess
		String sql="SELECT COUNT(*) FROM budget WHERE accountname = ?";
		
		try {
			 ps=DBConnection.getConnection().prepareStatement(sql);
	            ps.setString(1, accountName);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                int count = rs.getInt(1);
	                return count > 0;
	            }
			}
		catch(Exception ex) {
			System.out.println(ex);
		}
		
		return false;
	}


//these are for transaction
	@Override
	public void decreaseInBudget(BudgetModel model) {
		
   String accountName = model.getAccountName();
		
		try {
			
//			it checks weather accountExist is true or not
			// Check if the account already exists
            if (accountExists(accountName)) {
                // If account exists, update the amount
                String sql = "UPDATE budget SET budgetamount = budgetamount - ? WHERE accountname = ?"
                		+ "";
                	ps=DBConnection.getConnection().prepareStatement(sql);
                ps.setDouble(1, model.getAmount());
                ps.setString(2, model.getAccountName());
                ps.executeUpdate();
            } 
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
		
	}



	@Override
	public void IncreaseInBudget(BudgetModel model) {
		
String accountName = model.getAccountName();
		
		try {
			
//			it checks weather accountExist is true or not
			// Check if the account already exists
            if (accountExists(accountName)) {
                // If account exists, update the amount
                String sql = "UPDATE budget SET budgetamount = budgetamount + ? WHERE accountname = ?";
                	ps=DBConnection.getConnection().prepareStatement(sql);
                ps.setDouble(1, model.getAmount());
                ps.setString(2, model.getAccountName());
                ps.executeUpdate();
            } 
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
			
	}

}
