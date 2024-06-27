<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign up</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            color: gray;
        }

        .vh-100 {
            height: 100vh;
        }

        .card {
            border-radius: 25px;
        }

        .form-outline {
            position: relative;
        }

        .form-control {
            padding-left: 40px;
        }

        .form-control-icon {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
        }

        /* Custom button color */
        .btn-custom {
            background-color: rgb(100, 220, 164);
            border-color: rgb(100, 220, 164);
        }

        .btn-custom:hover {
            background-color: rgb(80, 200, 144);
            border-color: rgb(80, 200, 144);
        }

        .alert-message {
            color: red;
            position: fixed;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 300px;
            text-align: center;
            z-index: 9999;
        }
    </style>
   
</head>
<body>

<section class="vh-100" style="background-color: #eee;">
    <div class="alert-message">
        <% String errorMessage = (String)request.getAttribute("message");
           if(errorMessage != null && !errorMessage.isEmpty()) { %>
            <div class="alert alert-danger" role="alert" id="error-message">
                <%= errorMessage %>
            </div>
        <% } %>
    </div>
    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
                <div class="card text-black">
                    <div class="card-body p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                <h1 class="text-center fw-bold mb-5 mt-4">Sign up</h1>
                                <form class="mx-1 mx-md-4" action="SignupController" method="post" onsubmit="return validateForm()">

                                    <div class="form-group">
                                        <div class="form-outline mb-4">
                                            <!-- Include Font Awesome icons -->
                                            <i class="fas fa-user fa-lg form-control-icon"></i>
                                            <input type="text" id="username" name="username" class="form-control" placeholder="Your Name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-outline mb-4">
                                            <!-- Include Font Awesome icons -->
                                            <i class="fas fa-envelope fa-lg form-control-icon"></i>
                                            <input type="email" id="email" name="email" class="form-control" placeholder="Your Email" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-outline mb-4">
                                            <!-- Include Font Awesome icons -->
                                            <i class="fas fa-lock fa-lg form-control-icon"></i>
                                            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-outline mb-4">
                                            <!-- Include Font Awesome icons -->
                                            <i class="fas fa-key fa-lg form-control-icon"></i>
                                            <input type="password" id="confirm_password" name="confirm_password" class="form-control" placeholder="Confirm Password" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-lg btn-block btn-custom">Sign up</button>
                                    </div>
                                    <div class="form-group">
                                        <a href="DashboardController?action=Login" class="btn btn-lg btn-block btn-custom">Log in</a>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                <img src="data:image/png;base64,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"
                                     class="img-fluid" alt="Sample image">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

 <script>
        function validateForm() {
        	
        	  document.querySelector("form").addEventListener("submit", function(e) {
                  e.preventDefault();
        	  });

        	
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;

            var name = document.getElementById("username").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;

            var isValid = true;
            var errorMessage = "";

            if (name.trim() === "") {
                errorMessage += "Name cannot be empty.\n";
                isValid = false;
            }

            if (!emailRegex.test(email)) {
                errorMessage += "Invalid email format.\n";
                isValid = false;
            }

            if (!passwordRegex.test(password)) {
                errorMessage += "Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, and one number.\n";
                isValid = false;
            }

            if (password !== confirmPassword) {
                errorMessage += "Passwords do not match.\n";
                isValid = false;
            }

            if (!isValid) {
                document.getElementById("error-message").innerText = errorMessage;
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
