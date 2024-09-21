
package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.JSExp;

@Repository
public class JSExpDao {

//    @Autowired
//    private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(JSExp exp) {
		String sql = "INSERT INTO js_exp(user_id, company, position,start, end ) VALUES( ?, ?, ?, ?,?)";
		return jdbcTemplate.update(sql, exp.getUserId(), exp.getCompany(), exp.getPosition(), exp.getStart(),
				exp.getEnd());
	}

	public List<JSExp> getWorkExpByUserId(int userId) {
		String sql = "SELECT * FROM js_exp WHERE user_id = ?";
		return jdbcTemplate.query(sql, new Object[] { userId }, new BeanPropertyRowMapper<>(JSExp.class));
	}

	public int deleteExp(int eId) {
		String sql = "DELETE FROM js_exp WHERE id = ?";
		return jdbcTemplate.update(sql, eId);
	}
}
