package com.beans;

import java.time.LocalDateTime;
import java.util.List;

public class JobDetail {
    private int jobId;
    private int compId;
    private String jobTitle;
    private String employmentType;
    private String workingSetting;
    private double salaryAmount;
    private boolean negotiable;
    private String jobSummary;
    private String jobDescription;
    private int pointsRequired;
    private List<String> educationLevels;
    private String companyName;
    private String location;
    private String address;
    private String benefit;
    private List<String> skills;
    private String postedAt; 
    private String salaryType;

    // Getters and setters
    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }
    
    public int getCompId() {
        return compId;
    }

    public void setCompId(int compId) {
        this.compId = compId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getEmploymentType() {
        return employmentType;
    }

    public void setEmploymentType(String employmentType) {
        this.employmentType = employmentType;
    }

    public String getWorkingSetting() {
        return workingSetting;
    }

    public void setWorkingSetting(String workingSetting) {
        this.workingSetting = workingSetting;
    }

    public double getSalaryAmount() {
        return salaryAmount;
    }

    public void setSalaryAmount(double salaryAmount) {
        this.salaryAmount = salaryAmount;
    }

    public boolean isNegotiable() {
        return negotiable;
    }

    public void setNegotiable(boolean negotiable) {
        this.negotiable = negotiable;
    }

    public String getJobSummary() {
        return jobSummary;
    }

    public void setJobSummary(String jobSummary) {
        this.jobSummary = jobSummary;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public int getPointsRequired() {
        return pointsRequired;
    }

    public void setPointsRequired(int pointsRequired) {
        this.pointsRequired = pointsRequired;
    }


    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<String> getEducationLevels() {
        return educationLevels;
    }

    public void setEducationLevels(List<String> educationLevels) {
        this.educationLevels = educationLevels;
    }

    public List<String> getSkills() {
        return skills;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }
    
    public String getPostedAt() {
        return postedAt;
    }

    public void setPostedAt(String postedAt) {
        this.postedAt = postedAt;
    }
    
    public String getBenefit() {
        return benefit;
    }

    public void setBenefit(String benefit) {
        this.benefit = benefit;
    }
    
    public String getSalaryType() {
        return salaryType;
    }

    public void setSalaryType(String salaryType) {
        this.salaryType = salaryType;
    }
}
