package com.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

public abstract class AbstractDAO {
	protected JdbcTemplate jdbcTemplate;

	public AbstractDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
}
