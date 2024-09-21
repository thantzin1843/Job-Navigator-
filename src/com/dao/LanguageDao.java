package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.Language;

@Repository
public class LanguageDao {

//    @Autowired
//    private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(Language language) {
		String sql = "INSERT INTO Language(name, proficiency, user_id) VALUES(?, ?, ?)";
		return jdbcTemplate.update(sql, language.getName(), language.getProficiency(), language.getUserId());
	}

	public boolean isLanguageUnique(String socialMediaHandle) {
		String query = "SELECT COUNT(*) FROM Language WHERE name = ?";
		int count = jdbcTemplate.queryForObject(query, new Object[] { socialMediaHandle }, Integer.class);
		return count == 0; // Return true if unique
	}

	public List<Language> getLanguagesByUserId(int userId) {
		String sql = "SELECT * FROM language WHERE user_id = ?";
		return jdbcTemplate.query(sql, new Object[] { userId }, new BeanPropertyRowMapper<>(Language.class));
	}

	public int deleteLanguage(int id) {
		String sql = "DELETE FROM language WHERE id = ?";
		return jdbcTemplate.update(sql, id);
	}
}
