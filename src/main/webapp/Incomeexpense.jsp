<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Income and Expenses Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
     <script>
    function validateTransaction(){
        var type = document.getElementById("type").value;
        var account = document.getElementById("account").value;
        var category = document.getElementById("category").value;
        var note = document.getElementById("note").value;
        var amount = document.getElementById("amount").value;
        var date = document.getElementById("date").value;

        // Check if all fields are non-empty
        if (type === "" || account === "" || category === "" || note === "" || amount === "" || date === "") {
            alert("All fields are required.");
            return false;
        }

        // Check if amount is a number
        if (isNaN(amount)) {
            alert("Amount must be a number.");
            return false;
        }

        return true;
    }
    </script>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .Box {
            width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
        }

        .form-container {
            width: 100%;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            color: grey;
            margin-bottom: 5px;
            font-size: 14px;
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

        button {
            width: 100%;
            background-color: rgb(100, 220, 164);
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            outline: none;
            transition: background-color 0.3s ease;
            font-size: 14px;
        }

        button:hover {
            background-color: green;
        }

        .icon {
            margin-right: 10px;
            color: rgb(100, 220, 164);
        }

        h4 {
            color: grey;
            font-size: 22px;
            margin-bottom: 20px;
        }

        .disabled-date {
            color: grey;
            pointer-events: none;
            text-decoration: line-through;
        }
    </style>
    <%@ include file="DashBoard.jsp" %>
</head>
<body>
<div class="Box">
    <div class="form-container">
        <h4>Income and Expenses Form</h4>
        <form action="Transaction" method="post" onsubmit="return validateTransaction()">
            <div class="form-group">
                <label for="type"><i class="fas fa-list-alt icon"></i> Select Type:</label>
                <select name="type" id="type">
                    <option value="Income">Income</option>
                    <option value="Expenses">Expenses</option>
                </select>
            </div>
            <div class="form-group">
                <label for="account"><i class="fas fa-user icon"></i> Account:</label>
                <select name="account" id="account"> 
                    <option value="">Select Account</option>
                    <c:forEach var="account" items="${accounts}">
                        <option value="${account.accountName}">${account.accountName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="category"><i class="fas fa-list-alt icon"></i> Category:</label>
                <select name="category" id="category"></select>
            </div>
            <div class="form-group">
                <label for="note"><i class="fas fa-sticky-note icon"></i> Note:</label>
                <textarea name="note" id="note" placeholder="Enter your note..."></textarea>
            </div>
            <div class="form-group">
                <label for="amount"><i class="fas fa-dollar-sign icon"></i> Amount:</label>
                <input type="text" name="amount" id="amount" placeholder="Enter amount...">
            </div>
            <div class="form-group">
                <label for="date"><i class="fas fa-calendar-alt icon"></i> Date:</label>
                <input type="date" name="date" id="date">
            </div>
         
            <button type="submit"><i class="fas fa-check-circle icon"></i> Submit</button>
        </form>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        // Set the min attribute for the date input to today's date
       /* it will diable date before today*/
       /*The toISOString() method converts the Date object to a string in the ISO 8601
       format, which looks something like this: "2024-05-17T10:20:30.000Z". This format
       includes the date, time, and timezone information.*/
       
      
        var today = new Date().toISOString().split('T')[0];
        $('#date').attr('min', today);

        /*mim will take minimum value as today means it will value only after today*/
        $('#type').change(function() {
            var selectedType = $(this).val();
            $.ajax({
                type: 'GET',
                url: 'Catagory',
                data: { action: 'getCategories', type: selectedType },
                dataType: 'json',
                success: function(response) {
                    $('#category').empty();
                    $.each(response, function(index, category) {
                        $('#category').append('<option value="' + category.category + '">' + category.category + '</option>');
                    });
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        });

        // Apply styling to disable dates before today
        $('#date').on('input', function() {
            var selectedDate = $(this).val();
            if (new Date(selectedDate) < new Date(today)) {
                $(this).val(today);
            }
        });
    });
</script>
</body>
</html>
