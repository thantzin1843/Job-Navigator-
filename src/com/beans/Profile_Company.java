package com.beans;

import java.util.List;

public class Profile_Company {
	private int companyId;
	private int userId;
	private String companyName;
	private String companyPhoto;
	private String location;
	private String phoneNumber;
	private String industryType;
	private String companySize;
	private String workingPolicy;
	private String description;
	private String benefits;
	private List<Profile_Job> jobs; 
	 private List<SocialMediaAccount> socialMediaAccounts;// List of jobs
	 private List<Review> reviews;
	// Getter and setter methods
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyPhoto() {
		return companyPhoto;
	}

	public void setCompanyPhoto(String companyPhoto) {
		this.companyPhoto = companyPhoto;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getIndustryType() {
		return industryType;
	}

	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}

	public String getCompanySize() {
		return companySize;
	}

	public void setCompanySize(String companySize) {
		this.companySize = companySize;
	}

	public String getWorkingPolicy() {
		return workingPolicy;
	}

	public void setWorkingPolicy(String workingPolicy) {
		this.workingPolicy = workingPolicy;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBenefits() {
		return benefits;
	}

	public void setBenefits(String benefits) {
		this.benefits = benefits;
	}

	public List<Profile_Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Profile_Job> jobs) {
		this.jobs = jobs;
	}
	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	public List<SocialMediaAccount> getSocialMediaAccounts() {
        return socialMediaAccounts;
    }

    public void setSocialMediaAccounts(List<SocialMediaAccount> socialMediaAccounts) {
        this.socialMediaAccounts = socialMediaAccounts;
    }
}
