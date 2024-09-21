package com.beans;
import java.util.List;

public class Company {
    private int companyId;
    private String companyName;
    private String location;
    private String workingPolicy;
    private String companyPhoto;

    private int userId;	
	private String phoneNumber;
	private String industryType;
	private String companySize;
	private String description;
	private String benefits;
	
    // Getters and Setters
    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
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

    public String getWorkingPolicy() {
        return workingPolicy;
    }

    public void setWorkingPolicy(String workingPolicy) {
        this.workingPolicy = workingPolicy;
    }
    
    public String getCompanyPhoto() {
        return companyPhoto;
    }

    public void setCompanyPhoto(String companyPhoto) {
        this.companyPhoto = companyPhoto;
    }
    
    public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
	
	
}

