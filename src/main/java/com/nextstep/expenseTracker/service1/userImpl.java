package com.nextstep.expenseTracker.service1;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.nextstep.expenseTracker.connection.DBConnection;
import com.nextstep.expensetarcker.model.UserModel;

public class userImpl implements User{
PreparedStatement ps=null;
	
	@Override
	public void saveUserDetails(UserModel model) {
		String sql="insert into userdetail(name,email,password,confirmpassword)values(?,?,?,?)";
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			
			ps.setString(1, model.getName());
			ps.setString(2,model.getEmail());
			ps.setString(3, model.getPassword());
			ps.setString(4, model.getConfirmpassword());
			ps.executeUpdate();
			
		}
		
		catch(Exception ex) {
			System.out.println(ex);
		}
		
		
	}

	@Override
	public boolean found(String email) {
		boolean found=false;
		String sql="select * from userdetail where email=? ";
		
		
		try {
			
			ps=DBConnection.getConnection().prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				found=true;
			}
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
		
		return found;
	}

	@Override
	public String login(UserModel model) {
		 String name = null; // Initialize to null
		String sql="select * from userdetail where email=? and password=?";
		
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ps.setString(1, model.getEmail());
			ps.setString(2, model.getPassword());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				name = rs.getString("name");
				
			}
		}
		
		catch(Exception ex) {
			System.out.println(ex);
		}
		 return name;
	}

	@Override
	public void updateUser(UserModel model) {
		String sql="update userdetail set password=? where email=?";
		
		try {
		ps=DBConnection.getConnection().prepareStatement(sql);
		ps.setString(1, model.getPassword());
		ps.setString(2, model.getEmail());
		ps.executeUpdate();
		}
		
		catch(Exception ex) {
			System.out.println(ex);
		}
		
	}

}
