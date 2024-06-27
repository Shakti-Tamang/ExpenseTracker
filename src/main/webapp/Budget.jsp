<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker Budget Management</title>
    <!-- Include Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    <style>
        /* CSS styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 722px;
            height: 1090px;
        }
        .budget-section {
            padding: 20px;
        }
        h1 {
            color: #333;
            display: flex;
            align-items: center;
        }
        .budget-icon {
        color:rgb(100, 220, 164);
            margin-right: 10px;
        }
        .budget-category {
            margin-bottom: 20px;
        }
        .budget-category label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px; 
        }
          input[type="text"],
        input[type="time"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            background-color: #f9f9f9;
            outline: none;
            font-size: 14px;
            border: none;
            border-bottom: 2px solid #ccc;
            transition: border-bottom 0.3s;
        }

        input[type="text"]:focus,
        input[type="time"]:focus,
        textarea:focus,
        select:focus {
            border-bottom: 2px solid green;
        }
        
        .budget-category input[type="text"] {
           width: 100%;
            padding: 10px;
            background-color: #f9f9f9;
            outline: none;
            font-size: 14px;
            border: none;
            border-bottom: 2px solid #ccc;
            transition: border-bottom 0.3s;
        }
         .budget-category input[type="text"] :focus,textarea:focus,
        select:focus {
            border-bottom: 2px solid green;
        }
        .btn {
            background-color: rgb(100, 220, 164);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .category-item {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .category-item .category-icon {
            margin-right: 10px;
        }
        .edit-icon {
            color: #333;
            cursor: pointer;
        }
        
           .section {
            width: 100%;
            margin-bottom: 20px;
        }

        .section-content {
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        
          .section-header {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            display: flex;
            align-items: center;
        }
        
        /* Icon color adjustment */
        .section-header i {
            color: rgb(100, 220, 164);
            margin-right: 10px;
        }

        /* Styling for account list */
        .account-list {
            list-style-type: none;
            padding: 0;
        }

        .account-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .account-item:last-child {
            border-bottom: none;
        }

        .account-name {
            flex: 1;
            margin-right: 10px; /* Adjusted margin */
        }

        .account-balance {
            color: #333;
            font-weight: bold;
        }
        
        .income-expenses-saving {
            /* Additional styling for income, expenses, and savings section */
        }
        
        .income-item, .expenses-item, .savings-item {
            margin-bottom: 10px;
        }
        
        .item-label {
            font-weight: bold;
        }
        
        .item-value {
            color: #333;
        }
        
    </style>
    <%@ include file="DashBoard.jsp" %>
</head>
<body>

 <div class="container">
    <form id="BudgetForm" action="BudgetController" method="post">
        <!-- Budget Section -->
        <div class="budget-section">
            <h2><i class="fas fa-money-check-alt budget-icon"></i> Budget</h2>
            <!-- Budget Category Input Fields -->
            <div class="budget-category">
                <label for="account">Account Name:</label>
               <select name="account" id="account"> 
                    <option value="">Select Account</option>
                    <c:forEach var="account" items="${accounts}">
                        <option value="${account.accountName}">${account.accountName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="budget-category">
                <label for="category-amount">Budget Amount</label>
                <input type="text" id="category-amount" name="category-amount" placeholder="Enter budget amount">
            </div>

            <!-- Save Budget Button -->
            <button type="submit" class="btn">Save Budget</button>
        </div>
    </form>
    
    <!-- Account Balances Section -->
    <div class="section">
        <div class="section-header"><i class="fas fa-money-bill-wave"></i> Account Balances</div>
        <div class="section-content">
            <ul class="account-list">
                <!-- Account balances will be dynamically added here -->
            </ul>
        </div>
    </div>
    
    <!-- Income, Expenses, and Savings Section -->
    <div class="section">
        <div class="section-header"><i class="fas fa-money-check-alt"></i> Income,Expenses</div>
        <div class="section-content">
            <div class="income-expenses-saving">
                <!-- Content for Income, Expenses, and Savings section goes here -->
                <!-- For example: -->
                <div class="income-item">
    <span class="item-label">Income:</span>
    <span class="item-value">${sessionScope.key1}</span>
     </div>
    <div class="expenses-item">
    <span class="item-label">Expenses:</span>
    <span class="item-value">${sessionScope.key2}</span>
       </div>

               
            </div>
        </div>
    </div>
    
    <!-- Transaction History Section -->
    <div class="section">
        <div class="section-header"><i class="fas fa-history"></i> Transaction History</div>
        <div class="section-content">
            <% 
            String key = (String) request.getAttribute("key");
            if (key != null && !key.isEmpty()) { 
            %>
            <p><%= key %></p>
            <% } else { %>
            <p>No transaction</p>
            <% } %>
            <!-- Your existing content for transaction history goes here -->
        </div>
    </div>
</div>

<!-- Include jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // Function to update account balances section
        function updateAccountBalances(data) {
            var accountList = $('.account-list');
            accountList.empty(); // Clear existing data

            $.each(data, function (index, item) {
                var listItem = $('<li class="account-item">');
                listItem.append('<span class="account-name">' + item.accountName + '</span>');
                listItem.append('<span class="account-balance">Rs. ' + item.amount + '</span>');
                accountList.append(listItem);
            });
        }

        // Function to fetch and update account balances
        function fetchAndUpdateAccountBalances() {
            $.ajax({
                type: 'GET',
                url: 'BudgetController',
                success: function (data) {
                    updateAccountBalances(data); // Update account balances section
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText); // Log error message
                }
            });
        }

        // Initial fetch and update of account balances
        fetchAndUpdateAccountBalances();

        // AJAX form submission
        $('#BudgetForm').submit(function (event) {
            event.preventDefault(); // Prevent default form submission

            $.ajax({
                type: $(this).attr('method'),
                url: $(this).attr('action'),
                data: $(this).serialize(),
                success: function (data) {
                    updateAccountBalances(data); // Update account balances section

                    // Clear input fields after successful submission
                    $('#account').val('');
                    $('#category-amount').val('');
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText); // Log error message
                }
            });
        });
    });
</script>

</body>
</html>
