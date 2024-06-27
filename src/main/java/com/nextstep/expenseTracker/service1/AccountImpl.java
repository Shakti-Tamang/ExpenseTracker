package com.nextstep.expenseTracker.service1;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nextstep.expenseTracker.connection.DBConnection;
import com.nextstep.expensetarcker.model.AccountModel;

public class AccountImpl implements AccountT {

	PreparedStatement ps=null;

	@Override
	public void saveAccount(AccountModel model) {
		String sql="insert into account(accountname,accounttype)values(?,?)";
		
		try {
			ps=DBConnection.getConnection().prepareStatement(sql);
			ps.setString(1, model.getAccountName());
			ps.setString(2,model.getAccountType());
			ps.executeUpdate();
		}
		
		catch(Exception ex) {
			System.out.println(ex);
		}
		
	}

	@Override
	public List<AccountModel> displayData() {
		ArrayList<AccountModel>list=new ArrayList<AccountModel>();
		
		String sql="select * from account";
		
		try {
		ps=DBConnection.getConnection().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			AccountModel model=new AccountModel();
			model.setAccountName(rs.getString("accountname"));
			list.add(model);
		}
		}
		
		catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}
	

}
