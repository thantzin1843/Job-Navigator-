package com.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;


import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.beans.Review;


@Repository
public class ReviewDAO extends AbstractDAO {

	public ReviewDAO(DataSource dataSource) {
		super(dataSource);
	}

    // Method to get reviews by companyId
	public List<Review> getReviewsByCompanyId(int companyId) {
		String sql = "SELECT r.review_id, r.company_id, r.job_seeker_id, r.rating, r.review_text, r.review_date, " +
	             "js.image, js.position, u.name " + // Add fields from the users table if needed
	             "FROM companyreviews r " +
	             "LEFT JOIN jobseekers js ON r.job_seeker_id = js.job_seeker_id " +
	             "LEFT JOIN users u ON js.user_id = u.user_id " + // Join with users table
	             "WHERE r.company_id = ?";


	    return jdbcTemplate.query(sql, new Object[]{companyId}, new ReviewRowMapper());
	}


    // RowMapper for mapping ResultSet to Review object
	private static final class ReviewRowMapper implements RowMapper<Review> {
	    @Override
	    public Review mapRow(ResultSet rs, int rowNum) throws SQLException {
	        Review review = new Review();
	        review.setReviewId(rs.getLong("review_id"));
	        review.setCompanyId(rs.getInt("company_id"));
	        review.setJobSeekerId(rs.getInt("job_seeker_id"));
	        review.setName(rs.getString("name"));	       
	        review.setPosition(rs.getString("position"));
	        review.setRating(rs.getInt("rating"));
	        review.setReviewText(rs.getString("review_text"));
	        review.setReviewDate(rs.getTimestamp("review_date"));
	        review.setJobSeekerPhoto(rs.getString("image")); // Ensure this is set
	        return review;
	    }
	}
	public void addCompanyReview(int companyId, int jobSeekerId, int rating, String reviewText) {
        String sql = "INSERT INTO companyreviews (company_id, job_seeker_id, rating, review_text, review_date) " +
                     "VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)";
        jdbcTemplate.update(sql, companyId, jobSeekerId, rating, reviewText);
    }
	
	 public void deleteReview(int reviewId) {
	        String sql = "DELETE FROM companyreviews WHERE review_id = ?";
	        jdbcTemplate.update(sql, reviewId);
	    }


}
