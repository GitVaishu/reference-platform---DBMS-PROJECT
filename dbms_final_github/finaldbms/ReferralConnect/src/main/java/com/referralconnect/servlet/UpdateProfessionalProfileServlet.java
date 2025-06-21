package com.referralconnect.servlet;

import com.referralconnect.dao.ProfessionalDAO;
import com.referralconnect.model.Professional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateProfessionalProfile")
public class UpdateProfessionalProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Professional professional = (Professional) session.getAttribute("professional");

        if (professional == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String org = request.getParameter("organization");
        String field = request.getParameter("field");

        professional.setName(name);
        professional.setOrganization(org);
        professional.setField(field);

        boolean updated = ProfessionalDAO.updateProfessionalProfile(professional);
        if (updated) {
            session.setAttribute("professional", professional);
            response.sendRedirect("professionalDashboard.jsp");
        } else {
            response.getWriter().println("Error updating profile.");
        }
    }
}
