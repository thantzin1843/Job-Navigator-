package com.beans;
import javax.validation.Valid;
import java.util.ArrayList;
import javax.validation.constraints.Pattern;
import java.util.List;

public class Profile {
	private Integer companyId;
	private String companyPhoto;
	private String name;
	
	//@Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Location must contain only letters and spaces")
	private String location;
	
	//@Pattern(regexp = "^[a-zA-Z0-9\\s,\\.]+$", message = "Address must be a valid format with letters, numbers, commas, and periods")
	private String address;
	
	//@Pattern(regexp = "^\\+?[0-9. ()-]{7,15}$", message = "Phone number must be a valid format")
	private String phoneNumber;
	
	private String industryType;
	private String companySize;
	private String workingPolicy;
	private String description;
	private String benefits;	
	
	private List<String> socialMediaUrls = new ArrayList<>();
	private List<String> socialMediaPlatform = new ArrayList<>();

	// Getters and setters for each field
	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	public String getAddress() {
	        return address;
	}

	 
	public void setAddress(String address) {
	        this.address = address;
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

	public void addSocialMediaUrl(String url) {
		this.socialMediaUrls.add(url);
	}

	public void addSocialMediaPlatform(String platform) {
		this.socialMediaPlatform.add(platform);
	}

	public List<String> getSocialMediaUrls() {
		return socialMediaUrls;
	}

	public void setSocialMediaUrls(List<String> socialMediaUrls) {
		this.socialMediaUrls = socialMediaUrls;
	}

	public List<String> getSocialMediaPlatform() {
		return socialMediaPlatform;
	}

	public void setSocialMediaPlatform(List<String> socialMediaPlatform) {
		this.socialMediaPlatform = socialMediaPlatform;
	}
}
