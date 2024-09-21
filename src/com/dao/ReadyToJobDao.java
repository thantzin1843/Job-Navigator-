package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.ReadyToJob;

@Repository
public class ReadyToJobDao {

//	@Autowired
//    private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<ReadyToJob> getOpenStatusByUserId(int userId) {
		String sql = "SELECT * FROM ready_to_job WHERE user_id = ?";
		return jdbcTemplate.query(sql, new Object[] { userId }, new BeanPropertyRowMapper<>(ReadyToJob.class));
	}

	public void updateOpenStatus(int userId, boolean open) {
		String sql = "UPDATE ready_to_job SET ready = ? WHERE user_id = ?";
		jdbcTemplate.update(sql, open, userId);
	}
	
	public void insertReadyToJob(int userId, boolean ready) {
        String sql = "INSERT INTO ready_to_job (user_id, ready) VALUES (?, ?)";
        jdbcTemplate.update(sql, userId, ready ? 1 : 0); // Convert boolean to tinyint (1 or 0)
    }
}
