package com.nextstep.expenseTracker.service1;

import com.nextstep.expensetarcker.model.UserModel;

public interface User {
public void saveUserDetails(UserModel model);
public boolean found(String email);

public String login(UserModel model);

public void updateUser(UserModel model);


}
