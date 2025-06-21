
package com.referralconnect.dao;

import com.referralconnect.model.Professional;
import com.referralconnect.model.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO {
    
    // Method to register a new student
    public static boolean registerStudent(Student student) {
        String sql = "INSERT INTO students(name, email, password, resume_url, experience, photo_url) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPassword()); // Optionally hash the password before saving it
            stmt.setString(4, student.getResumeUrl());
            stmt.setString(5, student.getExperience());
            stmt.setString(6, student.getPhotoUrl());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0; // Return true if the student was successfully registered

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Return false if registration failed
    }

    // Method to login a student
    public static Student loginStudent(String email, String password) {
        String sql = "SELECT * FROM students WHERE email = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);  // Ideally, hash and check the password securely
            
            ResultSet rs = stmt.executeQuery();

//            if (rs.next()) {
//                // If a matching record is found, return the student object
//                return new Student(
//                    rs.getString("name"),
//                    rs.getString("email"),
//                    rs.getString("password"),
//                    rs.getString("resume_url"),
//                    rs.getString("experience"),
//                    rs.getString("photo_url")
//                    rs.getInt("student_id"));
//
//                
//            }
            if (rs.next()) {
                Student student = new Student();
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPassword(rs.getString("password"));
                student.setResumeUrl(rs.getString("resume_url"));
                student.setExperience(rs.getString("experience"));
                student.setPhotoUrl(rs.getString("photo_url"));
                student.setstudentId(rs.getInt("student_id"));
                return student;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;  // Return null if login is unsuccessful
    }
    
    public static boolean updateStudentProfile(Student student) {
        String sql = "UPDATE students SET name = ?, resume_url = ?, experience = ?, photo_url = ? WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, student.getName());
            stmt.setString(2, student.getResumeUrl());
            stmt.setString(3, student.getExperience());
            stmt.setString(4, student.getPhotoUrl());
            stmt.setString(5, student.getEmail());

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean softDeleteStudent(int studentId) {
        String updateReferences = "UPDATE reference_requests SET student_id = NULL WHERE student_id = ?";
        String insertBackup = "INSERT INTO students_backup (student_id, email, password, name, resume_url, experience, photo_url) SELECT student_id, email, password, name, resume_url, experience, photo_url FROM students WHERE student_id = ?";
        String deleteOriginal = "DELETE FROM students WHERE student_id = ?";

        Connection conn = null;
        PreparedStatement updateStmt = null;
        PreparedStatement backupStmt = null;
        PreparedStatement deleteStmt = null;

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            // 1. Update references first
            updateStmt = conn.prepareStatement(updateReferences);
            updateStmt.setInt(1, studentId);
            updateStmt.executeUpdate();

            // 2. Backup the student
            backupStmt = conn.prepareStatement(insertBackup);
            backupStmt.setInt(1, studentId);
            backupStmt.executeUpdate();

            // 3. Delete the original
            deleteStmt = conn.prepareStatement(deleteOriginal);
            deleteStmt.setInt(1, studentId);
            int affectedRows = deleteStmt.executeUpdate();

            if (affectedRows > 0) {
                conn.commit();
                return true;
            }

            conn.rollback();
            return false;

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;

        } finally {
            // Close all resources in the finally block
            if (deleteStmt != null) {
                try {
                    deleteStmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (backupStmt != null) {
                try {
                    backupStmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (updateStmt != null) {
                try {
                    updateStmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    }

