package com.dao;

import com.model.JobSeeker;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class JobSeekerDao {
	private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Method to register a job seeker
    public boolean registerJobSeeker(JobSeeker jobSeeker) {
        String sql = "INSERT INTO JobSeekers (user_id) VALUES (?)";
        int rowsAffected = jdbcTemplate.update(sql, jobSeeker.getUserId());
        return rowsAffected > 0;
    }

    // Get job seeker by user ID
    public JobSeeker getJobSeekerByUserId(int userId) {
        String sql = "SELECT * FROM JobSeekers WHERE user_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{userId}, new JobSeekerRowMapper());
    }

    // RowMapper implementation
    private static final class JobSeekerRowMapper implements RowMapper<JobSeeker> {
        public JobSeeker mapRow(ResultSet rs, int rowNum) throws SQLException {
            JobSeeker jobSeeker = new JobSeeker();
            jobSeeker.setId(rs.getInt("job_seeker_id"));
            jobSeeker.setAge(rs.getInt("age"));
            jobSeeker.setUserId(rs.getInt("user_id"));
            jobSeeker.setAddress(rs.getString("address"));
            jobSeeker.setDob(rs.getString("dob"));
            jobSeeker.setBio(rs.getString("bio"));
            jobSeeker.setResumePath(rs.getString("cv"));
            //jobSeeker.setPosition(rs.getString("position"));
            jobSeeker.setImage(rs.getString("image"));
            return jobSeeker;
        }
    }
}
