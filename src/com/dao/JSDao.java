package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.beans.JSPreference;
import com.beans.JobSeeker;

public class JSDao {
//	JdbcTemplate template;
//
//	public void setTemplate(JdbcTemplate template) {
//		this.template = template;
//	}

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JobSeeker getJobSeekerById(int id) {
		// String sql = "SELECT u.id AS user_id, j.id AS job_seeker_id, u.*, j.* FROM
		// user u JOIN job_seeker j ON u.id = j.id WHERE j.id=?";
		String sql = "SELECT u.*, j.*  FROM users u  JOIN jobseekers j  ON u.user_id = j.user_id  WHERE j.user_id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id },
				new BeanPropertyRowMapper<JobSeeker>(JobSeeker.class));
	}

	@Transactional
	public int update(JobSeeker jobSeeker) {
		String sql = "UPDATE users SET name = ?, email = ?, phone = ?,username=? WHERE user_id = ?";
		String sql2 = "";
		if (jobSeeker.getImage() != null) {
			sql2 = "UPDATE jobseekers SET dob = ?, position = ?, bio = ?,address=?,image=? WHERE user_id = ?";
		} else {
			sql2 = "UPDATE jobseekers SET dob = ?, position = ?, bio = ?,address=? WHERE user_id = ?";
		}

		int t1 = jdbcTemplate.update(sql, jobSeeker.getName(), jobSeeker.getEmail(), jobSeeker.getPhone(),
				jobSeeker.getUsername(), jobSeeker.getUser_id());
//        System.out.println("helo"+t1);
		if (t1 == 1) {
//        	  System.out.println("helo end");
			if (jobSeeker.getImage() != null) {
				return jdbcTemplate.update(sql2, jobSeeker.getDob(), jobSeeker.getPosition(), jobSeeker.getBio(),
						jobSeeker.getAddress(), jobSeeker.getImage(), jobSeeker.getUser_id());
			} else {
				return jdbcTemplate.update(sql2, jobSeeker.getDob(), jobSeeker.getPosition(), jobSeeker.getBio(),
						jobSeeker.getAddress(), jobSeeker.getUser_id());
			}

		} else {
			return 0; // If one or both updates failed
		}

	}

	public int cvUpload(JobSeeker js, int id) {
		String sql = "UPDATE jobseekers SET cv = ? WHERE user_id = ?";
		return jdbcTemplate.update(sql, js.getCv(), id);
	}

//	public JSPreference findByUserId(int userId) {
//		System.out.println("userId" + userId);
//		String sql = "SELECT * from js_preference where user_id = ?";
//		return template.queryForObject(sql, new Object[] { userId },
//				new BeanPropertyRowMapper<JSPreference>(JSPreference.class));
//	}

	public JSPreference findByUserId(int userId) {
		System.out.println("userId: " + userId);
		String sql = "SELECT * FROM js_preference WHERE user_id = ?";

		List<JSPreference> preferences = jdbcTemplate.query(sql, new Object[] { userId },
				new BeanPropertyRowMapper<>(JSPreference.class));

		// Check if the list is empty and return null or handle as needed
		if (preferences.isEmpty()) {
			return null; // or handle accordingly
		}
		return preferences.get(0);
	}

}
