package com.referralconnect.servlet;

import com.referralconnect.model.Student;
import com.referralconnect.dao.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/registerStudent")
public class RegisterStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String resume = request.getParameter("resume");
        String experience = request.getParameter("experience");
        String photo = request.getParameter("photo");

        Student student = new Student(name, email, password, resume, experience, photo);
        boolean result = StudentDAO.registerStudent(student);

        if (result) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration failed. Try again.");
        }
    }
}