package com.nextstep.expenseTracker.service1;

import java.util.List;

import com.nextstep.expensetarcker.model.CategoryModel;

public interface Category {
public void saveCategory(CategoryModel model);
public List<CategoryModel> DiplayCategoryIncome();
public List<CategoryModel> DiplayCategoryExpenses();
public void deleteById(int id);
public List<CategoryModel> displayByCatagory(String typo);
}
