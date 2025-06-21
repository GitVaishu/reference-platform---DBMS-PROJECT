package com.referralconnect.dao;
//import java.sql.Timestamp;
import com.referralconnect.model.ReferenceRequest;
import java.sql.*;
import java.util.*;

public class ReferenceRequestDAO {

	
	public static boolean sendRequest(String studentEmail, String professionalEmail, String message) {
        String sql = "INSERT INTO reference_requests (student_id, professional_id, status, message,request_date) VALUES (?, ?, ?, ?, NOW())";

        int studentId = getStudentIdByEmail(studentEmail);
        int professionalId = getProfessionalIdByEmail(professionalEmail);

        if (studentId == -1 || professionalId == -1) {
            System.out.println("Error: Invalid student or professional email.");
            return false;
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, studentId);
            stmt.setInt(2, professionalId);
            stmt.setString(3, "Pending"); // Set status as Pending
            stmt.setString(4, message);   // Set the message

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    private static int getStudentIdByEmail(String email) {
        String sql = "SELECT student_id FROM students WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("student_id");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    private static int getProfessionalIdByEmail(String email) {
        String sql = "SELECT professional_id FROM professionals WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("professional_id");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static boolean updateRequestStatus(int requestId, String status) {
        String sql = "UPDATE reference_requests SET status = ? WHERE request_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, status);
            stmt.setInt(2, requestId);

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<ReferenceRequest> getRequestsByStudent(String studentEmail) {
        List<ReferenceRequest> list = new ArrayList<>();
        String sql = "SELECT rr.request_id, p.email AS professional_email, rr.status, rr.request_date, rr.message, s.resume_url " +
                "FROM reference_requests rr " +
                "JOIN students s ON rr.student_id = s.student_id " +
                "JOIN professionals p ON rr.professional_id = p.professional_id " +
                "WHERE s.email = ?";


        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, studentEmail);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ReferenceRequest r = new ReferenceRequest();
                r.setId(rs.getInt("request_id"));
                r.setStudentEmail(studentEmail);
                r.setProfessionalEmail(rs.getString("professional_email"));
                r.setStatus(rs.getString("status"));
                r.setRequestDate(rs.getTimestamp("request_date"));
                r.setMessage(rs.getString("message")); // ✅ Now it will be fetched correctly
                r.setResumeUrl(rs.getString("resume_url"));
                list.add(r);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    public static List<ReferenceRequest> getRequestsByProfessional(String professionalEmail) {
        List<ReferenceRequest> list = new ArrayList<>();
        
        String sql = "SELECT rr.request_id, s.email AS student_email, s.resume_url, rr.status, rr.request_date, rr.message " +
                "FROM reference_requests rr " +
                "JOIN professionals p ON rr.professional_id = p.professional_id " +
                "JOIN students s ON rr.student_id = s.student_id " +
                "WHERE p.email = ?";


        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, professionalEmail);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ReferenceRequest r = new ReferenceRequest();
                r.setId(rs.getInt("request_id"));
                r.setProfessionalEmail(professionalEmail);
                r.setStudentEmail(rs.getString("student_email"));
                r.setStatus(rs.getString("status"));
                r.setRequestDate(rs.getTimestamp("request_date"));
                r.setMessage(rs.getString("message")); // Now safe to access
                r.setResumeUrl(rs.getString("resume_url"));
                list.add(r);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
