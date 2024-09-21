package com.dao;

import com.beans.Admin;
import com.beans.AdminReviews;
import com.dao.AdminPackagesDAO.AdminRowMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class AdminReviewsDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<AdminReviews> getAllReviews() {
    	String sql = "SELECT r.review_id, r.review_date, r.jobSeekerId, r.companyId, r.rating, r.review_text, " +
                "CASE WHEN r.jobSeekerId IS NOT NULL THEN u.name ELSE c.company_name END AS reviewer_name, " +  // Get name from users table
                "CASE WHEN r.jobSeekerId IS NOT NULL THEN js.image ELSE c.company_photo END AS reviewer_photo, " +
                "CASE WHEN r.jobSeekerId IS NOT NULL THEN u.name ELSE c.company_name END AS reviewer_display " +  // Display user first_name or company_name
                "FROM WebsiteReviews r " +
                "LEFT JOIN jobseekers js ON r.jobSeekerId = js.job_seeker_id " +
                "LEFT JOIN users u ON js.user_id = u.user_id " +  
                "LEFT JOIN companies c ON r.companyId  = c.company_id";
        
        return jdbcTemplate.query(sql, new AdminReviewsRowMapper());
    }

    public void deleteReviewById(long reviewId) {
        try {
            String sql = "DELETE FROM Websitereviews WHERE review_id = ?";
            jdbcTemplate.update(sql, reviewId);
        } catch (DataAccessException e) {
            // Log the error
            System.err.println("Error deleting review: " + e.getMessage());
        }
    }

    
    private static class AdminReviewsRowMapper implements RowMapper<AdminReviews> {
        @Override
        public AdminReviews mapRow(ResultSet rs, int rowNum) throws SQLException {
            AdminReviews review = new AdminReviews();
            review.setReviewId(rs.getLong("review_id"));
            review.setJobSeekerId(rs.getInt("jobSeekerId"));
            review.setCompanyId(rs.getInt("companyId"));
            review.setReviewerName(rs.getString("reviewer_name"));
            review.setReviewerPhoto(rs.getString("reviewer_photo"));
            review.setReviewerRole(rs.getString("reviewer_display")); // Use reviewer_display if needed
            review.setRating(rs.getInt("rating"));
            review.setReviewText(rs.getString("review_text"));
            review.setReviewDate(rs.getTimestamp("review_date"));
            return review;
        }
    }
    private static final class AdminRowMapper implements RowMapper<Admin> {
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
