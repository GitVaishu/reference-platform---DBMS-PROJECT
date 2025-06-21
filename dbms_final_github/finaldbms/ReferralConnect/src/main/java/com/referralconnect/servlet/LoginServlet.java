package com.referralconnect.servlet;

import com.referralconnect.dao.StudentDAO;
import com.referralconnect.dao.ProfessionalDAO;
import com.referralconnect.model.Student;
import com.referralconnect.model.Professional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        boolean isValid = false;
        HttpSession session = request.getSession();

        if ("student".equals(role)) {
            Student student = StudentDAO.loginStudent(email, password);
            if (student != null) {
                isValid = true;
                session.setAttribute("student", student);
                session.setAttribute("studentId", student.getstudentId()); // Corrected line
                System.out.println("DEBUG: Student ID set in session: " + student.getstudentId()); // Add this line for debugging
                response.sendRedirect("studentDashboard.jsp");
            }
        
        } else if ("professional".equals(role)) {
            Professional professional = ProfessionalDAO.loginProfessional(email, password);
            if (professional != null) {
                isValid = true;
                session.setAttribute("professional", professional); // Keep this if you need the whole object

                // Assuming Professional has a getProfessionalId() method (You'll need to add this to your Professional class)
                session.setAttribute("professionalId", professional.getProfessionalId()); 

                response.sendRedirect("professionalDashboard.jsp");
            }
        }

        if (!isValid) {
            response.getWriter().println("Invalid credentials. Please try again.");
        }
    }
}