package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.JSPreference;

@Repository
public class JSPreferenceDao {
//    @Autowired
//    private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(JSPreference jobPreference) {
		String sql = "INSERT INTO js_preference(user_id, title, type, schedule, salary) VALUES(?, ?, ?, ?, ?)";
		return jdbcTemplate.update(sql, jobPreference.getUserId(), jobPreference.getTitle(), jobPreference.getType(),
				jobPreference.getSchedule(), jobPreference.getSalary());
	}

	public int update(JSPreference jobPreference) {
		String sql = "UPDATE js_preference SET title = ?, type = ?, schedule = ?, salary = ? WHERE user_id = ?";
		return jdbcTemplate.update(sql, jobPreference.getTitle(), jobPreference.getType(), jobPreference.getSchedule(),
				jobPreference.getSalary(), jobPreference.getUserId());
	}
}