<%@ page import="com.referralconnect.model.Student" %>
<%@ page session="true" %>
<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Dashboard | Referral Connect</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        :root {
            --primary-color: #5A00E0;
            --primary-light: #7D3AFF;
            --dark-color: #2E2E48;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6fa;
        }
        
        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 40px;
        }
        
        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color) !important;
            font-size: 24px;
        }
        
        .dashboard-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
        }
        
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease;
            margin-bottom: 25px;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card-body {
            padding: 25px;
            text-align: center;
        }
        
        .card-icon {
            font-size: 40px;
            color: var(--primary-color);
            margin-bottom: 20px;
        }
        
        .card-title {
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 15px;
        }
        
        .card-text {
            color: #666;
            margin-bottom: 20px;
        }
        
        .btn-custom {
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
        }
        
        .btn-custom:hover {
            background-color: var(--primary-light);
            color: white;
        }
        
        .welcome-banner {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-light));
            color: white;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 30px;
        }
        
        .logout-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 1000;
            box-shadow: 0 4px 12px rgba(90, 0, 224, 0.3);
        }
    </style>
</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-light">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-handshake mr-2"></i>Referral Connect
        </a>
    </nav>

    <!-- Main Dashboard Content -->
    <div class="container">
        <div class="dashboard-container">
            <!-- Welcome Banner -->
            <div class="welcome-banner">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h3>Welcome back, <%= student.getName() %>!</h3>
                        <p>Manage your referral connections</p>
                    </div>
                    <div class="col-md-4 text-right">
                        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Welcome" style="height: 100px;">
                    </div>
                </div>
            </div>
            
            <!-- Quick Actions -->
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-user-edit"></i>
                            </div>
                            <h5 class="card-title">Update Profile</h5>
                            <p class="card-text">Keep your profile updated</p>
                            <a href="studentProfile.jsp" class="btn btn-custom">Edit Profile</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-paper-plane"></i>
                            </div>
                            <h5 class="card-title">New Request</h5>
                            <p class="card-text">Send a new referral request</p>
                            <a href="sendRequest.jsp" class="btn btn-custom">Send Request</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <h5 class="card-title">View Requests</h5>
                            <p class="card-text">Check your sent requests</p>
                            <a href="viewSentRequests.jsp" class="btn btn-custom">View Requests</a>
                        </div>
                    </div>
                </div>
             <!-- -    <form action="DeleteStudentProfileServlet" method="post" onsubmit="return confirmDelete()">
                  <button type="submit" class="btn btn-danger">Delete Profile</button>
                       </form>

                 <script>
                     function confirmDelete() {
                         return confirm("Are you sure you want to delete your profile? This action cannot be undone.");
                       }
                </script>
                --->
                <form action="${pageContext.request.contextPath}/DeleteStudentProfileServlet" 
      method="post"
      onsubmit="return confirm('Are you sure you want to delete your profile?')">
    <button type="submit" class="btn btn-danger">Delete Profile</button>
</form>
                
            </div>
        </div>
    </div>

    <!-- Logout Button -->
    <a href="logout" class="btn btn-danger btn-lg rounded-circle logout-btn" data-toggle="tooltip" data-placement="left" title="Logout">
        <i class="fas fa-sign-out-alt"></i>
    </a>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</body>
</html>