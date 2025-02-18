<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>

    /* General body styling */
    body {    
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color:#f4f4f4; /* Light grey background for the main area */
    }

    /* Styling for the sidebar */
    #sidebar {
        background-color: #FFFFFF; /* White background */
        color: #808080; /* Gray text color */
        width: 250px; /* Sidebar width */
        height: 100vh; /* Full height of the viewport */
        position: fixed; /* Fixed position to stay visible while scrolling */
        left: 0;
        top: 0;
        padding: 20px;
        box-shadow: 2px 0 5px rgba(0,0,0,0.1); /* Subtle shadow to the right of the sidebar */
    }

    /* Navigation list styling */
    #sidebar-nav ul {
        list-style: none;
        padding: 0;
    }

    #sidebar-nav ul li {
        padding: 10px 0;
    }

    #sidebar-nav ul li a {
        color: #808080; /* Gray text color */
        text-decoration: none; /* Removes underline from links */
        display: block; /* Makes the links fill the available space */
        transition: color 0.3s, background-color 0.3s; /* Smooth transition for color and background */
    }

    #sidebar-nav ul li a i {
        margin-right: 10px; /* Space between icon and text */
    }

    #sidebar-nav ul li a:hover {
        background-color: #e9ecef; /* Light gray background for hover state */
        color:rgb(100,220,164); /* Green color text for hover */
    }

    /* Header styling */
    #header {
        padding: 10px; /* Decrease padding */
        background-color: #FFFFFF;
        color: #808080;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        display: flex;
        align-items: center;
        position: fixed;
        width: calc(100% - 250px);
        left: 250px;
        top: 0;
        z-index: 1000;
        height: 60px;
    }

    /* Navigation icons styling */
    .header-nav ul li {
        display: inline-block;
        margin-right: 10px; /* Decrease margin between icons */
    }

    .header-nav ul li:last-child {
        margin-right: 0;
    }

    .header-nav ul li a {
        color: #808080;
        text-decoration: none;
        font-size: 14px; /* Decrease font size */
    }

    /* Logout button styling */
    .logout {
        margin-left: 490px; /* Move logout button to the right */
        border: 0px solid gray; /* Correct border syntax */
        color: gray;
        height: 35px;
        width: 75px;
        transition: color 0.3s;
        font-size: 26px; /* Decrease font size */
        padding: 5px 10px; /* Decrease padding */
    }

    .logout:hover {
        color:rgb(100,220,164);
    }

    /* Content area styling */
    #content {
        margin-left: 250px; /* Same as sidebar width */
        padding: 20px;
        margin-top: 70px; /* Adjusting content margin to avoid overlap with fixed header */
    }

    .content-header h1 {
        margin-top: 0;
    }

    /* Responsive design elements (for smaller screens) */
    @media (max-width: 768px) {
        #sidebar {
            width: 100%; /* Full width for smaller screens */
            height: auto; /* Auto height based on content */
            position: relative; /* Normal flow of the document */
        }
        #header {
            margin-left: 0; /* Header takes full width on small screens */
            left: 0;
        }
        #content {
            margin-left: 0; /* Content takes full width on small screens */
            margin-top: 50px; /* Adjusting content margin for small screens */
        }
    }

    /* Styling for ETracker logo */
    #sidebar-nav ul li img {
        margin-right: 4px;
        width: 80px;
        height: 70px;
    }

    #sidebar-nav ul li span {
        font-size: 25px;
        color: #000000; /* Dark black text color */
    }
</style>

</head>
<body>

<section id="sidebar"> 
  <div class="white-label"></div>  
  <div id="sidebar-nav">   
    <ul>
      <li>
        <img src="data:image/png;base64,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" alt="ETracker Logo">
        <span>ETracker</span>
      </li>
      <li class="active"><a href="DashboardController?action=DashBoard"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      <li><a href="DashboardController?action=Records"><i class="fa fa-file-text-o"></i> Records</a></li>
      <li><a href="DashboardController?action=Budget"><i class="fa fa-money"></i> Budget</a></li>
      <li><a href="DashboardController?action=Accounts"><i class="fa fa-users"></i> Accounts</a></li>
      <li><a href="DashboardController?action=Transation"><i class="fa fa-exchange"></i> Transactions</a></li>
      <li><a href="DashboardController?action=Category"><i class="fa fa-plus-square-o"></i> Add Category</a></li>
    </ul>
  </div>
</section>
<section id="content">
  <div id="header">
    <div class="header-nav">
      <div class="menu-button">
        <!-- Placeholder for menu button if needed -->
      </div>
      <div class="nav">
        <ul>
          <li class="nav-profile">
            <div class="nav-profile-image">
              <div class="nav-profile-name">
                <span class="text" style="color: black;">
                  Welcome, <%= request.getSession().getAttribute("name") != null ? request.getSession().getAttribute("name") : "Guest" %>
                </span>
              </div>
            </div>
          </li>
          <li>
            <!-- Add icon in front of Logout anchor tag and style it -->
            <a class="logout"  href="DashboardController?action=Logout"><i class="fa fa-sign-out" style="color:rgb(100,220,164);"></i> Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</section>

</body>
</html>
