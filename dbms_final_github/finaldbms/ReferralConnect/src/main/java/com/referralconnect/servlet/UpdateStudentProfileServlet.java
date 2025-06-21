package com.referralconnect.servlet;

import com.referralconnect.dao.StudentDAO;
import com.referralconnect.model.Student;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateStudentProfile")
public class UpdateStudentProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String resume = request.getParameter("resume_url");
        String experience = request.getParameter("experience");
        String photo = request.getParameter("photo_url");

        // Update student object
        student.setName(name);
        student.setResumeUrl(resume);
        student.setExperience(experience);
        student.setPhotoUrl(photo);

        // Update in DB
        boolean updated = StudentDAO.updateStudentProfile(student);
        if (updated) {
            session.setAttribute("student", student); // Update session object
            response.sendRedirect("studentDashboard.jsp");
        } else {
            response.getWriter().println("Error updating profile.");
        }
    }
}