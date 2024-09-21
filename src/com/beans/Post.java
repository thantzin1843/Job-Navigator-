package com.beans;

import java.util.List;

public class Post {
	private Integer jobId;
	private Integer companyId;
    private String jobTitle;
    private String jobCategory;
    private String employmentType;
    private String workSetting;
    private String salary;
    private String salaryType;
    private String jobSummary;
    private String requiredQualification;
    private String skills;
    private String educationLevel;
    private Integer pointsRequired;
    private boolean isNegotiable;
    // Getters and setters for each field
    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }
    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }
    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getsalaryType() {
        return salaryType;
    }

    public void setsalaryType(String salaryType) {
        this.salaryType = salaryType;
    }
    public String getJobCategory() {
        return jobCategory;
    }

    public void setJobCategory(String jobCategory) {
        this.jobCategory = jobCategory;
    }
    public boolean getIsNegotiable() {
        return isNegotiable;
    }

    public void setIsNegotiable(boolean isNegotiable) {
        this.isNegotiable = isNegotiable;
    }
    public String getEmploymentType() {
        return employmentType;
    }

    public void setEmploymentType(String employmentType) {
        this.employmentType = employmentType;
    }

    public String getWorkSetting() {
        return workSetting;
    }

    public void setWorkSetting(String workSetting) {
        this.workSetting = workSetting;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getJobSummary() {
        return jobSummary;
    }

    public void setJobSummary(String jobSummary) {
        this.jobSummary = jobSummary;
    }
    public Integer getPointsRequired() {
        return pointsRequired;
    }

    public void setPointsRequired(Integer pointsRequired) {
        this.pointsRequired = pointsRequired;
    }
    public String getRequiredQualification() {
        return requiredQualification;
    }

    public void setRequiredQualification(String requiredQualification) {
        this.requiredQualification = requiredQualification;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getEducationLevel() {
        return educationLevel;
    }

    public void setEducationLevel(String educationLevel) {
        this.educationLevel = educationLevel;
    }
}

