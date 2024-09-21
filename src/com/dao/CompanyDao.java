package com.dao;

import com.model.Company;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.dao.EmptyResultDataAccessException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CompanyDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Method to register a company using the userId obtained from UserDao
    public boolean registerCompany(Company company) {
    	// Log the company object being inserted
        System.out.println("Inserting company: " + company.toString());
        
        // Insert into Companies table
        String sql = "INSERT INTO Companies (user_id, company_name, location, industry_type, company_size, phone_number) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        int rowsAffected = jdbcTemplate.update(sql, company.getUserId(), company.getName(), company.getLocation(), company.getIndustryType(),
                                               company.getCompanySize(), company.getPhone() ); //here
        System.out.println("Rows affected: " + rowsAffected);
        if (rowsAffected > 0 ) {
        	  // Retrieve the inserted company_id using the user_id (assuming user_id is unique)
            String getCompanyIdSql = "SELECT company_id FROM Companies WHERE user_id = ?";
            Integer companyId = jdbcTemplate.queryForObject(getCompanyIdSql, new Object[]{company.getUserId()}, Integer.class);

            if (companyId != null) {
                // Insert into companypoints table with company_id and default points_balance of 50
                String insertPointsSql = "INSERT INTO companypoints (company_id, points_balance) VALUES (?, 50)";
                int pointsRowsAffected = jdbcTemplate.update(insertPointsSql, companyId);

                System.out.println("Inserted into companypoints. Rows affected: " + pointsRowsAffected);

                return pointsRowsAffected > 0;  // Return true if both inserts were successful
            } else {
                // Handle the case when company_id is not found
                System.err.println("Company ID not found after insertion!");
                return false;
            }
        } else {
            return false;  // Return false if company insertion failed
        }
        
    }

    // Get company by user ID
    public Company getCompanyByUserId(int userId) {
        String sql = "SELECT * FROM Companies WHERE user_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{userId}, new CompanyRowMapper());
    }
    
    public Integer getPointsBalanceByCompanyId(int companyId) {
        String sql = "SELECT points_balance FROM companypoints WHERE company_id = ?";
        
        try {
            // Query the database for the points balance
            return jdbcTemplate.queryForObject(sql, new Object[]{companyId}, Integer.class);
        } catch (EmptyResultDataAccessException e) {
            // Handle the case when no result is found
            System.out.println("No points balance found for companyId: " + companyId);
            return null; // Or handle as appropriate (e.g., return a default value)
        }
    }
    
    // Method to fetch all unique locations
    public List<String> getAllLocations() {
        String sql = "SELECT DISTINCT location FROM companies";
        return jdbcTemplate.queryForList(sql, String.class);
    }

    // RowMapper implementation for mapping result set to Company object
    private static final class CompanyRowMapper implements RowMapper<Company> {
        public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
            Company company = new Company();
            company.setId(rs.getInt("company_id"));
            company.setUserId(rs.getInt("user_id"));
            company.setName(rs.getString("company_name"));
            company.setLocation(rs.getString("location"));
            company.setAddress(rs.getString("address"));
            company.setIndustryType(rs.getString("industry_type"));
            company.setCompanySize(rs.getString("company_size"));
            company.setWorkingPolicy(rs.getString("working_policy"));
            company.setDescription(rs.getString("description"));
            company.setBenefits(rs.getString("benefits"));
            company.setImage(rs.getString("company_photo"));
            return company;
        }
    }
}
