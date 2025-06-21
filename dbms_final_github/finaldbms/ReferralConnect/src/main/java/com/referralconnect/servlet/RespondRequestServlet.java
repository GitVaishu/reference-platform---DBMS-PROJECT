package com.referralconnect.servlet;

import com.referralconnect.dao.ReferenceRequestDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/respondRequest")
public class RespondRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String action = request.getParameter("action"); // "Accepted" or "Rejected"

        boolean updated = ReferenceRequestDAO.updateRequestStatus(requestId, action);
        if (updated) {
            response.sendRedirect("viewReceivedRequests.jsp");
        } else {
            response.getWriter().println("Failed to update status.");
        }
    }
}
