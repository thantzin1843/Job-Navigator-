package com.beans;

import java.sql.Timestamp;

public class AdminPayment {
    private int companyId;
    private int purchasedPoints;
    private double cost;
    private Timestamp paymentDate;
    private String paymentStatus;
    private int paymentId;
    private String paymentss;
    
    // Getters and Setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }
    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public int getPurchasedPoints() {
        return purchasedPoints;
    }

    public void setPurchasedPoints(int purchasedPoints) {
        this.purchasedPoints = purchasedPoints;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double d) {
        this.cost = d;
    }

    public Timestamp getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    public String getPaymentss() {
        return paymentss;
    }

    public void setPaymentss(String paymentss) {
        this.paymentss = paymentss;
    }
}
