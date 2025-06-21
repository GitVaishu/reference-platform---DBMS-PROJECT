// DeleteStudentProfileServlet.java
package com.referralconnect.servlet;

import com.referralconnect.dao.StudentDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteStudentProfileServlet")
public class DeleteStudentProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //System.out.println("DeleteStudentProfileServlet invoked"); // Debug logging

        HttpSession session = request.getSession(false);
        if (session == null) {
            System.out.println("No session found - redirecting to login");
            response.sendRedirect("login.jsp");
            return;
        }

        Integer studentId = (Integer) session.getAttribute("studentId");
        //System.out.println("DEBUG: studentId from session: " + studentId); // *** CRITICAL LOGGING ***
        if (studentId == null) {
            System.out.println("No studentId in session - redirecting to login");
            response.sendRedirect("login.jsp");
            return;
        }

        //System.out.println("Attempting to delete student ID: " + studentId);
        StudentDAO studentDAO = new StudentDAO();

        try {
            boolean deletionResult = studentDAO.softDeleteStudent(studentId);
            System.out.println("DEBUG: Deletion result: " + deletionResult); // Log the result
            if (deletionResult) {
                System.out.println("Deletion successful for ID: " + studentId);
                session.invalidate(); // Invalidate the session to log the student out
                response.sendRedirect("index.jsp?deleteSuccess=true");
            } else {
                System.out.println("Deletion failed for ID: " + studentId);
                response.sendRedirect("studentProfile.jsp?deleteError=true");
            }
        } catch (Exception e) {
            System.err.println("Error during deletion:");
            e.printStackTrace();
            response.sendRedirect("studentProfile.jsp?deleteError=true");
        }
    }
}