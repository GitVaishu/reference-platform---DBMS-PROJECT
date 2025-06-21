<%@ page import="java.util.List" %>
<%@ page import="com.referralconnect.model.ReferenceRequest" %>
<%@ page import="com.referralconnect.dao.ReferenceRequestDAO" %>
<%@ page import="com.referralconnect.model.Student" %>
<%@ page session="true" %>
<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<ReferenceRequest> requests = ReferenceRequestDAO.getRequestsByStudent(student.getEmail());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sent Requests</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa; /* Light grey background */
            padding: 30px;
            
            min-height: 100vh;
            margin: 0;
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

        .container {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
            margin-top: 60px; /* Adjust max-width as needed for the table */
        }

        h2 {
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
            color: #6f42c1; /* Purple heading */
        }

        table {
            background-color: white;
            color: #343a40; /* Dark grey text */
            border-radius: 8px;
            overflow: hidden;
            border-collapse: collapse;
            width: 100%;
        }

        thead {
            background-color: #6f42c1; /* Purple header */
            color: white;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        tbody tr:hover {
            background-color: #f8f9fa;
        }

        .status-tag {
            padding: 5px 10px;
            border-radius: 5px; /* Less rounded */
            font-size: 0.9rem;
            font-weight: 500;
            color: white; /* Default text color */
        }

        .pending {
            background-color: #ffc107; /* Yellow */
            color: black;
        }

        .accepted {
            background-color: #28a745; /* Green */
        }

        .rejected {
            background-color: #dc3545; /* Red */
        }

        .table-responsive {
            overflow-x: auto;
        }

        a.btn-info {
            background-color: #007bff; /* Standard blue */
            color: white;
            border: 1px solid #007bff;
            border-radius: 5px;
            padding: 6px 10px;
            font-size: 0.9rem;
            text-decoration: none;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        a.btn-info:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
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
<div class="container">
    <h2>Your Sent Reference Requests</h2>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Professional</th>
                    <th>Message</th>
                    <th>Status</th>
                    <th>Request Date</th>
                    <th>Resume</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (ReferenceRequest r : requests) {
                    String status = r.getStatus().toLowerCase();
                    String statusClass = status.equals("pending") ? "pending" : (status.equals("accepted") ? "accepted" : "rejected");
            %>
                <tr>
                    <td><%= r.getProfessionalEmail() %></td>
                    <td><%= r.getMessage() %></td>
                    <td><span class="status-tag <%= statusClass %>"><%= r.getStatus() %></span></td>
                    <td>
                        <%= r.getRequestDate() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(r.getRequestDate()) : "N/A" %>
                    </td>
                    <td>
                        <% if (r.getResumeUrl() != null && !r.getResumeUrl().isEmpty()) { %>
                            <a href="<%= r.getResumeUrl() %>" target="_blank" class="btn btn-info btn-sm">View Resume</a>
                        <% } else { %>
                            <span>N/A</span>
                        <% } %>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>