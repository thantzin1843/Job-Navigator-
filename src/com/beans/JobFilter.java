package com.beans;

public class JobFilter {
    private int jobId;
    private String jobTitle;
    private double salary;
    private String salaryType;
    private String companyName;
    private String location;
    private String employmentType;
    private String workingSetting;
    private String jobSummary;
    private boolean negotiable;

    // Additional filter criteria fields
    private String categoryName;
    private String[] jobTypes;
    private String[] workTypes;
    private double minSalary=0;
    private String postedAt; 
   
    // Getter and Setter methods

    // Getter for jobId
    public int getJobId() {
        return jobId;
    }

    // Setter for jobId
    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    // Getter for jobTitle
    public String getJobTitle() {
        return jobTitle;
    }

    // Setter for jobTitle
    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    // Getter for salary
    public double getSalary() {
        return salary;
    }

    // Setter for salary
    public void setSalary(double salary) {
        this.salary = salary;
    }

    // Getter for companyName
    public String getCompanyName() {
        return companyName;
    }

    // Setter for companyName
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    // Getter for location
    public String getLocation() {
        return location;
    }

    // Setter for location
    public void setLocation(String location) {
        this.location = location;
    }

    // Getter for employmentType
    public String getEmploymentType() {
        return employmentType;
    }

    // Setter for employmentType
    public void setEmploymentType(String employmentType) {
        this.employmentType = employmentType;
    }

    // Getter for workingSetting
    public String getWorkingSetting() {
        return workingSetting;
    }

    // Setter for workingSetting
    public void setWorkingSetting(String workingSetting) {
        this.workingSetting = workingSetting;
    }

    // Getter for jobSummary
    public String getJobSummary() {
        return jobSummary;
    }

    // Setter for jobSummary
    public void setJobSummary(String jobSummary) {
        this.jobSummary = jobSummary;
    }

    // Getter for isNegotiable
    public boolean getNegotiable() {
        return negotiable;
    }

    // Setter for isNegotiable
    public void setNegotiable(boolean negotiable) {
        this.negotiable = negotiable;
    }

    // Getter for categoryName
    public String getCategoryName() {
        return categoryName;
    }

    // Setter for categoryName
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    // Getter for jobTypes
    public String[] getJobTypes() {
        return jobTypes;
    }

    // Setter for jobTypes
    public void setJobTypes(String[] jobTypes) {
        this.jobTypes = jobTypes;
    }

    // Getter for workTypes
    public String[] getWorkTypes() {
        return workTypes;
    }

    // Setter for workTypes
    public void setWorkTypes(String[] workTypes) {
        this.workTypes = workTypes;
    }

    // Getter for minSalary
    public double getMinSalary() {
        return minSalary;
    }

    // Setter for minSalary
    public void setMinSalary(double minSalary) {
        this.minSalary = minSalary;
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



   

