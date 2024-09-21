package com.dao;

import com.beans.PointPurchase;
import com.beans.CompanyPoints;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PointPurchaseDao {

    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    // get all point packages
    public List<PointPurchase> getAllPointsPackages() {
        String sql = "SELECT * FROM pointspackages";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(PointPurchase.class));
    }
    
    public PointPurchase getPointPackageById(long packageId) {
        String sql = "SELECT * FROM pointspackages WHERE package_id = ?";
      
            return jdbcTemplate.queryForObject(sql, new Object[]{packageId}, new BeanPropertyRowMapper<>(PointPurchase.class));
       
    }
    
    // get all company points
    public List<CompanyPoints> getAllCompanyPoints() {
        String sql = "SELECT * FROM companypoints";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CompanyPoints.class));
    }
    
    
    //get with company id
    public List<CompanyPoints> getCompanyPointsByCompanyId(int companyId) {
        String sql = "SELECT * FROM companypoints WHERE company_id = ?";
        return jdbcTemplate.query(sql, new Object[]{companyId}, new BeanPropertyRowMapper<>(CompanyPoints.class));
    }
}
