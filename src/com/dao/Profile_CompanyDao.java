package com.dao;

import com.beans.Profile_Company;
import com.beans.Profile_Job;
import com.beans.Review;
import com.beans.SocialMediaAccount;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class Profile_CompanyDao extends AbstractDAO {

	@Autowired
    public Profile_CompanyDao(DataSource dataSource) {
        super(dataSource);
    }

    // Method to get company by ID
    public Profile_Company getCompanyById(int companyId) {
        String sql = "SELECT * FROM Companies WHERE company_id = ?";
        Profile_Company company = jdbcTemplate.queryForObject(sql, new Object[] { companyId }, new CompanyRowMapper());

        // Fetch job details related to the company
        List<Profile_Job> jobs = getJobsByCompanyId(companyId);
        company.setJobs(jobs); // Set the list of jobs in the company object

        // Fetch social media accounts related to the company
        List<SocialMediaAccount> socialMediaAccounts = getSocialMediaAccountsByCompanyId(companyId);
        company.setSocialMediaAccounts(socialMediaAccounts); // Set social media accounts

        // Fetch reviews related to the company
       List<Review> reviews = getReviewsByCompanyId(companyId);
       company.setReviews(reviews); // Set reviews

        return company;
    }

    // Method to get social media accounts by company ID
    public List<SocialMediaAccount> getSocialMediaAccountsByCompanyId(int companyId) {
        String sql = "SELECT account_id, platform, account_url FROM SocialMediaAccounts WHERE company_id = ?";
        return jdbcTemplate.query(sql, new Object[] { companyId }, new SocialMediaAccountRowMapper());
    }

    // Method to get jobs by company ID
    public List<Profile_Job> getJobsByCompanyId(int companyId) {
        String sql = "SELECT j.job_title, j.employment_type, j.working_setting, j.job_id, c.location " + 
                     "FROM Jobs j JOIN Companies c ON j.company_id = c.company_id " + 
                     "WHERE j.company_id = ?";
        return jdbcTemplate.query(sql, new Object[] { companyId }, new JobRowMapper());
    }
    public List<Review> getReviewsByCompanyId(int companyId) {
    	String sql = "SELECT r.review_id, r.company_id, r.job_seeker_id, r.rating, r.review_text, r.review_date, " +
                "js.image, js.position, u.username, u.email " + // Add fields from the users table if needed
                "FROM companyreviews r " +
                "LEFT JOIN jobseekers js ON r.job_seeker_id = js.job_seeker_id " +
                "LEFT JOIN users u ON js.user_id = u.user_id " + // Join with users table
                "WHERE r.company_id = ?";


        return jdbcTemplate.query(sql, new Object[]{companyId}, new ReviewRowMapper());
    }

    public int getJobCountByCompanyId(int companyId) {
		String sql = "SELECT COUNT(*) FROM Jobs WHERE company_id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { companyId }, Integer.class);
	}
    // RowMapper implementation to map ResultSet to Company object
    private static final class CompanyRowMapper implements RowMapper<Profile_Company> {
        @Override
        public Profile_Company mapRow(ResultSet rs, int rowNum) throws SQLException {
            Profile_Company company = new Profile_Company();
            company.setCompanyId(rs.getInt("company_id"));
            company.setUserId(rs.getInt("user_id"));
            company.setCompanyName(rs.getString("company_name"));
            company.setCompanyPhoto(rs.getString("company_photo"));
            company.setLocation(rs.getString("location"));
            company.setPhoneNumber(rs.getString("phone_number"));
            company.setIndustryType(rs.getString("industry_type"));
            company.setCompanySize(rs.getString("company_size"));
            company.setWorkingPolicy(rs.getString("working_policy"));
            company.setDescription(rs.getString("description"));
            company.setBenefits(rs.getString("benefits")); // Set benefits field
            return company;
        }
    }

    // RowMapper implementation to map ResultSet to Job object
    private static final class JobRowMapper implements RowMapper<Profile_Job> {
        @Override
        public Profile_Job mapRow(ResultSet rs, int rowNum) throws SQLException {
        	Profile_Job job = new Profile_Job();
            job.setJobId(rs.getInt("job_id"));
            job.setJobTitle(rs.getString("job_title"));
            job.setEmploymentType(rs.getString("employment_type"));
            job.setWorkingSetting(rs.getString("working_setting"));
            job.setLocation(rs.getString("location"));
            // Location from Companies table
            return job;
        }
    }

    // RowMapper implementation to map ResultSet to SocialMediaAccount object
    private static final class SocialMediaAccountRowMapper implements RowMapper<SocialMediaAccount> {
        @Override
        public SocialMediaAccount mapRow(ResultSet rs, int rowNum) throws SQLException {
            SocialMediaAccount account = new SocialMediaAccount();
            account.setAccountId(rs.getInt("account_id"));;
            account.setPlatform(rs.getString("platform"));
            account.setAccountUrl(rs.getString("account_url"));
            return account;
        }
    }
    private static final class ReviewRowMapper implements RowMapper<Review> {
        @Override
        public Review mapRow(ResultSet rs, int rowNum) throws SQLException {
            Review review = new Review();
            review.setReviewId(rs.getLong("review_id"));
            review.setCompanyId(rs.getInt("company_id"));
            review.setJobSeekerId(rs.getInt("job_seeker_id"));
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


}
