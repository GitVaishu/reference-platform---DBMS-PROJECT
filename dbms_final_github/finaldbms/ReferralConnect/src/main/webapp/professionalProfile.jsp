<%@ page import="com.referralconnect.model.Professional" %>
<%@ page session="true" %>
<%
Professional professional = (Professional) session.getAttribute("professional");
if (professional == null) {
    response.sendRedirect("login.jsp");
    return;
}

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Professional Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa; /* Light grey background, similar to the login page */
            padding: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .profile-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #6f42c1; /* Purple color similar to the login header */
            font-weight: 600;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: 500;
            color: #343a40; /* Dark grey label text */
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            box-shadow: none !important;
        }

        .btn-primary {
            background: linear-gradient(to right, #6a11cb, #2575fc); /* Gradient button */
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            opacity: 0.9;
        }

        .text-center {
            text-align: center;
        }

        .mt-4 {
            margin-top: 1.5rem;
        }
    </style>
</head>
<body>
<div class="profile-container">
    <h2>Your Profile</h2>
    <form action="updateProfessionalProfile" method="post">
        <div class="form-group">
            <label>Name:</label>
            <input type="text" name="name" value="<%= professional.getName() %>" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Organization:</label>
            <input type="text" name="organization" value="<%= professional.getOrganization() %>" class="form-control">
        </div>
        <div class="form-group">
            <label>Field:</label>
            <input type="text" name="field" value="<%= professional.getField() %>" class="form-control">
        </div>
       
        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary">Update Profile</button>
        </div>
    </form>
</div>
</body>
</html>