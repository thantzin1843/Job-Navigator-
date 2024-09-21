package com.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.beans.Admin;
import com.beans.AdminPackages;
import com.dao.AdminaccountDAO.AdminRowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class AdminPackagesDAO {

    private final JdbcTemplate jdbcTemplate;
    @Autowired
    public AdminPackagesDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    // RowMapper to map ResultSet to AdminPackages object
    private static final RowMapper<AdminPackages> PACKAGE_ROW_MAPPER = new RowMapper<AdminPackages>() {
        @Override
        public AdminPackages mapRow(ResultSet rs, int rowNum) throws SQLException {
            AdminPackages pkg = new AdminPackages();
            pkg.setPackageId(rs.getLong("package_id"));
           
            pkg.setPoints(rs.getInt("points"));
            pkg.setCost(rs.getBigDecimal("cost"));
            return pkg;
        }
    };

    // Retrieve all packages
    public List<AdminPackages> getAllPackages() {
        String sql = "SELECT * FROM pointspackages";
        return jdbcTemplate.query(sql, PACKAGE_ROW_MAPPER);
    }
    public void addPackage(AdminPackages adminPackage) {
        String sql = "INSERT INTO pointspackages (points, cost) VALUES (?, ?)";
        jdbcTemplate.update(sql, adminPackage.getPoints(), adminPackage.getCost());
    }

    // Retrieve a package by its ID
    public AdminPackages getPackageById(long packageId) {
        String sql = "SELECT * FROM pointspackages WHERE package_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{packageId}, PACKAGE_ROW_MAPPER);
    }
    public void deletePackage(long packageId) {
        String sql = "DELETE FROM pointspackages WHERE package_id = ?";
        jdbcTemplate.update(sql, packageId);
    }

    // Update a package
    public void updatePackage(AdminPackages adminPackage) {
        if ( adminPackage.getCost() == null) {
            throw new IllegalArgumentException("Points and Cost cannot be null");
        }
        String sql = "UPDATE pointspackages SET points = ?, cost = ? WHERE package_id = ?";
        jdbcTemplate.update(sql,
            adminPackage.getPoints(),
            adminPackage.getCost(),
            adminPackage.getPackageId()
        );
    }
    public static final class AdminRowMapper implements RowMapper<Admin> {
        @Override
        public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
            Admin admin = new Admin();
            admin.setAdminId(rs.getInt("admin_id"));
            admin.setFirstName(rs.getString("first_name"));
            admin.setLastName(rs.getString("last_name"));
            admin.setEmail(rs.getString("email"));
            admin.setPassword(rs.getString("password"));
            admin.setAdminPhoto(rs.getString("admin_photo"));
            return admin;
        }
    }

    public Admin getAdminById(Long adminId) {
        String sql = "SELECT * FROM Admins WHERE admin_id = ?";
        return jdbcTemplate.queryForObject(sql, new AdminRowMapper(), adminId);
    }
 // Inside your DAO or service class

//    public List<Integer> getPendingPackageIds() {
//        String sql = "SELECT p.package_id FROM pointstranscationhistory pth " +
//                     "JOIN payments ps ON pth.transaction_id = ps.transaction_id " +
//                     "WHERE ps.status = 'pending'";
//        
//        return jdbcTemplate.queryForList(sql, Integer.class);
//    }

    public List<Integer> getPendingPackageIds() {
        String sql = "SELECT p.package_id FROM pointstransactionhistory p "
        		+ "JOIN payments pay ON p.transaction_id = pay.transaction_id WHERE "
        		+ "pay.payment_status = 'Pending'";
        return jdbcTemplate.queryForList(sql, Integer.class);
    }

}
