<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard1</title>
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
     
        h1 {
            margin-left: 44px;
            margin-bottom:33px;
            color: gray important!; /* Change color to gray */
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery library -->
    <%@ include file="DashBoard.jsp" %>
</head>
<body>
    <div class="container">
        <h1 style="color:gray;"><i class="fas fa-chart-line" style="color: rgb(100, 220, 164);"></i> Income and Expenses Graph</h1>
 
        <!-- Line Chart Canvas -->
        <canvas id="lineChart" style="width:100%;max-width:800px;"></canvas>
<h1 style="color:gray;"><i class="fas fa-chart-pie" style="color: rgb(100, 220, 164);"></i>
Income and Expenses Pie-chart</h1>
        <!-- Pie Chart Canvas -->
        <canvas id="pieChart" style="width:100%;max-width:800px;"></canvas>
    </div>
     
    <script>
        $(document).ready(function() {
            $.ajax({
                url: "TransactionGraph", // Servlet URL
                type: "GET",
                dataType: "json",
                success: function(data) {
                    // Extracting data for graph
                    const dates = data.dateList.map(item => item.date);
                    const incomes = data.incomeList.map(item => item.amount);
                    const expenses = data.expenseList.map(item => item.amount);

                    // Create chart after data is fetched
                    createLineChart("lineChart", dates, incomes, expenses);
                    createPieChart("pieChart", incomes, expenses);
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching data:", error);
                }
            });
        });

        function createLineChart(canvasId, dates, incomes, expenses) {
            new Chart(canvasId, {
                type: "line",
                data: {
                    labels: dates,
                    datasets: [
                        {
                            label: 'Income',
                            data: incomes,
                            borderColor: "rgb(80, 200, 144)",
                            fill: false,
                            yAxisID: 'y-axis-1'
                        },
                        {
                            label: 'Expense',
                            data: expenses,
                            borderColor: "green",
                            fill: false,
                            yAxisID: 'y-axis-1'
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [{
                            id: 'y-axis-1',
                            type: 'linear',
                            position: 'left',
                            scaleLabel: {
                                display: true,
                                labelString: 'Amount'
                            }
                        }]
                    },
                    legend: {
                        display: true,
                        labels: {
                            fontColor: 'black'
                        }
                    }
                }
            });
        }

        function createPieChart(canvasId, incomes, expenses) {
            const totalIncome = incomes.reduce((total, income) => total + income, 0);
            const totalExpense = expenses.reduce((total, expense) => total + expense, 0);
            const data = {
                labels: ['Income', 'Expense'],
                datasets: [{
                    data: [totalIncome, totalExpense],
                    backgroundColor: ['rgb(80, 200, 144)', 'green']
                }]
            };

            new Chart(canvasId, {
                type: 'pie',
                data: data,
                options: {
                    legend: {
                        display: true,
                        labels: {
                            fontColor: 'black'
                        }
                    }
                  }
            });
        }
    </script>
</body>
</html>
