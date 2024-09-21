package com.dao;

import com.beans.JobCategory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class JobCategoryDao extends AbstractDAO {

	@Autowired
	public JobCategoryDao(DataSource dataSource) {
		super(dataSource);
	}

	public List<JobCategory> getAllJobCategories() {
		String sql = "SELECT * FROM JobCategories";
		return jdbcTemplate.query(sql, new JobCategoryRowMapper());
	}

	// Other methods can be added here if needed

	private static final class JobCategoryRowMapper implements RowMapper<JobCategory> {
		@Override
		public JobCategory mapRow(ResultSet rs, int rowNum) throws SQLException {
			JobCategory category = new JobCategory();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			return category;
		}
	}
}
