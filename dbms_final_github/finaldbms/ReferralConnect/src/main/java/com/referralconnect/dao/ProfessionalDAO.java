package com.referralconnect.dao;
import java.util.*;


import com.referralconnect.model.Professional;
//import com.referralconnect.dao.DBConnection;

import java.sql.*;

public class ProfessionalDAO {

    // Save new professional to database
    public static boolean registerProfessional(Professional professional) {
        String sql = "INSERT INTO professionals (name, email, password, organization, field) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, professional.getName());
            stmt.setString(2, professional.getEmail());
            stmt.setString(3, professional.getPassword());
            stmt.setString(4, professional.getOrganization());
            stmt.setString(5, professional.getField());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Login professional using email + password
    public static Professional loginProfessional(String email, String password) {
        String sql = "SELECT * FROM professionals WHERE email = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Professional professional = new Professional();
                professional.setName(rs.getString("name"));
                professional.setEmail(rs.getString("email"));
                professional.setPassword(rs.getString("password"));
                professional.setOrganization(rs.getString("organization"));
                professional.setField(rs.getString("field"));
                professional.setProfessionalId(rs.getInt("professional_id"));
                return professional;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static boolean updateProfessionalProfile(Professional professional) {
        String sql = "UPDATE professionals SET name = ?, organization = ?, field = ? WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, professional.getName());
            stmt.setString(2, professional.getOrganization());
            stmt.setString(3, professional.getField());
            stmt.setString(4, professional.getEmail());

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    public static List<Professional> getAllProfessionals() {
        List<Professional> list = new ArrayList<>();
        String sql = "SELECT * FROM professionals";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Professional p = new Professional();
                p.setName(rs.getString("name"));
                p.setEmail(rs.getString("email"));
                p.setField(rs.getString("field"));
                p.setOrganization(rs.getString("organization"));
                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public boolean softDeleteProfessional(int professionalId) {
        String updateReferences = "UPDATE reference_requests SET professional_id = NULL WHERE professional_id = ?";
        String insertBackup = "INSERT INTO professionals_backup (professional_id, name, email, password, organization, field) SELECT professional_id, name, email, password, organization, field FROM professionals WHERE professional_id = ?";
        String deleteOriginal = "DELETE FROM professionals WHERE professional_id = ?";

        Connection conn = null;
        PreparedStatement updateStmt = null;
        PreparedStatement backupStmt = null;
        PreparedStatement deleteStmt = null;

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            // 1. Update references first
            updateStmt = conn.prepareStatement(updateReferences);
            updateStmt.setInt(1, professionalId);
            updateStmt.executeUpdate();

            // 2. Backup the professional
            backupStmt = conn.prepareStatement(insertBackup);
            backupStmt.setInt(1, professionalId);
            backupStmt.executeUpdate();

            // 3. Delete the original
            deleteStmt = conn.prepareStatement(deleteOriginal);
            deleteStmt.setInt(1, professionalId);
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
