package com.dao;

import com.beans.JobDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.List;

@Repository
public class JobDetailDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public JobDetail getJobDetail(int jobId) {
        String sql = "SELECT j.job_id, j.job_title, j.employment_type, j.working_setting, " +
                     "j.salary_amount, j.salaryType, j.is_negotiable, j.job_summary, j.job_description, " +
                     "j.points_required, j.posted_at, c.company_id, c.company_name, c.location, c.address, c.benefits, " + // Fixed spacing
                     "GROUP_CONCAT(DISTINCT er.education_level) AS education_levels, " +
                     "GROUP_CONCAT(DISTINCT s.cskill_name) AS cskills " +
                     "FROM Jobs j " +
                     "INNER JOIN Companies c ON j.company_id = c.company_id " +
                     "LEFT JOIN JobEducationRequirements jer ON j.job_id = jer.job_id " +
                     "LEFT JOIN EducationRequirements er ON jer.education_id = er.education_id " +
                     "LEFT JOIN JobSkills js ON j.job_id = js.job_id " +
                     "LEFT JOIN cskills s ON js.cskill_id = s.cskill_id " +
                     "WHERE j.job_id = ? " +
                     "GROUP BY j.job_id, c.company_name, c.location, j.job_summary, " +
                     "j.job_description, j.points_required, j.posted_at, c.benefits";

        return jdbcTemplate.queryForObject(sql, new Object[]{jobId}, new RowMapper<JobDetail>() {
            @Override
            public JobDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
                JobDetail jobDetail = new JobDetail();
                jobDetail.setJobId(rs.getInt("job_id"));
                jobDetail.setJobTitle(rs.getString("job_title"));
                jobDetail.setEmploymentType(rs.getString("employment_type"));
                jobDetail.setWorkingSetting(rs.getString("working_setting"));
                jobDetail.setSalaryAmount(rs.getDouble("salary_amount"));
                jobDetail.setSalaryType(rs.getString("salaryType"));
                jobDetail.setNegotiable(rs.getBoolean("is_negotiable"));
                jobDetail.setJobSummary(rs.getString("job_summary"));
                jobDetail.setJobDescription(rs.getString("job_description"));
                jobDetail.setPointsRequired(rs.getInt("points_required"));

                Timestamp postedTimestamp = rs.getTimestamp("posted_at");
                if (postedTimestamp != null) {
                    LocalDateTime postedDateTime = postedTimestamp.toLocalDateTime();
                    LocalDateTime now = LocalDateTime.now();

                    if (postedDateTime.toLocalDate().isEqual(now.toLocalDate())) {
                        long hoursAgo = ChronoUnit.HOURS.between(postedDateTime, now);
                        jobDetail.setPostedAt(hoursAgo > 0 ? hoursAgo + " hours ago" : ChronoUnit.MINUTES.between(postedDateTime, now) + " minutes ago");
                    } else {
                        jobDetail.setPostedAt(postedDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
                    }
                }
                
                jobDetail.setCompId(rs.getInt("company_id"));
                jobDetail.setCompanyName(rs.getString("company_name"));
                jobDetail.setLocation(rs.getString("location"));
                jobDetail.setAddress(rs.getString("address"));
                jobDetail.setBenefit(rs.getString("benefits")); // Corrected field name

                // Handle education levels
                String educationLevels = rs.getString("education_levels");
                if (educationLevels != null && !educationLevels.isEmpty()) {
                    jobDetail.setEducationLevels(Arrays.asList(educationLevels.split(",")));
                }

                // Handle skills
                String skills = rs.getString("cskills");
                if (skills != null && !skills.isEmpty()) {
                    jobDetail.setSkills(Arrays.asList(skills.split(",")));
                }

                return jobDetail;
            }
        });
    }
}
