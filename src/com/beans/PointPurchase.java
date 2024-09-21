package com.beans;

public class PointPurchase {
	private int packageId;
    private int points;
    private double cost;


    // Getter and Setter methods
    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
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

    @Override
    public String toString() {
        return "PointPackage{" +
                "packageId=" + packageId +
                ", points=" + points +
                ", cost=" + cost +
                '}';
    }

}

