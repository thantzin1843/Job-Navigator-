package com.beans;

import java.sql.Timestamp;

public class CompanyPoints {
    private long companyPointsId;
    private int companyId;
    private int pointsBalance;
    private Timestamp lastUpdated;

    // Getters and Setters
    public long getCompanyPointsId() {
        return companyPointsId;
    }

    public void setCompanyPointsId(long companyPointsId) {
        this.companyPointsId = companyPointsId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public int getPointsBalance() {
        return pointsBalance;
    }

    public void setPointsBalance(int pointsBalance) {
        this.pointsBalance = pointsBalance;
    }

    public Timestamp getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Timestamp lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}
