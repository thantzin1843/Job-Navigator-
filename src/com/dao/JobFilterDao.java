package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import com.beans.JobFilter;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class JobFilterDao {
    private JdbcTemplate template;  
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    
    public void setTemplate(JdbcTemplate template) {  
        this.template = template;  
    }
    
    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    public List<JobFilter> getFilteredJobs(JobFilter jobFilter) {
        StringBuilder query = new StringBuilder(
            "SELECT j.job_id, j.job_title, j.salary_amount,j.salaryType, c.company_name, c.location, j.employment_type, j.working_setting, j.job_summary, j.is_negotiable,j.posted_at " +
            "FROM Jobs j " +
            "JOIN Companies c ON j.company_id = c.company_id " +
            "JOIN JobCategories jc ON j.category_id = jc.category_id "
        );

        MapSqlParameterSource parameters = new MapSqlParameterSource();
        boolean hasFilters = false;
        String categoryPattern = "%" + (jobFilter.getCategoryName() != null ? jobFilter.getCategoryName().toLowerCase() : "") + "%";
        String jobTitlePattern = "%" + (jobFilter.getJobTitle() != null ? jobFilter.getJobTitle().toLowerCase() : "") + "%";
        String companyNamePattern = "%" + (jobFilter.getCompanyName() != null ? jobFilter.getCompanyName().toLowerCase() : "") + "%";

        // Check if filters are applied
       /* if (jobFilter.getCategoryName() != null && !jobFilter.getCategoryName().isEmpty()) {
            query.append("WHERE (jc.category_name = :categoryName OR j.job_title = :categoryName) ");
            parameters.addValue("categoryName", jobFilter.getCategoryName());
            hasFilters = true;
        }
        
        if (jobFilter.getCompanyName() != null && !jobFilter.getCompanyName().isEmpty()) {
            query.append(hasFilters ? "AND " : "WHERE ");
            query.append("c.company_name = :companyName ");
            parameters.addValue("companyName", jobFilter.getCompanyName());
            hasFilters = true;
        }   */
        if (jobFilter.getCategoryName() != null && !jobFilter.getCategoryName().isEmpty()) {
            if (hasFilters) {
                query.append("OR ");
            } else {
                query.append("WHERE ");
            }
            query.append("(LOWER(jc.category_name) LIKE :categoryName OR LOWER(j.job_title) LIKE :categoryName) ");
            parameters.addValue("categoryName", categoryPattern);
            hasFilters = true;
        }
        
        if (jobFilter.getJobTitle() != null && !jobFilter.getJobTitle().isEmpty()) {
            if (hasFilters) {
                query.append("OR ");
            } else {
                query.append("WHERE ");
            }
            query.append("LOWER(j.job_title) LIKE :jobTitle ");
            parameters.addValue("jobTitle", jobTitlePattern);
            hasFilters = true;
        }
        
        if (jobFilter.getCompanyName() != null && !jobFilter.getCompanyName().isEmpty()) {
            if (hasFilters) {
                query.append("OR ");
            } else {
                query.append("WHERE ");
            }
            query.append("LOWER(c.company_name) LIKE :companyName ");
            parameters.addValue("companyName", companyNamePattern);
            hasFilters = true;
        }
        

        if (jobFilter.getLocation() != null && !jobFilter.getLocation().isEmpty()) {
            query.append(hasFilters ? "AND " : "WHERE ");
            query.append("c.location = :location ");
            parameters.addValue("location", jobFilter.getLocation());
            hasFilters = true;
        }
        
        if (jobFilter.getJobTypes() != null && jobFilter.getJobTypes().length > 0) {
            query.append(hasFilters ? "AND " : "WHERE ");
            query.append("j.employment_type IN (");
            for (int i = 0; i < jobFilter.getJobTypes().length; i++) {
                query.append(":jobType" + i);
                if (i < jobFilter.getJobTypes().length - 1) query.append(", ");
                parameters.addValue("jobType" + i, jobFilter.getJobTypes()[i]);
            }
            query.append(") ");
            hasFilters = true;
        }
        
        if (jobFilter.getWorkTypes() != null && jobFilter.getWorkTypes().length > 0) {
            query.append(hasFilters ? "AND " : "WHERE ");
            query.append("j.working_setting IN (");
            for (int i = 0; i < jobFilter.getWorkTypes().length; i++) {
                query.append(":workType" + i);
                if (i < jobFilter.getWorkTypes().length - 1) query.append(", ");
                parameters.addValue("workType" + i, jobFilter.getWorkTypes()[i]);
            }
            query.append(") ");
            hasFilters = true;
        }
        
        if (jobFilter.getMinSalary() >= 0 && jobFilter.getSalary() > 0) {
            query.append(hasFilters ? "AND " : "WHERE ");
            query.append("j.salary_amount BETWEEN :minSalary AND :maxSalary ");
            parameters.addValue("minSalary", jobFilter.getMinSalary());
            parameters.addValue("maxSalary", jobFilter.getSalary());
            System.out.println("from dao" + jobFilter.getSalary());
            hasFilters = true;  // Make sure this flag is updated after adding a filter
        }

        //query.append("ORDER BY j.job_id");
        query.append("ORDER BY j.posted_at");

        
        System.out.println("Generated SQL Query: " + query.toString());


        return namedParameterJdbcTemplate.query(query.toString(), parameters, new RowMapper<JobFilter>() {
            @Override
            public JobFilter mapRow(ResultSet rs, int rowNum) throws SQLException {
                JobFilter job = new JobFilter();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setSalary(rs.getDouble("salary_amount")); 
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
                        // If posted today, calculate hours ago
                        long hoursAgo = ChronoUnit.HOURS.between(postedDateTime, now);
                       
                        if (hoursAgo > 0) {
                            // If more than 0 hours ago
                            job.setPostedAt(hoursAgo + " hours ago");
                        } else {
                            // Calculate minutes ago
                            long minutesAgo = ChronoUnit.MINUTES.between(postedDateTime, now);
                            job.setPostedAt(minutesAgo + " minutes ago");
                        }
                    } else {
                        // If not posted today, show the actual posted date
                        String formattedDate = postedDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                        job.setPostedAt(formattedDate);
                    }
                    
                }
                
                
                return job;
            }
        });
    }


   

    

}
