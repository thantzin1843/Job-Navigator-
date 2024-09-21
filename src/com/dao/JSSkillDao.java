package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.JSSkill;

@Repository
public class JSSkillDao {

//	@Autowired
//	private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(JSSkill skill) {
		String sql = "INSERT INTO Skills(user_id, skill) VALUES( ?, ?)";
		return jdbcTemplate.update(sql, skill.getUserId(), skill.getSkill());
	}

	public boolean isSkillUnique(String skill, int userId) {
		String query = "SELECT COUNT(*) FROM Skills WHERE skill = ? AND user_id = ?";
		int count = jdbcTemplate.queryForObject(query, new Object[] { skill, userId }, Integer.class);
		return count == 0; // Return true if the combination of skill and userId is unique
	}

	public List<JSSkill> getSkillsByJobSeekerId(int jobSeekerId) {
		String sql = "SELECT * FROM skills WHERE user_id = ?";
		return jdbcTemplate.query(sql, new Object[] { jobSeekerId }, new BeanPropertyRowMapper<JSSkill>(JSSkill.class));
	}

	public int deleteSkill(int skillId) {
		String sql = "DELETE FROM skills WHERE id = ?";
		return jdbcTemplate.update(sql, skillId);
	}
}
