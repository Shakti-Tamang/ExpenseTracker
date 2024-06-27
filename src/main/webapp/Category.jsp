<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Category Dashboard</title>
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
            width: 80%;
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
        <form id="categoryForm" action="Catagory" method="post" >
            <div>
                <select id="categoryType" class="custom-input" style="width: 120px;">
                    <option value="Income">Income</option>
                    <option value="Expenses">Expenses</option>
                </select>
                <input type="text" id="newCategory" placeholder="Add New Category" class="custom-input">
                <button type="submit" class="custom-button"><i class="fas fa-check-circle icon"></i>Add</button>
            </div>
        </form>

        <!-- Income Categories Heading -->
        <h2 class="categories-heading"><i class="fas fa-list categories-icon"></i>Income Categories</h2>
        <!-- Income Categories List -->
        <ul class="income category-list" id="incomeCategoriesList">
            <!-- Display income categories dynamically using AJAX -->
        </ul>

        <!-- Expense Categories Heading -->
        <h2 class="categories-heading"><i class="fas fa-list categories-icon"></i>Expense Categories</h2>
        <!-- Expense Categories List -->
        <ul class="expenses category-list" id="expenseCategoriesList">
            <!-- Display expense categories dynamically using AJAX -->
        </ul>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // Load categories on page load
            loadCategories("CategoryIncome", "#incomeCategoriesList");
            loadCategories("CategoryExpenses", "#expenseCategoriesList");

            // Handle form submission
            $("#categoryForm").submit(function(event) {
                event.preventDefault(); // Prevent default form submission

                var categoryType = $("#categoryType").val();
                var newCategory = $("#newCategory").val();

                $.ajax({
                    type: "POST",
                    url: "Catagory",
                    data: {
                        categoryType: categoryType,
                        newCategory: newCategory
                    },
                    success: function() {
                        // Reload categories after adding a new one
                        loadCategories("CategoryIncome", "#incomeCategoriesList");
                        loadCategories("CategoryExpenses", "#expenseCategoriesList");
                        $("#newCategory").val(""); // Clear input field
                    },
                    error: function(xhr, status, error) {
                        console.error("Error:", error);
                    }
                });
            });

            // Delete category on delete icon click
            $(document).on("click", ".delete-icon", function(e) {
                e.preventDefault(); // Prevent default link behavior
                var categoryId = $(this).data("id"); // Get category ID from data attribute
                var categoryType = $(this).data("type"); // Get category type from data attribute

                if (confirm("Are you sure you want to delete this category?")) { // Show confirmation dialog
                    $.ajax({
                        type: "GET",
                        url: "Catagory",
                        data: {
                            action: "delete",
                            id: categoryId,
                            categoryType: categoryType // Include categoryType parameter
                        },
                        success: function(response) {
                            // Remove the deleted category from the list without reloading the page
                            $(this).closest('.category-item').remove();
                        }.bind(this), // Bind 'this' to maintain context inside the success function
                        error: function(xhr, status, error) {
                            console.error("Error:", error);
                        }
                    });
                }
            });

            // Function to load categories dynamically using AJAX
            function loadCategories(action, targetElement) {
                $.ajax({
                    type: "GET",
                    url: "Catagory",
                    data: {
                        action: action
                    },
                    dataType: "json",
                    success: function(response) {
                        $(targetElement).empty(); // Clear previous categories
                        $.each(response, function(index, category) {
                            var listItem = '<li class="category-item">' + category.id + ' - ' + category.category +
                                '<a class="delete-icon" data-id="' + category.id + '" data-type="' + category.type + '"><i class="fas fa-trash"></i></a></li>';
                            $(targetElement).append(listItem);
                        });
                    },                   
                    error: function(xhr, status, error) {
                        console.error("Error:", error);
                    }
                });
            }
        });
    </script>
</body>
</html>
