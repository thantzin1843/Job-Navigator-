package com.dao;

import java.util.List;
import com.beans.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.core.PreparedStatementCreator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@Repository
public class PostDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Save job data into Jobs table and return the job_id
    public int saveJob(Post post) {
    	 Integer categoryId = getCategoryId(post.getJobCategory());
    	 System.out.println("category:" + post.getJobCategory() + categoryId);
    	String sql = "INSERT INTO Jobs (company_id, job_title,category_id, employment_type, working_setting, salary_amount, salaryType, is_negotiable, job_summary, job_description, points_required) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Set a default points_required if it's null
        int pointsRequired = post.getPointsRequired() != null ? post.getPointsRequired() : 40;

        KeyHolder keyHolder = new GeneratedKeyHolder();
        
        jdbcTemplate.update(
                new PreparedStatementCreator() {
                    @Override
                    public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                        PreparedStatement ps = con.prepareStatement(sql, new String[] {"job_id"});
                        ps.setInt(1, post.getCompanyId());
                        ps.setString(2, post.getJobTitle());
                        ps.setInt(3, categoryId);
                        ps.setString(4, post.getEmploymentType());
                        ps.setString(5, post.getWorkSetting());
                        ps.setString(6, post.getSalary());
                        ps.setString(7, post.getsalaryType());
                        ps.setBoolean(8, post.getIsNegotiable());
                        ps.setString(9, post.getJobSummary());
                        ps.setString(10, post.getRequiredQualification());
                        ps.setInt(11, pointsRequired);
                        return ps;
                    }
                },
                keyHolder
            );

            // Retrieve the generated key
            Number generatedKey = keyHolder.getKey();
            return generatedKey != null ? generatedKey.intValue() : -1;
    }
    
    public Integer getCompanyIdByJobId(int jobId) {
        String sql = "SELECT company_id FROM Jobs WHERE job_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{jobId}, Integer.class);
        } catch (EmptyResultDataAccessException exception) {
            return null;
        }
    }
    public int getCompanyPointsBalance(int companyId) {
        String sql = "SELECT points_balance FROM CompanyPoints WHERE company_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{companyId}, Integer.class);
    }
    public void updateCompanyPointsBalance(int companyId, int updatedPointsBalance) {
        String sql = "UPDATE CompanyPoints SET points_balance = ?, last_updated = NOW() WHERE company_id = ?";
        jdbcTemplate.update(sql, updatedPointsBalance, companyId);
    }
    public void insertPointsTransaction(int companyId, Integer packageId, String transactionType, int pointsAmount) {
        String sql = "INSERT INTO PointsTransactionHistory (company_id, package_id, transaction_type, points_amount, transaction_date) " +
                     "VALUES (?, ?, ?, ?, NOW())";
        jdbcTemplate.update(sql, companyId, packageId, transactionType, pointsAmount);
    }

    public Integer getCategoryId(String categoryName) {
        String sql = "SELECT category_id FROM JobCategories WHERE category_name = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{categoryName}, Integer.class);
        } catch (EmptyResultDataAccessException exception) {
            return null;
        }
    }
    // Retrieve skill_id by skill name
    public Integer getSkillId(String skillName) {
        String sql = "SELECT cskill_id FROM cskills WHERE cskill_name = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{skillName}, Integer.class);
        } catch (EmptyResultDataAccessException exception) {
            return null;
        }
    }
    
    // Insert skill into Skills table and return the new skill_id
    public int saveSkill(String skillName) {
        String sql = "INSERT INTO cskills (cskill_name) VALUES (?)";

        // Define KeyHolder to capture the generated key
        KeyHolder keyHolder = new GeneratedKeyHolder();

        // Use PreparedStatementCreator to support generated keys
        jdbcTemplate.update(
            new PreparedStatementCreator() {
                @Override
                public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                    PreparedStatement ps = con.prepareStatement(sql, new String[] {"cskill_id"});
                    ps.setString(1, skillName);
                    return ps;
                }
            },
            keyHolder
        );

        // Retrieve the generated key
        Number generatedKey = keyHolder.getKey();
        return generatedKey != null ? generatedKey.intValue() : -1;
    }

    // Insert job skill into JobSkills table
    public void saveJobSkills(int jobId, int skillId) {
        String sql = "INSERT INTO jobskills (job_id, cskill_id) VALUES (?, ?)";
        jdbcTemplate.update(sql, jobId, skillId);
    }

    // Retrieve education_id based on the educationLevel from EducationRequirements table
    public Integer getEducationId(String educationLevel) {
        String sql = "SELECT education_id FROM EducationRequirements WHERE education_level = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{educationLevel}, Integer.class);
        } catch (EmptyResultDataAccessException exception) {
            return null;
        }
    }

    // Save the job_id and education_id into JobEducationRequirements table
    
    public void saveJobEducationRequirements(int jobId, int educationId) {
        String sql = "INSERT INTO JobEducationRequirements (job_id, education_id) VALUES (?, ?)";
        jdbcTemplate.update(sql, jobId, educationId);
    }
    // Save job category into JobCategories table
    public void saveJobCategory(Post post) {
        String sql = "INSERT INTO JobCategories (category_name) VALUES (?)";
        jdbcTemplate.update(sql, post.getJobCategory());
    }

    // Save education requirement into EducationRequirements table
    public int saveEducationRequirement(String educationLevel) {
        String sql = "INSERT INTO EducationRequirements (education_level) VALUES (?)";

        // Define KeyHolder to capture the generated key
        KeyHolder keyHolder = new GeneratedKeyHolder();

        // Use PreparedStatementCreator to support generated keys
        jdbcTemplate.update(
            new PreparedStatementCreator() {
                @Override
                public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
                    PreparedStatement ps = con.prepareStatement(sql, new String[] {"education_requirement_id"});
                    ps.setString(1, educationLevel);
                    return ps;
                }
            },
            keyHolder
        );

        // Retrieve the generated key
        Number generatedKey = keyHolder.getKey();
        return generatedKey != null ? generatedKey.intValue() : -1;
    }

    // Process skills from the Post object
    public void processSkills(Post post, int jobId) {
        String skillsString = post.getSkills(); 

        if (skillsString != null && !skillsString.trim().isEmpty()) {
            String[] skillsArray = skillsString.split("\\s*,\\s*"); 

            for (String skill : skillsArray) {
                if (!skill.isEmpty()) {
                    Integer skillId = getSkillId(skill);
                    if (skillId == null) {
                        // Skill not found, insert new skill and get skillId
                        skillId = saveSkill(skill);
                    }
                    // Save the job skill
                    saveJobSkills(jobId, skillId);
                }
            }
        }
    }
    public void processEducationRequirement(Post post, int jobId) {
        String educationLevel = post.getEducationLevel();

        if (educationLevel != null && !educationLevel.trim().isEmpty()) {
            Integer educationId = getEducationId(educationLevel);
            if (educationId == null) {
                // Education level not found, insert new education level and get educationId
                educationId = saveEducationRequirement(educationLevel);
            }
            // Save the job and education requirement
            saveJobEducationRequirements(jobId, educationId);
        }
    }
    public void updateJob(Post post) {
        String sql = "UPDATE Jobs SET job_title = ?, category_id = ?, employment_type = ?, working_setting = ?, salary_amount = ?, salaryType = ?, is_negotiable = ?, job_summary = ?, job_description = ?, points_required = ? WHERE job_id = ?";

        // Set a default points_required if it's null
        int pointsRequired = post.getPointsRequired() != null ? post.getPointsRequired() : 40;

        jdbcTemplate.update(sql,
                post.getJobTitle(),
                getCategoryId(post.getJobCategory()), // Make sure this method handles categoryId lookup
                post.getEmploymentType(),
                post.getWorkSetting(),
                post.getSalary(),
                post.getsalaryType(),
                post.getIsNegotiable(),
                post.getJobSummary(),
                post.getRequiredQualification(),
                pointsRequired,
                post.getJobId() // Ensure you have a jobId in your Post object for updating
        );
        deleteJobSkills(post.getJobId());

        // Process and save new skills
        processSkills(post, post.getJobId());
        
        deleteJobEducationRequirements(post.getJobId());
        // Process and save education requirements
        processEducationRequirement(post, post.getJobId());
    }
    
    public Post getPostById(int jobId) {
        String sql = "SELECT job_id, company_id, job_title, category_id, employment_type, working_setting, salary_amount, salaryType, is_negotiable, job_summary, job_description, points_required " +
                     "FROM Jobs WHERE job_id = ?";

        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{jobId}, (rs, rowNum) -> {
                Post post = new Post();
                post.setJobId(rs.getInt("job_id"));
                post.setCompanyId(rs.getInt("company_id"));
                post.setJobTitle(rs.getString("job_title"));
                post.setJobCategory(getCategoryName(rs.getInt("category_id"))); // Add this method to get category name
                post.setEmploymentType(rs.getString("employment_type"));
                post.setWorkSetting(rs.getString("working_setting"));
                post.setSalary(rs.getString("salary_amount"));
                post.setsalaryType(rs.getString("salaryType"));
                post.setIsNegotiable(rs.getBoolean("is_negotiable"));
                post.setJobSummary(rs.getString("job_summary"));
                post.setRequiredQualification(rs.getString("job_description"));
                post.setPointsRequired(rs.getInt("points_required"));

                // Set skills
                String skills = String.join(", ", getSkillsByJobId(jobId));
                post.setSkills(skills);

                String educationLevels = String.join(", ", getEducationLevelsByJobId(jobId));
                post.setEducationLevel(educationLevels);

                return post;
            });
        } catch (EmptyResultDataAccessException exception) {
            return null;
        }
    }

    public List<String> getSkillsByJobId(int jobId) {
        String sql = "SELECT s.cskill_name " +
                     "FROM JobSkills js " +
                     "JOIN cskills s ON js.cskill_id = s.cskill_id " +
                     "WHERE js.job_id = ?";
        return jdbcTemplate.query(sql, new Object[]{jobId}, (rs, rowNum) -> rs.getString("cskill_name"));
    }

    public List<String> getEducationLevelsByJobId(int jobId) {
        String sql = "SELECT er.education_level " +
                     "FROM JobEducationRequirements jer " +
                     "JOIN EducationRequirements er ON jer.education_id = er.education_id " +
                     "WHERE jer.job_id = ?";
        return jdbcTemplate.query(sql, new Object[]{jobId}, (rs, rowNum) -> rs.getString("education_level"));
    }

    private String getCategoryName(int categoryId) {
        String sql = "SELECT category_name FROM JobCategories WHERE category_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{categoryId}, String.class);
        } catch (EmptyResultDataAccessException exception) {
            return null;
        }
    }
    public void deleteJob(int jobId) {
        String sql = "DELETE FROM Jobs WHERE job_id = ?";
        jdbcTemplate.update(sql, jobId);
    }
    public void deleteJobSkills(int jobId) {
        String sql = "DELETE FROM JobSkills WHERE job_id = ?";
        jdbcTemplate.update(sql, jobId);
    }
    public void deleteJobEducationRequirements(int jobId) {
        String sql = "DELETE FROM JobEducationRequirements WHERE job_id = ?";
        jdbcTemplate.update(sql, jobId);
    }


}
