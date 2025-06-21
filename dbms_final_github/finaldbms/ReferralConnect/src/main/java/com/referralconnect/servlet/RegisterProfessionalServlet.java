package com.referralconnect.servlet;

import com.referralconnect.model.Professional;
import com.referralconnect.dao.ProfessionalDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/registerProfessional")
public class RegisterProfessionalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String organization = request.getParameter("organization");
        String field = request.getParameter("field");

        Professional professional = new Professional(name, email, password, organization, field);
        boolean result = ProfessionalDAO.registerProfessional(professional);

        if (result) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration failed. Try again.");
        }
    }
}
