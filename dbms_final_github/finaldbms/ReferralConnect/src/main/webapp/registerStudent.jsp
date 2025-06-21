<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Registration</title>

   <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@500;600&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Custom Styles -->
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3a0ca3;
            --accent-color: #f72585;
            --dark-color: #2b2d42;
            --light-color: #f8f9fa;
            --text-color: #333;
            --text-light: #6c757d;
            --success-color: #4bb543;
            --error-color: #ff3333;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, rgba(248,249,250,1) 0%, rgba(232,240,254,1) 100%);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        h1, h2, h3 {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
            color: var(--secondary-color);
            font-size: 1.5rem;
        }
        
        .registration-container {
            background: white;
            border-radius: 15px;
            padding: 30px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.1);
            border: 1px solid rgba(0,0,0,0.05);
            position: relative;
            margin: auto;
        }
        
        .registration-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        }
        
        .registration-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .form-label {
            font-weight: 500;
            color: var(--dark-color);
            font-size: 0.9rem;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }
        
        .btn-register {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
            font-size: 0.9rem;
            margin-top: 10px;
        }
        
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(58, 12, 163, 0.3);
        }
        
        .password-container {
            position: relative;
            margin-bottom: 1rem;
        }
        
        .password-rules {
            display: block;
            font-size: 0.75rem;
            color: var(--text-light);
            margin-top: 5px;
        }
        
        .eye-icon {
            position: absolute;
            right: 15px;
            top: 38px;
            cursor: pointer;
            color: var(--text-light);
        }
        
        .password-requirements {
            margin-top: 5px;
            font-size: 0.75rem;
        }
        
        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 3px;
            color: var(--text-light);
        }
        
        .requirement i {
            margin-right: 5px;
            font-size: 0.6rem;
        }
        
        .requirement.valid {
            color: var(--success-color);
        }
        
        .requirement.invalid {
            color: var(--error-color);
        }
        
        .footer {
            margin-top: 20px;
            text-align: center;
            color: var(--text-light);
            font-size: 0.75rem;
            width: 100%;
        }
        
        .footer a {
            color: var(--primary-color);
            text-decoration: none;
        }
        
        .is-invalid {
            border-color: var(--error-color) !important;
        }
        
        .is-valid {
            border-color: var(--success-color) !important;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <div class="registration-container">
        <h2>Student Registration</h2>
        <form action="registerStudent" method="post" id="registrationForm">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control" required>
            </div>
            <div class="form-group password-container">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control" required>
                
                <small class="password-rules">Password must meet the following requirements:</small>
                <div class="password-requirements">
                    <div class="requirement" id="length-req">
                        <i class="fas fa-circle"></i>
                        <span>At least 8 characters long</span>
                    </div>
                    <div class="requirement" id="uppercase-req">
                        <i class="fas fa-circle"></i>
                        <span>Contains uppercase letter</span>
                    </div>
                    <div class="requirement" id="lowercase-req">
                        <i class="fas fa-circle"></i>
                        <span>Contains lowercase letter</span>
                    </div>
                    <div class="requirement" id="number-req">
                        <i class="fas fa-circle"></i>
                        <span>Contains a number</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="resume">Resume URL</label>
                <input type="url" name="resume" id="resume" class="form-control">
            </div>
            <div class="form-group">
                <label for="experience">Experience</label>
                <textarea name="experience" id="experience" class="form-control" rows="3"></textarea>
            </div>
            <div class="form-group">
                <label for="photo">Photo URL</label>
                <input type="url" name="photo" id="photo" class="form-control">
            </div>
            <button type="submit" class="btn btn-register">Register</button>
        </form>
    </div>

    <div class="footer">
        <p>&copy; 2025 Referral Connect. All rights reserved.</p>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function togglePassword() {
            const input = document.getElementById("password");
            const icon = document.querySelector(".eye-icon");
            if (input.type === "password") {
                input.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                input.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }
        
        document.getElementById("password").addEventListener("input", function(e) {
            const password = e.target.value;
            const lengthReq = document.getElementById("length-req");
            const uppercaseReq = document.getElementById("uppercase-req");
            const lowercaseReq = document.getElementById("lowercase-req");
            const numberReq = document.getElementById("number-req");
            
            // Check length
            if (password.length >= 8) {
                lengthReq.classList.add("valid");
                lengthReq.classList.remove("invalid");
                lengthReq.querySelector("i").className = "fas fa-check-circle";
            } else {
                lengthReq.classList.add("invalid");
                lengthReq.classList.remove("valid");
                lengthReq.querySelector("i").className = "fas fa-times-circle";
            }
            
            // Check uppercase
            if (/[A-Z]/.test(password)) {
                uppercaseReq.classList.add("valid");
                uppercaseReq.classList.remove("invalid");
                uppercaseReq.querySelector("i").className = "fas fa-check-circle";
            } else {
                uppercaseReq.classList.add("invalid");
                uppercaseReq.classList.remove("valid");
                uppercaseReq.querySelector("i").className = "fas fa-times-circle";
            }
            
            // Check lowercase
            if (/[a-z]/.test(password)) {
                lowercaseReq.classList.add("valid");
                lowercaseReq.classList.remove("invalid");
                lowercaseReq.querySelector("i").className = "fas fa-check-circle";
            } else {
                lowercaseReq.classList.add("invalid");
                lowercaseReq.classList.remove("valid");
                lowercaseReq.querySelector("i").className = "fas fa-times-circle";
            }
            
            // Check number
            if (/[0-9]/.test(password)) {
                numberReq.classList.add("valid");
                numberReq.classList.remove("invalid");
                numberReq.querySelector("i").className = "fas fa-check-circle";
            } else {
                numberReq.classList.add("invalid");
                numberReq.classList.remove("valid");
                numberReq.querySelector("i").className = "fas fa-times-circle";
            }
            
            // Update input styling based on overall validity
            if (password.length >= 8 && /[A-Z]/.test(password) && 
                /[a-z]/.test(password) && /[0-9]/.test(password)) {
                e.target.classList.add("is-valid");
                e.target.classList.remove("is-invalid");
            } else if (password.length > 0) {
                e.target.classList.add("is-invalid");
                e.target.classList.remove("is-valid");
            } else {
                e.target.classList.remove("is-invalid");
                e.target.classList.remove("is-valid");
            }
        });
        
        document.getElementById("registrationForm").addEventListener("submit", function(e) {
            const password = document.getElementById("password").value;
            
            if (password.length < 8 || !/[A-Z]/.test(password) || 
                !/[a-z]/.test(password) || !/[0-9]/.test(password)) {
                e.preventDefault();
                alert("Please ensure your password meets all the requirements before submitting.");
                document.getElementById("password").focus();
            }
        });
    </script>
</body>
</html>