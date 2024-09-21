package com.dao;

import com.beans.WebReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class WebReviewDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public WebReviewDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private static final class WebReviewMapper implements RowMapper<WebReview> {
        @Override
        public WebReview mapRow(ResultSet rs, int rowNum) throws SQLException {
            WebReview review = new WebReview();
            review.setReviewId(rs.getLong("review_id")); // Ensure to use getLong for Long type
            review.setJobSeekerId(rs.getInt("jobSeekerId"));
            review.setCompanyId(rs.getInt("companyId"));
            review.setReviewerRole(rs.getString("reviewer_role"));
            review.setRating(rs.getInt("rating"));
            review.setReviewText(rs.getString("review_text"));
            review.setReviewDate(rs.getTimestamp("review_date"));
            return review;
        }
    }

    public void addReview(WebReview review) {
        String sql = "INSERT INTO websitereviews (jobSeekerId, companyId, reviewer_role, rating, review_text, review_date) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, review.getJobSeekerId(), review.getCompanyId(), review.getReviewerRole(), review.getRating(), review.getReviewText(), review.getReviewDate());
    }

    public List<WebReview> getReviewsByCompanyId(int companyId) {
        String sql = "SELECT * FROM websitereviews WHERE companyId = ?";
        return jdbcTemplate.query(sql, new Object[]{companyId}, new WebReviewMapper());
    }
}
