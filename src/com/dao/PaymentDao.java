package com.dao;

import com.beans.Payment;
import com.beans.PointHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.Statement;

@Repository
public class PaymentDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Adds to the pointstransactionhistory table and returns the transaction ID
    public long addTransaction(PointHistory transaction) {
        String sql = "INSERT INTO pointstransactionhistory (company_id, package_id, transaction_type, points_amount, transaction_date) " +
                     "VALUES (?, ?, ?, ?, NOW())";
        
        KeyHolder keyHolder = new GeneratedKeyHolder();
        
        //get id
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setLong(1, transaction.getCompanyId());
            ps.setInt(2, transaction.getPackageId());
            ps.setString(3, transaction.getTransactionType());
            ps.setInt(4, transaction.getPointsAmount());
            return ps;
        }, keyHolder);

        // return transaction_id
        return keyHolder.getKey().longValue();
    }

    // Saves a payment to the Payments table
    public int savePayment(Payment payment) {
        String sql = "INSERT INTO Payments (company_id, transaction_id, payment_method, payment_screenshot, payment_status) VALUES (?, ?, ?, ?, ?)";
        
        // Validate if transaction_id exists in pointstransactionhistory
        String checkTransactionSql = "SELECT COUNT(*) FROM pointstransactionhistory WHERE transaction_id = ?";
        Integer count = jdbcTemplate.queryForObject(checkTransactionSql, Integer.class, payment.getTransactionId());

        if (count != null && count > 0) {
            // Proceed with inserting the payment
            return jdbcTemplate.update(sql, payment.getCompanyId(), payment.getTransactionId(), payment.getPaymentMethod(), payment.getPaymentScreenshot(), "Pending");
        } else {
            throw new RuntimeException("Transaction ID does not exist in pointstransactionhistory");
        }
    }
}
