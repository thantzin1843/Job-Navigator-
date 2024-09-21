package com.dao;

import com.model.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.model.Company;

public class UserDao {
    private JdbcTemplate jdbcTemplate;
    private PasswordEncoder passwordEncoder;

    // Setter for JdbcTemplate
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public PasswordEncoder getPasswordEncoder() {
        return passwordEncoder;
    }

    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    // Method to register a user and return the generated userId
    public User registerUser(User user) {
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        String sql = "INSERT INTO Users (name, email, password_hash, username, phone, role) VALUES (?, ?, ?, ?, ?, ?)";
       

        // Get the generated userId
//        String getIdSql = "SELECT LAST_INSERT_ID() from users";
//        int userId = jdbcTemplate.queryForObject(getIdSql, Integer.class);
//        System.out.println(userId);
//        // Set the userId on the user object
//        user.setId(userId);
        // Use KeyHolder to retrieve the generated userId
        KeyHolder keyHolder = new GeneratedKeyHolder();
        
        // Perform the insert and retrieve the generated key
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, hashedPassword);
            ps.setString(4, user.getUsername());
            ps.setString(5, user.getPhone());
            ps.setString(6, user.getRole());
            return ps;
        }, keyHolder);

        // Get the generated userId from KeyHolder
        int userId = keyHolder.getKey().intValue();

        // Set the userId on the user object
        user.setId(userId);
        
        System.out.println(userId); // For debugging purposes
      
        

        return user;
    }

    // Method to retrieve user by email
    public User getUserByEmail(String email) {
        try {
            String sql = "SELECT * FROM Users WHERE email = ?";
            return jdbcTemplate.queryForObject(sql, new Object[]{email}, new UserRowMapper());
        } catch (EmptyResultDataAccessException e) {
            return null;  // or throw a custom exception, or return an optional
        }
    }

    // Method to validate a user
    public User findByEmailAndPassword(String email, String password, String role) {
        User user = getUserByEmail(email); // Fetch user by email
        if (user != null && passwordEncoder.matches(password, user.getPasswordHash()) && user.getRole().equals(role)) {
            return user;
        }
        return null;
    }

    // RowMapper implementation for mapping result set to User object
    private static final class UserRowMapper implements RowMapper<User> {
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getInt("user_id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPasswordHash(rs.getString("password_hash"));
            user.setUsername(rs.getString("username"));
            user.setPhone(rs.getString("phone"));
            user.setRole(rs.getString("role"));
            return user;
        }
    }
    
    //get the jobseekers id by user id
    public Integer getJobSeekerIdByUserId(int userId) {
        String sql = "SELECT job_seeker_id FROM jobseekers WHERE user_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{userId}, Integer.class);
        } catch (EmptyResultDataAccessException e) {
            // Handle the case when no result is found
            return null;
        }
    }
    
    public Integer getCompanyIdByUserId(int userId) {
        String sql = "SELECT company_id FROM companies WHERE user_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{userId}, Integer.class);
        } catch (EmptyResultDataAccessException e) {
            // Handle the case when no result is found
            return null;
        }
    }
    
   
}
