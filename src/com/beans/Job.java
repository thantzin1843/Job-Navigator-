package com.beans;

import java.time.LocalDateTime;

public class Job {
    private int jobId;
    private String jobTitle;
    private double salary;
    private String companyName;
    private String location;
    private String employmentType;
    private String workingSetting;
    private String jobSummary;
    private boolean isNegotiable;
    private String postedAt;
    private String salaryType;
    private Integer companyId;

    // Getters and Setters
    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getJobTitle() {
        return jobTitle;
    }
    
    public Integer getCompanyId() {
		return companyId;
	}
    
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
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

    public String getJobSummary() {
        return jobSummary;
    }

    public void setJobSummary(String jobSummary) {
        this.jobSummary = jobSummary;
    }

    public boolean isNegotiable() {
        return isNegotiable;
    }

    public void setNegotiable(boolean isNegotiable) {
        this.isNegotiable = isNegotiable;
    }

    public String getPostedAt() {
        return postedAt;
    }

    public void setPostedAt(String postedAt) {
        this.postedAt = postedAt;
    }
    
    public String getSalaryType() {
        return salaryType;
    }

    public void setSalaryType(String salaryType) {
        this.salaryType = salaryType;
    }
    
}
