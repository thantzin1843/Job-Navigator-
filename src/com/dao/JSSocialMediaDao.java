
package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.JSSocialMedia;

@Repository
public class JSSocialMediaDao {
//    @Autowired
//    private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(JSSocialMedia social) {
		String sql = "INSERT INTO js_social_media(userId, name, link) VALUES( ?, ?, ?)";
		return jdbcTemplate.update(sql, social.getUserId(), social.getName(), social.getLink());
	}

	public boolean isMediaUnique(String socialMediaHandle) {
		String query = "SELECT COUNT(*) FROM js_social_media WHERE name = ?";
		int count = jdbcTemplate.queryForObject(query, new Object[] { socialMediaHandle }, Integer.class);
		return count == 0; // Return true if unique
	}

	public List<JSSocialMedia> getSocialMediaByUserId(int userId) {
		String sql = "SELECT * FROM js_social_media WHERE userId = ?";
		return jdbcTemplate.query(sql, new Object[] { userId }, new BeanPropertyRowMapper<>(JSSocialMedia.class));
	}

	public int deleteMedia(int Id) {
		String sql = "DELETE FROM js_social_media WHERE id = ?";
		return jdbcTemplate.update(sql, Id);
	}
}
