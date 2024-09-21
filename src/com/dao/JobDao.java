package com.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import com.beans.Job;
import com.beans.Company;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

@Repository
public class JobDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JobDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Job> getAllJobs() {
        String sql = "SELECT j.job_id, j.job_title, j.salary_amount, j.salaryType, c.company_name, c.location, j.employment_type, j.working_setting, j.job_summary, j.is_negotiable, j.posted_at " +
                     "FROM Jobs j " +
                     "JOIN Companies c ON j.company_id = c.company_id " +
                     "ORDER BY j.posted_at";

        return jdbcTemplate.query(sql, new RowMapper<Job>() {
            @Override
            public Job mapRow(ResultSet rs, int rowNum) throws SQLException {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));

                // Handle salary safely
                String salaryStr = rs.getString("salary_amount");
                try {
                    job.setSalary(Double.parseDouble(salaryStr));
                } catch (NumberFormatException e) {
                    job.setSalary(0.0); // Set a default value or handle the error
                    System.err.println("Invalid salary value: " + salaryStr);
                }
                job.setSalaryType(rs.getString("salaryType"));
                job.setCompanyName(rs.getString("company_name"));
                job.setLocation(rs.getString("location"));
                job.setEmploymentType(rs.getString("employment_type"));
                job.setWorkingSetting(rs.getString("working_setting"));
                job.setJobSummary(rs.getString("job_summary"));
                job.setNegotiable(rs.getBoolean("is_negotiable"));

                Timestamp postedTimestamp = rs.getTimestamp("posted_at");
                if (postedTimestamp != null) {
                    LocalDateTime postedDateTime = postedTimestamp.toLocalDateTime();
                    LocalDateTime now = LocalDateTime.now();

                    if (postedDateTime.toLocalDate().isEqual(now.toLocalDate())) {
                        long hoursAgo = ChronoUnit.HOURS.between(postedDateTime, now);
                        if (hoursAgo > 0) {
                            job.setPostedAt(hoursAgo + " hours ago");
                        } else {
                            long minutesAgo = ChronoUnit.MINUTES.between(postedDateTime, now);
                            job.setPostedAt(minutesAgo + " minutes ago");
                        }
                    } else {
                        job.setPostedAt(postedDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                    }
                }
                return job;
            }
        });
    }
    
    public List<String> getDistinctLocations() {
        String sql = "SELECT DISTINCT c.location " +
                     "FROM Companies c " +
                     "JOIN Jobs j ON c.company_id = j.company_id " +
                     "ORDER BY c.location";

        return jdbcTemplate.query(sql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getString("location");
            }
        });
    }
    
   
   //for company search
    public List<Company> getAllCompanies() {
        String sql = "SELECT company_id, company_name, location, working_policy, company_photo FROM Companies";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Company.class));
    }
    
    public List<Company> getCompaniesByName(String companyName) {
        String sql = "SELECT company_id, company_name, location, working_policy, company_photo FROM Companies WHERE company_name LIKE ?";
        String searchPattern = "%" + companyName + "%"; 

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Company.class), searchPattern);
    }

}
