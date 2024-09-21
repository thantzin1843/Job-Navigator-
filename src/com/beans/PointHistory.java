package com.beans;
import java.sql.Timestamp;

public class PointHistory {
	
	    private long transactionId;
	    private int companyId;
	    private Integer packageId; // Can be null for 'used' transactions
	    private String transactionType; // 'purchase' or 'used'
	    private Integer pointsAmount;
	    private Timestamp transactionDate;
	    private String timeOnly;
	    private String dateOnly; 
	    private int points;
	    private double cost;
	    private String paymentStatus;

	    // Getters and setters

	    public long getTransactionId() {
	        return transactionId;
	    }

	    public void setTransactionId(Long transactionId) {
	        this.transactionId = transactionId;
	    }

	    public int getCompanyId() {
	        return companyId;
	    }

	    public void setCompanyId(int companyId) {
	        this.companyId = companyId;
	    }

	    public Integer getPackageId() {
	        return packageId;
	    }

	    public void setPackageId(Integer packageId) {
	        this.packageId = packageId;
	    }

	    public String getTransactionType() {
	        return transactionType;
	    }

	    public void setTransactionType(String transactionType) {
	        this.transactionType = transactionType;
	    }

	    public Integer getPointsAmount() {
	        return pointsAmount;
	    }

	    public void setPointsAmount(Integer pointsAmount) {
	        this.pointsAmount = pointsAmount;
	    }

	    public Timestamp getTransactionDate() {
	        return transactionDate;
	    }

	    public void setTransactionDate(Timestamp transactionDate) {
	        this.transactionDate = transactionDate;
	    }
	    
	    public int getPoints() {
	        return points;
	    }

	    public void setPoints(int points) {
	        this.points = points;
	    }

	    public double getCost() {
	        return cost;
	    }

	    public void setCost(double cost) {
	        this.cost = cost;
	    }
	    
	    public String getDateOnly() {
	        return dateOnly;
	    }

	    public void setDateOnly(String dateOnly) {
	        this.dateOnly = dateOnly;
	    }
	    
	    public String getTimeOnly() {
	        return timeOnly;
	    }

	    public void setTiimeOnly(String timeOnly) {
	        this.timeOnly = timeOnly;
	    }
	    
	    public String getPaymentStatus() {
	        return paymentStatus;
	    }

	    public void setPaymentStatus(String paymentStatus) {
	        this.paymentStatus = paymentStatus;
	    }

}
