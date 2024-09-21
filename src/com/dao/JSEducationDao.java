
package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.JSEducation;

@Repository
public class JSEducationDao {

//    @Autowired
//    private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(JSEducation education) {
		String sql = "INSERT INTO js_education(user_id, university, major,start, end ) VALUES( ?, ?, ?, ?,?)";
		return jdbcTemplate.update(sql, education.getUserId(), education.getUniversity(), education.getMajor(),
				education.getStart(), education.getEnd());
	}

	public List<JSEducation> getEducationByUserId(int userId) {
		String sql = "SELECT * FROM js_education WHERE user_id = ?";
		return jdbcTemplate.query(sql, new Object[] { userId }, new BeanPropertyRowMapper<>(JSEducation.class));
	}

	public int deleteEducation(int id) {
		String sql = "DELETE FROM js_education WHERE id = ?";
		return jdbcTemplate.update(sql, id);
	}
}
