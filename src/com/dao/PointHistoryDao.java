package com.dao;

import com.beans.PointHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.dao.EmptyResultDataAccessException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Statement;

@Repository
public class PointHistoryDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final class PointHistoryDaoRowMapper implements RowMapper<PointHistory> {
        @Override
        public PointHistory mapRow(ResultSet rs, int rowNum) throws SQLException {
        	PointHistory transaction = new PointHistory();
            transaction.setTransactionId(rs.getLong("transaction_id"));
            transaction.setCompanyId(rs.getInt("company_id"));
            transaction.setPackageId(rs.getObject("package_id", Integer.class)); // Handle nullable fields
            transaction.setTransactionType(rs.getString("transaction_type"));
            transaction.setPointsAmount(rs.getInt("points_amount"));
            transaction.setTransactionDate(rs.getTimestamp("transaction_date"));
            
            Timestamp transactionTimestamp = rs.getTimestamp("transaction_date");
            if (transactionTimestamp != null) {
                LocalDateTime tTimestamp = transactionTimestamp.toLocalDateTime();
                LocalDateTime now = LocalDateTime.now();

                if (tTimestamp.toLocalDate().isEqual(now.toLocalDate())) {
                    // If today,
                	String tdate = "Today";
                	System.out.println(tdate);
                	transaction.setDateOnly(tdate);
                    
                } else {
                    // If not today, show the actual date
                    String formattedDate = tTimestamp.format(DateTimeFormatter.ofPattern("dd-MM-yyy"));
                    transaction.setDateOnly(formattedDate);
                    //System.out.println(transaction.getDateOnly());
                }
                String ftime = tTimestamp.format(DateTimeFormatter.ofPattern("hh:mm a"));
                transaction.setTiimeOnly(ftime);
                
            }
           // transaction.setPaymentStatus(rs.getString("payment_status"));
            transaction.setPoints(rs.getInt("points"));
            transaction.setCost(rs.getDouble("cost"));
            return transaction;
        }
    }

    //  retrieve all transactions for a specific company
    public List<PointHistory> getAllHistoryByCompanyId(int companyId) {
        String sql = "SELECT t.transaction_id, t.company_id, t.package_id, t.transaction_type, t.points_amount, t.transaction_date," +
                "p.points, p.cost " +
                "FROM PointsTransactionHistory t " +
                "LEFT JOIN PointsPackages p ON t.package_id = p.package_id " +               
                "WHERE t.company_id = ? "+
                "ORDER BY t.transaction_id DESC";
        return jdbcTemplate.query(sql, new  PointHistoryDaoRowMapper(), companyId);
    }
    
    public String PaymentStatus(long tid) {
        String sql = "SELECT st.payment_status FROM Payments st WHERE st.transaction_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{tid}, String.class);
        } catch (EmptyResultDataAccessException e) {
            // Return a default value or null if no result is found
            return "Not Available";
        }
    }

    // save a new transaction
    public long addTransaction(PointHistory transaction) {
        String sql = "INSERT INTO pointstransactionhistory (company_id, package_id, transaction_type, points_amount, transaction_date) " +
                     "VALUES (?, ?, ?, ?, NOW())";

        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setLong(1, transaction.getCompanyId());
            ps.setInt(2, transaction.getPackageId());
            ps.setString(3, transaction.getTransactionType());
            ps.setInt(4, transaction.getPointsAmount());
            return ps;
        }, keyHolder);

        return keyHolder.getKey().longValue();
    }
    
    

  
}

