<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker - Account Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 60%;
            min-height: 100vh;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 6px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 325px;
        }

        .section {
            width: 100%;
            margin-bottom: 20px;
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

        .section-content {
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .input-group {
            margin-bottom: 10px;
        }

        .input-group label {
            font-weight: bold;
        }

        .input-group input, .input-group select {
            padding: 8px;
            width: calc(100% - 16px);
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

        .input-group select {
            background-color: #fff;
        }

        .button{
            background-color: rgb(100, 220, 164);
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }

        .button:hover {
            background-color: green;
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
        }

        .account-balance {
            color: #333;
            font-weight: bold;
        }
        
        img{
       
        margin-right: 125px;
       
        }
        
        .logo{
         display:flex;
        }
    </style>
    <%@ include file="DashBoard.jsp" %>
</head>
<body>

<div class="container">
    <div class="section">
    <form action="Account" method="post">
        <div class="section-header"><i class="fas fa-info-circle"></i> Account Information</div>
        <div class="section-content">
            <!-- Display account information here -->
            <div class="input-group">
                <label for="accountName">Account Name:</label>
                <input type="text" id="accountName" name="accountName" required>
            </div>
            <div class="input-group">
                <label for="accountType">Account Type:</label>
                <select id="accountType" class="accountType" name="accountType" required>
                  
                 <option value="wallet">Wallet</option>
                      <option value="Creditcard">Creditcard</option>
             
                </select>
            </div>
            <button type="submit" class="button">Add Account</button>
        </div>
        </form>
    </div>
    <div class="logo">    
    <img src="data:image/png;base64,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">
     <img src="data:image/png;base64,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">

</div>
<img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR24Lh9swsY112U67zxHwJItqkP8nLwWp0g3A&s">
</div>

</body>
</html>
