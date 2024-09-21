package com.dao;

import com.beans.AdminPayment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;

@Repository
public class AdminPaymentDAO {

    private final JdbcTemplate jdbcTemplate;
    @Autowired
    public AdminPaymentDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Query to fetch payment details along with purchased points and cost
    public List<AdminPayment> getPaymentDetails() {
        String sql = "SELECT p.company_id, pp.points, pp.cost, p.payment_date, p.payment_status, p.payment_screenshot, p.payment_id, ph.transaction_id, ph.package_id " +
                     "FROM payments p " +
                     "JOIN pointstransactionhistory ph ON p.transaction_id = ph.transaction_id " +
                     "JOIN pointspackages pp ON ph.package_id = pp.package_id " +
                     "WHERE p.payment_status = 'Pending'";

        return jdbcTemplate.query(sql, new AdminPaymentRowMapper());
    }


    // Approve or cancel payment status
    public void approvePayment(int paymentId) {
        String sql = "UPDATE payments SET payment_status = 'Approved' WHERE payment_id = ?";
        jdbcTemplate.update(sql, paymentId);
    }

    public void cancelPayment(int paymentId) {
        String sql = "UPDATE payments SET payment_status = 'Cancelled' WHERE payment_id = ?";
        jdbcTemplate.update(sql, paymentId);
    }

    public void deletePayment(int paymentId) {
        String sql = "DELETE FROM payments WHERE payment_id = ?";
        jdbcTemplate.update(sql, paymentId);
    }

    class AdminPaymentRowMapper implements RowMapper<AdminPayment> {
        @Override
        public AdminPayment mapRow(ResultSet rs, int rowNum) throws SQLException {
            AdminPayment payment = new AdminPayment();
            payment.setCompanyId(rs.getInt("company_id"));
            payment.setPurchasedPoints(rs.getInt("points"));
            payment.setCost(rs.getDouble("cost"));
            payment.setPaymentss(rs.getString("payment_screenshot"));
            payment.setPaymentDate(rs.getTimestamp("payment_date"));
            payment.setPaymentStatus(rs.getString("payment_status"));
            payment.setPaymentId(rs.getInt("payment_id"));
            return payment;
        }
    }
    public String getPaymentScreenshotById(int paymentId) {
        String sql = "SELECT payment_screenshot FROM Payments WHERE payment_id = ?";
        
        // Assuming screenshot_url is the column where the screenshot URL or path is stored
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{paymentId}, String.class);
        } catch (EmptyResultDataAccessException e) {
            return null; // Return null if no result found
        }
    }
    
    public int getCompPoint(int companyId) {
        String selectPointsSql = "SELECT points_balance FROM companypoints WHERE company_id = ?";
        Integer currentPoints = jdbcTemplate.queryForObject(selectPointsSql, new Object[]{companyId}, Integer.class);
        return (currentPoints != null) ? currentPoints : 0;  // Return 0 if no points record exists
    }
    
    public void addPoint(int companyId, int pointAmount) {
        // Retrieve the current balance
         int currentBalance = getCompPoint(companyId);
         int updatedBalance = currentBalance + pointAmount;

        // Update the points_balance and last_updated fields
        String updatePointsSql = "UPDATE companypoints SET points_balance = ?, last_updated = ? WHERE company_id = ?";
        jdbcTemplate.update(updatePointsSql, updatedBalance, new Timestamp(new Date().getTime()), companyId);
    }
}
