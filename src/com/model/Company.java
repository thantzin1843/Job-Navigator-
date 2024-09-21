package com.model;

public class Company extends User {
	private User user; 
	private int companyId;
	private String name;
	private int userId;
	private String location;
	private String address;
	private String industryType;
	private String companySize;
	private String workingPolicy;
	private String description;
	private String benefits;
	private String phone;
	private String company_photo;
	
	/*
	 * @Override public String toString() { return "Company{" + "companyId=" +
	 * companyId + ", userId=" + userId + ", location='" + location + '\'' +
	 * ", industryType='" + industryType + '\'' + ", companySize='" + companySize +
	 * '\'' + ", workingPolicy='" + workingPolicy + '\'' + ", description='" +
	 * description + '\'' + ", benefits='" + benefits + '\'' + '}'; }
	 */


	// Getters and Setters
	 public User getUser() { return user; }
	 
	 public void setUser(User user) { this.user = user; }
	 

	public int getId() {
		return companyId;
	}

	public void setId(int companyId) {
		this.companyId = companyId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int i) {
		this.userId = i;
	}
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
    public String getImage() {
        return company_photo;
    }

    public void setImage(String company_photo) {
        this.company_photo = company_photo;
    }
}
