<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Records</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100vw;
            margin-top: 80px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .category-list {
            padding: 0;
            margin: 20px 0;
        }

        .category-item {
            list-style-type: none;
            margin: 10px 0;
            background: #eee;
            padding: 10px;
            border-radius: 5px;
            position: relative;
        }

        .category-item .delete-icon {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            color: red;
            cursor: pointer;
        }

        .category-icon {
         color: rgb(100, 220, 164);
            margin-right: 8px;
            font-size: 18px;
        }

        select {
            padding: 6px 8px;
            margin-bottom: 20px;
            width: auto;
            border: none;
            outline: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .categories-heading {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #555;
            font-size: 28px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .categories-icon {
         color: rgb(100, 220, 164);
            margin-right: 10px;
        }

        .custom-input {
            padding: 8px 10px;
            border: none;
            border-radius: 5px;
            flex: 1;
            margin-right: 10px;
        }

        .custom-button {
            padding: 8px 20px;
            background-color: rgb(100, 220, 164);
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .custom-button:hover {
            background-color: Green;
        }
    </style>
    <%@ include file="DashBoard.jsp" %>
</head>
<body>
    <div class="container">
       
        <!-- Income Categories Heading -->
        <h2 class="categories-heading"><i class="fas fa-coins categories-icon"></i>Income records </h2>
         <c:if test="${!empty record}">
            <table class="table table-hover table-responsive-md">
                <thead class="tbl-header">
                <tr>
                    <th>ID</th>
                    <th>Transation Type</th>
                    <th>Account</th>
                    <th>Category</th>
                     <th>Note</th>
                      <th>Amount </th>
                       <th>Date</th>
                    <th>Action</th>

                </tr>
                </thead>
                <tbody id="th-body">
                <c:forEach items="${record}" var="records">
                    <tr>
                        <td><c:out value="${records.id}" /></td>
                        <td><c:out value="${records.type}" /></td>
                        <td><c:out value="${records.account}" /></td>
                        <td><c:out value="${records.category}" /></td>
                        <td><c:out value="${records.note}" /></td>
                        <td><c:out value="${records.amount}" /></td>
                        <td><c:out value="${records.date}" /></td>
                      <td><a class="delete-icon" href="DashboardController?id=${records.id}&action=delete" onClick="return confirmDelete()"><i class="fas fa-trash-alt delete-icon" style="color: black;"></i></a> </td>
                        
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </c:if>
        <!-- Expense Categories Heading -->
        <h2 class="categories-heading"><i class="fas fa-shopping-cart categories-icon"></i>Expenses records</h2>
         <c:if test="${!empty expense}">
            <table class="table table-hover table-responsive-md">
                <thead class="tbl-header">
                <tr>
                     <th>ID</th>
                    <th>Transation Type</th>
                    <th>Account</th>
                    <th>Category</th>
                     <th>Note</th>
                      <th>Amount </th>
                       <th>Date</th>
                       <th>Actions</th>
                   
                </tr>
                </thead>
                <tbody id="th-body">
                <c:forEach items="${expense}" var="expenses">
                    <tr>
                     <td><c:out value="${expenses.id}" /></td>
                        <td><c:out value="${expenses.type}" /></td>
                        <td><c:out value="${expenses.account}" /></td>
                        <td><c:out value="${expenses.category}" /></td>
                        <td><c:out value="${expenses.note}" /></td>
                        <td><c:out value="${expenses.amount}" /></td>
                        <td><c:out value="${expenses.date}" /></td>
                        <td><a class="delete-icon" href="DashboardController?id=${expenses.id}&action=delete" onClick="return confirmDelete()"><i class="fas fa-trash-alt delete-icon" style="color: black;"></i></a> </td>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
       
    </div>
    <script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete the data");
    }
    </script>
</body>
</html>
