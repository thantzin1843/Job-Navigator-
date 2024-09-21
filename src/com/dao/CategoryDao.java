package com.dao;

import com.model.Category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CategoryDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    public List<Category> getAllCategories() {
        String query = "SELECT category_id, category_name, image_filename from JobCategories";
                        
        return jdbcTemplate.query(query, new RowMapper<Category>() {
            @Override
            public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
                Category c = new Category();
                c.setCategoryId(rs.getInt("category_id"));
                c.setCategoryName(rs.getString("category_name"));
                c.setImageFilename(rs.getString("image_filename"));
                return c;
            }
        });
    }
}
