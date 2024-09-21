package com.dao;

import com.beans.Profile_Job;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class Profile_JobDao extends AbstractDAO {

	@Autowired
	public Profile_JobDao(DataSource dataSource) {
		super(dataSource);
	}

	public List<Profile_Job> getJobsByCompanyId(int companyId) {
        String sql = "SELECT j.job_title, j.employment_type, j.working_setting, j.job_id, c.location " + 
                     "FROM Jobs j JOIN Companies c ON j.company_id = c.company_id " + 
                     "WHERE j.company_id = ?";
        return jdbcTemplate.query(sql, new Object[] { companyId }, new JobRowMapper());
    }

	private static final class JobRowMapper implements RowMapper<Profile_Job> {
		@Override
		public Profile_Job mapRow(ResultSet rs, int rowNum) throws SQLException {
			Profile_Job job = new Profile_Job();
			job.setJobId(rs.getInt("job_id"));
			job.setJobTitle(rs.getString("job_title"));
			job.setEmploymentType(rs.getString("employment_type"));
			job.setWorkingSetting(rs.getString("working_setting"));
			job.setLocation(rs.getString("location")); // Location from Companies table
			return job;
		}
	}
	
	    
	}


