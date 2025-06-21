// DeleteProfessionalProfileServlet.java
package com.referralconnect.servlet;

import com.referralconnect.dao.ProfessionalDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteProfessionalProfileServlet")
public class DeleteProfessionalProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("DeleteProfessionalProfileServlet invoked"); // Debug
        
        HttpSession session = request.getSession(false);
        if (session == null) {
            System.out.println("No session found - redirecting to login");
            response.sendRedirect("login.jsp");
            return;
        }
        
        Integer professionalId = (Integer) session.getAttribute("professionalId");
        if (professionalId == null) {
            System.out.println("No professionalId in session - redirecting to login");
            response.sendRedirect("login.jsp");
            return;
        }
        
        System.out.println("Attempting to delete professional ID: " + professionalId);
        ProfessionalDAO professionalDAO = new ProfessionalDAO();
        
        try {
            if (professionalDAO.softDeleteProfessional(professionalId)) {
                System.out.println("Deletion successful for ID: " + professionalId);
                session.invalidate();
                response.sendRedirect("index.jsp?deleteSuccess=true");
            } else {
                System.out.println("Deletion failed for ID: " + professionalId);
                response.sendRedirect("professionalProfile.jsp?deleteError=true");
            }
        } catch (Exception e) {
            System.err.println("Error during deletion:");
            e.printStackTrace();
            response.sendRedirect("professionalProfile.jsp?deleteError=true");
        }
    }
}