package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.JSProject;

@Repository
public class JSProjectDao {

//    @Autowired
//    private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(JSProject project) {
		if (project.getImage() == null || project.getImage().isEmpty()) {
			project.setImage("https://www.ntaskmanager.com/wp-content/uploads/2020/02/What-is-a-Project-1-scaled.jpg");
		}
		String sql = "INSERT INTO js_project(user_id, name, link, image, description, contributor) VALUES(?, ?, ?, ?, ?, ?)";
		return jdbcTemplate.update(sql, project.getUserId(), project.getName(), project.getLink(), project.getImage(),
				project.getDescription(), project.getContributor());
	}

	public List<JSProject> getProjectsByUserId(int userId) {
		String sql = "SELECT * FROM js_project WHERE user_id = ?";
		return jdbcTemplate.query(sql, new Object[] { userId }, new BeanPropertyRowMapper<>(JSProject.class));
	}

	public int deleteProject(int pId) {
		String sql = "DELETE FROM js_project WHERE id = ?";
		return jdbcTemplate.update(sql, pId);
	}

	public JSProject getProjectById(int id) {
		String sql = "SELECT * from js_project WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id },
				new BeanPropertyRowMapper<JSProject>(JSProject.class));
	}

	public int update(JSProject project) {
		String sql = "";
		if (project.getImage() != null) {
			sql = "UPDATE js_project SET name = ?, link = ?, image = ?, description = ?, contributor = ? WHERE id = ?";
			return jdbcTemplate.update(sql, project.getName(), project.getLink(), project.getImage(),
					project.getDescription(), project.getContributor(), project.getId());
		} else {
			sql = "UPDATE js_project SET name = ?, link = ?,description = ?, contributor = ? WHERE id = ?";
			return jdbcTemplate.update(sql, project.getName(), project.getLink(), project.getDescription(),
					project.getContributor(), project.getId());
		}

	}
}
