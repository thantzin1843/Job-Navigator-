package com.dao;

import com.model.Testimonial;
import com.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
@Repository
public class TestimonialDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Testimonial> getAllTestimonials() {
    	String query = "SELECT wr.review_id, wr.rating, wr.review_text, u.username, u.role " +
                "FROM WebsiteReviews wr " +
                "LEFT JOIN JobSeekers js ON wr.jobSeekerId = js.job_seeker_id " +
                "LEFT JOIN Companies c ON wr.companyId = c.company_id " +
                "LEFT JOIN Users u ON (js.user_id = u.user_id OR c.user_id = u.user_id) " +
                "WHERE (wr.jobSeekerId IS NOT NULL AND wr.companyId IS NULL) " +
                "OR (wr.companyId IS NOT NULL AND wr.jobSeekerId IS NULL)";

                        
        return jdbcTemplate.query(query, new RowMapper<Testimonial>() {
            @Override
            public Testimonial mapRow(ResultSet rs, int rowNum) throws SQLException {
                Testimonial testimonial = new Testimonial();
                testimonial.setReview_id(rs.getInt("review_id"));
                testimonial.setRating(rs.getInt("rating"));
                testimonial.setReviewText(rs.getString("review_text"));
               

//                Timestamp postedTimestamp = rs.getTimestamp("review_date");
//                if (postedTimestamp != null) {
//                    LocalDateTime postedDateTime = postedTimestamp.toLocalDateTime();
//                    LocalDateTime now = LocalDateTime.now();
//
//                    if (postedDateTime.toLocalDate().isEqual(now.toLocalDate())) {
//                        // If posted today, calculate hours ago
//                        long hoursAgo = ChronoUnit.HOURS.between(postedDateTime, now);
//                       
//                        if (hoursAgo > 0) {
//                            // If more than 0 hours ago
//                        	testimonial.setReview_date(hoursAgo + " hours ago");
//                        } else {
//                            // Calculate minutes ago
//                            long minutesAgo = ChronoUnit.MINUTES.between(postedDateTime, now);
//                            testimonial.setReview_date(minutesAgo + " minutes ago");
//                        }
//                    } else {
//                        // If not posted today, show the actual posted date
//                        String formattedDate = postedDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//                        testimonial.setReview_date(formattedDate);
//                    }
//                    
//                }
                
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
                

                testimonial.setUser(user);
                

                return testimonial;
            }
        });
    }
}