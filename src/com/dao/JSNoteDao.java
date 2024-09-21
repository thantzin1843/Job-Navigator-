
package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.JSNote;

@Repository
public class JSNoteDao {

//    @Autowired
//    private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(JSNote note) {
		String sql = "INSERT INTO notes(user_id, note) VALUES( ?, ?)";
		return jdbcTemplate.update(sql, note.getUserId(), note.getNote());
	}

	public boolean isNoteUnique(String socialMediaHandle) {
		String query = "SELECT COUNT(*) FROM notes WHERE note = ?";
		int count = jdbcTemplate.queryForObject(query, new Object[] { socialMediaHandle }, Integer.class);
		return count == 0; // Return true if unique
	}

	public List<JSNote> getNoteByJobSeekerId(int jobSeekerId) {
		String sql = "SELECT * FROM notes WHERE user_id = ?";
		return jdbcTemplate.query(sql, new Object[] { jobSeekerId }, new BeanPropertyRowMapper<JSNote>(JSNote.class));
	}

	public int deleteNote(int id) {
		String sql = "DELETE FROM notes WHERE id = ?";
		return jdbcTemplate.update(sql, id);
	}
}
