package com.nextstep.expensetarcker.model;

public class AccountModel {
private String accountName,accountType;
private int id;

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getAccountName() {
	return accountName;
}

public void setAccountName(String accountName) {
	this.accountName = accountName;
}

public String getAccountType() {
	return accountType;
}

public void setAccountType(String accountType) {
	this.accountType = accountType;
}
}
