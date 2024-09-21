package com.beans;

public class Profile_Job {
	private Integer jobId;
	private Integer companyId;
	private String jobTitle;
	private String employmentType;
	private String workingSetting;
	private String location; // Add this field if it’s needed

	// Getters and setters for all fields
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
