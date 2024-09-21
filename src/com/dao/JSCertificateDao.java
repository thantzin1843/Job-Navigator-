package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.beans.JSCertificate;

@Repository
public class JSCertificateDao {

//    @Autowired
//    private JdbcTemplate template;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int save(JSCertificate certification) {
		String sql = "INSERT INTO js_certification(user_id, certificate, image, about) VALUES (?, ?, ?, ?)";
		return jdbcTemplate.update(sql, certification.getUserId(), certification.getCertificate(),
				certification.getImage(), certification.getAbout());
	}

	public boolean isCertificateUnique(String socialMediaHandle) {
		String query = "SELECT COUNT(*) FROM js_certification WHERE certificate = ?";
		int count = jdbcTemplate.queryForObject(query, new Object[] { socialMediaHandle }, Integer.class);
		return count == 0; // Return true if unique
	}

	public List<JSCertificate> getCertificatesByUserId(int userId) {
		String sql = "SELECT * FROM js_certification WHERE user_id = ?";
		return jdbcTemplate.query(sql, new Object[] { userId }, new BeanPropertyRowMapper<>(JSCertificate.class));
	}

	public int deleteCertificate(int cId) {
		String sql = "DELETE FROM js_certification WHERE id = ?";
		return jdbcTemplate.update(sql, cId);
	}
}
