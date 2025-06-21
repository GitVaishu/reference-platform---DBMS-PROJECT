package com.referralconnect.servlet;

import com.referralconnect.dao.ReferenceRequestDAO;
import com.referralconnect.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;



@WebServlet("/sendRequest")
public class SendRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String professionalEmail = request.getParameter("professionalEmail");
        String message = request.getParameter("message");  // Get the message parameter

        boolean success = ReferenceRequestDAO.sendRequest(student.getEmail(), professionalEmail, message);
        if (success) {
            response.sendRedirect("studentDashboard.jsp");
        } else {
            response.getWriter().println("Failed to send request.");
        }
    }
}
