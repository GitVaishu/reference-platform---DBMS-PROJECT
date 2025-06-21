package com.referralconnect.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/referral_db_2";
    private static final String USER = "root";
    private static final String PASSWORD = "Pandule@123";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    public boolean testConnection() {
        try (Connection conn = DBConnection.getConnection()) {
            return conn.isValid(2); 
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
