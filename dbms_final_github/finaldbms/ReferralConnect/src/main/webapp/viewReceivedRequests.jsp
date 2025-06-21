<%@ page import="java.util.List" %>
<%@ page import="com.referralconnect.model.ReferenceRequest" %>
<%@ page import="com.referralconnect.dao.ReferenceRequestDAO" %>
<%@ page import="com.referralconnect.model.Professional" %>
<%@ page session="true" %>
<%
    Professional professional = (Professional) session.getAttribute("professional");
    if (professional == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<ReferenceRequest> requests = ReferenceRequestDAO.getRequestsByProfessional(professional.getEmail());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Received Requests</title>

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
            border-collapse: collapse; /* To make borders of cells collapse into a single border */
            width: 100%;
        }

        thead {
            background-color: #6f42c1; /* Purple header */
            color: white;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6; /* Light grey border for rows */
        }

        tbody tr:hover {
            background-color: #f8f9fa; /* Light grey hover effect */
        }

        .btn-light {
            background-color: #e9ecef; /* Light grey button */
            color: #343a40; /* Dark grey text */
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 8px 12px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
        }

        .btn-light:hover {
            background-color: #d3d9df;
            border-color: #adb5bd;
        }

        .no-action {
            color: #6c757d; /* Grey italic text */
            font-style: italic;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .form-inline {
            display: inline-flex; /* Align buttons horizontally */
            gap: 5px; /* Space between buttons */
        }

        a {
            color: #007bff; /* Standard link color */
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
    <h2>Reference Requests Received</h2>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Student Email</th>
                    <th>Message</th>
                    <th>Resume</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% for (ReferenceRequest r : requests) { %>
                <tr>
                     <td><%= r.getStudentEmail() %></td>
                    <td><%= r.getMessage() %></td>
                     <td>
                        <% if (r.getResumeUrl() != null && !r.getResumeUrl().isEmpty()) { %>
                            <a href="<%= r.getResumeUrl() %>" target="_blank">View Resume</a>
                        <% } else { %>
                            <span class="no-action">No Resume Provided</span>
                        <% } %>
                    </td>
                    <td><%= r.getStatus() %></td>
                    <td>
                        <% if ("Pending".equals(r.getStatus())) { %>
                            <form action="respondRequest" method="post" class="form-inline">
                                <input type="hidden" name="requestId" value="<%= r.getId() %>">
                                <button name="action" value="Accepted" class="btn btn-light btn-sm">Accept</button>
                                <button name="action" value="Rejected" class="btn btn-light btn-sm">Reject</button>
                            </form>
                        <% } else { %>
                            <span class="no-action">No action needed</span>
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