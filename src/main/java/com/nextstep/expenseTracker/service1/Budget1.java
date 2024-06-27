package com.nextstep.expenseTracker.service1;

import java.util.List;

import com.nextstep.expensetarcker.model.BudgetModel;

public interface Budget1 {
public void saveBudget(BudgetModel model);
public List<BudgetModel>Display();
public boolean accountExists(String accountName); 

//for two funxtions for transactions scetion
public void decreaseInBudget(BudgetModel model);
public void IncreaseInBudget(BudgetModel model);

}
