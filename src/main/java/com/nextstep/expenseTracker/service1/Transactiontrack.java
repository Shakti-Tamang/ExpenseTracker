package com.nextstep.expenseTracker.service1;

import java.util.List;

import com.nextstep.expensetarcker.model.TransactiontrackModel;

public interface Transactiontrack {
public void saveTransaction(TransactiontrackModel model);
public List<TransactiontrackModel> displayTrackByIncome();
public List<TransactiontrackModel> displayTrackByExpense();
public List<TransactiontrackModel>getIncome();
public List<TransactiontrackModel>getExpense();
public List<TransactiontrackModel>getDate();
public void deleteById(int id);
public double totalIncome();
public double totalExpense();
}
