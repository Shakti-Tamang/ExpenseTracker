package com.nextstep.expenseTracker.service1;

import java.util.List;

import com.nextstep.expensetarcker.model.AccountModel;

public interface AccountT {
public void saveAccount(AccountModel model);
public List<AccountModel> displayData();
}
