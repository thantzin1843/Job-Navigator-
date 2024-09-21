package com.dao;
import java.util.Map;
import com.beans.AdminDashboard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDDao {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	
    public int getUserCount() {
        String sql = "SELECT COUNT(*) FROM users";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
    
    public int getJSCount() {
        String sql = "SELECT COUNT(*) FROM users where role='JobSeeker'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
    
    public int getCompanyCount() {
        String sql = "SELECT COUNT(*) FROM users where role='Company'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
    
    public int getJobsCount() {
        String sql = "SELECT COUNT(*) FROM jobs";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
    
    public int getWebsiteReviewCount() {
    	String sql = "SELECT COUNT(*) FROM WebsiteReviews;";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
    
    public double calculateAverageRating() {
        String sql = "SELECT AVG(rating) AS average_rating FROM WebsiteReviews";
        
        Double averageRating = jdbcTemplate.queryForObject(sql, Double.class);
        
        if (averageRating == null) {
            return 0.0; 
        }
        return averageRating;
    }
    
    public int getPackagePoints() {
    	String sql = "SELECT COUNT(*) FROM  pointspackages;";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    	
    }
    
    public int getPayment() {
    	String sql = "SELECT COUNT(*) FROM payments;";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    	
    }
    
    public int getPending() {
    	String sql = "SELECT COUNT(*) FROM payments where payment_status = 'Pending' ;";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    	
    }
    
    public int getApprove() {
    	String sql = "SELECT COUNT(*) FROM payments where payment_status = 'Approved' ";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    	
    }
    
    public int getCancelled() {
    	String sql = "SELECT COUNT(*) FROM payments where payment_status = 'Cancelled' ";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    	
    }

}
