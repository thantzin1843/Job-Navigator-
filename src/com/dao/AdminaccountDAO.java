package com.dao;

import com.beans.Admin;
import com.beans.Adminaccounts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class AdminaccountDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Adminaccounts> getAllAdminAccounts() {
        String sql = "SELECT u.user_id, u.email, u.password_hash, u.role, "
                   + "c.company_id, c.company_name, c.location, "
                   + "j.job_seeker_id, u.name, j.address "
                   + "FROM users u "
                   + "LEFT JOIN companies c ON u.user_id = c.user_id "
                   + "LEFT JOIN jobseekers j ON u.user_id = j.user_id";

        return jdbcTemplate.query(sql, new AdminAccountRowMapper());
        
    }

    private static final class AdminAccountRowMapper implements RowMapper<Adminaccounts> {
        @Override
        public Adminaccounts mapRow(ResultSet rs, int rowNum) throws SQLException {
            Adminaccounts adminAccount = new Adminaccounts();
            adminAccount.setUserId(rs.getInt("user_id"));
            adminAccount.setEmail(rs.getString("email"));
            adminAccount.setPasswordHash(rs.getString("password_hash"));
            adminAccount.setUserrole(rs.getString("role"));
            // Company Details
            adminAccount.setCompanyId(rs.getObject("company_id") != null ? rs.getInt("company_id") : null);
            adminAccount.setCompanyName(rs.getString("company_name"));
            adminAccount.setLocation(rs.getString("location"));

            // Job Seeker Details
            adminAccount.setJobSeekerId(rs.getObject("job_seeker_id") != null ? rs.getInt("job_seeker_id") : null);
            adminAccount.setFirstName(rs.getString("name"));
            adminAccount.setAddress(rs.getString("address"));

            return adminAccount;
        }
    }
    public static final class AdminRowMapper implements RowMapper<Admin> {
        @Override
        public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
            Admin admin = new Admin();
            admin.setAdminId(rs.getInt("admin_id"));
            admin.setFirstName(rs.getString("first_name"));
            admin.setLastName(rs.getString("last_name"));
            admin.setEmail(rs.getString("email"));
            admin.setPassword(rs.getString("password"));
            admin.setAdminPhoto(rs.getString("admin_photo"));
            return admin;
        }
    }

    public Admin getAdminById(Long adminId) {
        String sql = "SELECT * FROM Admins WHERE admin_id = ?";
        return jdbcTemplate.queryForObject(sql, new AdminRowMapper(), adminId);
    }

}  
