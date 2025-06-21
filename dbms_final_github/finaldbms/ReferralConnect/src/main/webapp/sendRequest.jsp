<%@ page import="java.util.*" %>
<%@ page import="com.referralconnect.dao.ProfessionalDAO" %>
<%@ page import="com.referralconnect.model.Professional" %>
<%@ page import="com.referralconnect.model.Student" %>
<%@ page session="true" %>
<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Professional> professionals = ProfessionalDAO.getAllProfessionals();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send Reference Request</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa; /* Light grey background */
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 40px;
            width: 100%;
        }
        
        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color) !important;
            font-size: 24px;
        }

        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
            margin-top: 60px;
            
        }

        h2 {
            text-align: center;
            color: #6f42c1; /* Purple color */
            font-weight: 600;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: 500;
            color: #343a40; /* Dark grey label text */
        }

        select.form-control,
        textarea.form-control,
        input.form-control {
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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.jsp">
             <i class="fas fa-handshake mr-2"></i>Referral Connect
        </a>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
<div class="form-container">
    <h2>Send Reference Request</h2>
    <form action="sendRequest" method="post">
        <div class="form-group">
            <label>Select Professional:</label>
            <select name="professionalEmail" class="form-control" required>
                <% for (Professional p : professionals) { %>
                    <option value="<%= p.getEmail() %>">
                        <%= p.getName() %> - <%= p.getField() %>
                    </option>
                <% } %>
            </select>
        </div>
        <div class="form-group">
            <label>Message:</label>
            <textarea name="message" class="form-control" rows="4" placeholder="Write your request message..." required></textarea>
        </div>
        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary">Send Request</button>
        </div>
    </form>
</div>
</body>
</html>