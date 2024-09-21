package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import com.beans.Profile;

@Repository
public class ProfileDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Profile getCompanyProfileById(int companyId) {
		String sql = "SELECT company_id as companyId, company_name as name, company_photo as companyPhoto, location as location , address as address, phone_number as phoneNumber, industry_type as industryType, company_size as companySize, working_policy as workingPolicy, description, benefits FROM Companies WHERE company_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Profile.class), companyId);
        } catch (EmptyResultDataAccessException e) {
            return null; // No existing company with the given ID
        }
    }
	    

	public void saveCompany(Profile profile) {
        String checkSql = "SELECT COUNT(*) FROM Companies WHERE company_id = ?";
        int count = jdbcTemplate.queryForObject(checkSql, Integer.class, profile.getCompanyId());

        if (count > 0) {
            // Update existing company
            String updateSql = "UPDATE Companies SET company_name = ?, location = ?, address = ?,  phone_number = ?, industry_type = ?, company_size = ?, working_policy = ?, description = ?, benefits = ? WHERE company_id = ?";
            jdbcTemplate.update(updateSql,
                    profile.getName(),                    
                    profile.getLocation(),
                    profile.getAddress(),
                    profile.getPhoneNumber(),  // Default phone number if null
                    profile.getIndustryType(),
                    profile.getCompanySize(), 
                    profile.getWorkingPolicy(), 
                    profile.getDescription(), 
                    profile.getBenefits(),
                    profile.getCompanyId());
        } else {
            // Insert new company
            String insertSql = "INSERT INTO Companies (user_id, company_id, company_name, location, address, phone_number, industry_type, company_size, working_policy, description, benefits) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(insertSql, 
                    1, // Default user_id
                    profile.getCompanyId(), 
                    profile.getName(), 
                    profile.getLocation(),
                    profile.getAddress(),
                    profile.getPhoneNumber(), // Default phone number if null
                    profile.getIndustryType(),
                    profile.getCompanySize(), 
                    profile.getWorkingPolicy(), 
                    profile.getDescription(), 
                    profile.getBenefits());
        }
    }
	public void saveSocialMediaAccount(Profile profile) {
        List<String> platforms = profile.getSocialMediaPlatform();
        List<String> urls = profile.getSocialMediaUrls();

        for (int i = 0; i < urls.size(); i++) {
            String platform = platforms.get(i);
            String url = urls.get(i);
            String checkSql = "SELECT COUNT(*) FROM SocialMediaAccounts WHERE company_id = ? AND platform = ?";
            int count = jdbcTemplate.queryForObject(checkSql, Integer.class, profile.getCompanyId(), platform);
            
            if (count > 0) {
                // Update existing record
                String updateSql = "UPDATE SocialMediaAccounts SET account_url = ? WHERE company_id = ? AND platform = ?";
                jdbcTemplate.update(updateSql, url, profile.getCompanyId(), platform);
            } else {
                // Insert new record
                String insertSql = "INSERT INTO SocialMediaAccounts (job_seeker_id, company_id, platform, account_url) VALUES (?, ?, ?, ?)";
                jdbcTemplate.update(insertSql, 
                    null, // Assuming job_seeker_id is NULL
                    profile.getCompanyId(),
                    platform, 
                    url);
            }
    }
	}
	public void updateCompanyPhoto(int companyId, String fileName) {
	    String sql = "UPDATE Companies SET company_photo = ? WHERE company_id = ?";
	    jdbcTemplate.update(sql, fileName, companyId);
	}
	public void deleteCompanyPhoto(int companyId) {
	    String sql = "UPDATE Companies SET company_photo = NULL WHERE company_id = ?";
	    jdbcTemplate.update(sql, companyId);
	}
	public boolean deleteSocialMediaAccount(int accountId) {
        String sql = "DELETE FROM SocialMediaAccounts WHERE account_id = ?";
        int result = jdbcTemplate.update(sql, accountId);
        return result > 0;
    }


}
