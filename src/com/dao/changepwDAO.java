package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class changepwDAO {

    @Autowired
    private DataSource dataSource;

    // Method to get the password hash from the database
    public String getPasswordHashByUserId(int userId) {
        String passwordHash = null;
        String query = "SELECT password_hash FROM users WHERE user_id = ?";
        
        try (Connection connection = dataSource.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                passwordHash = rs.getString("password_hash");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return passwordHash;
    }

    // Method to update the password in the database
    public boolean updatePassword(int userId, String newPasswordHash) {
        String query = "UPDATE users SET password_hash = ? WHERE user_id = ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, newPasswordHash);
            pstmt.setInt(2, userId);
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

