package com.dao;

import com.beans.Admin;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class AdminDAO {
    
    private JdbcTemplate jdbcTemplate;

    public AdminDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public static final class AdminRowMapper implements RowMapper<Admin> {
        @Override
        public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
            Admin admin = new Admin();
            admin.setAdminId(rs.getInt("admin_id"));
            admin.setFirstName(rs.getString("first_name"));
            admin.setEmail(rs.getString("email"));
            admin.setPassword(rs.getString("password"));
            admin.setAdminPhoto(rs.getString("admin_photo"));
            admin.setUserId(rs.getInt("user_id")); // Add this line to map user_id
            return admin;
        }
    }

    public Admin getAdminById(Integer adminId) {
        String sql = "SELECT * FROM Admins WHERE admin_id = ?";
        return jdbcTemplate.queryForObject(sql, new AdminRowMapper(), adminId);
    }
    
    public Admin getAdminByDefaultId() {
        return getAdminById(1);
    }

    public void updateAdminPhoto(Integer adminId, String fileName) {
        String sql = "UPDATE Admins SET admin_photo = ? WHERE admin_id = ?";
        jdbcTemplate.update(sql, fileName, adminId);
    }

    public void deleteAdminPhoto(Integer adminId) {
        String defaultPhotoPath = "default_profile.jpg"; // Path to default photo
        String sql = "UPDATE Admins SET admin_photo = ? WHERE admin_id = ?";
        jdbcTemplate.update(sql, defaultPhotoPath, adminId);
    }

    // Method to update the Admin and corresponding User based on user_id
    public void updateAdmin(Admin admin) {
        // Update the Admin table
        String updateAdminSql = "UPDATE Admins SET first_name = ?, email = ?, password = ? WHERE admin_id = ?";
        jdbcTemplate.update(updateAdminSql, admin.getFirstName(), admin.getEmail(), admin.getPassword(), admin.getAdminId());

        // Update the Users table where user_id matches
        String updateUserSql = "UPDATE Users SET username = ?, email = ?, password_hash = ? WHERE user_id = ?";
        jdbcTemplate.update(updateUserSql, admin.getFirstName(), admin.getEmail(), admin.getPassword(), admin.getUserId());
    }
}
