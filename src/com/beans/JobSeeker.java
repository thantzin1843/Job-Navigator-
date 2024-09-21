package com.beans;

import java.sql.Date;

public class JobSeeker {
	private int user_id;  
	private int job_seeker_id; 
	private String name;  
	private String email;  
	private String password;  
	private String username;  
	private String phone;
	private Date dob;
	private String position;
	private String bio;
	private String address;
	private String role;
	private String image;
	private String cv;
	
	  
	 public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCv() {
		return cv;
	}

	public void setCv(String cv) {
		this.cv = cv;
	}

	// Getter and Setter for user_id
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    // Getter and Setter for job_seeker_id
    public int getJob_seeker_id() {
        return job_seeker_id;
    }

    public void setJob_seeker_id(int job_seeker_id) {
        this.job_seeker_id = job_seeker_id;
    }

    // Getter and Setter for name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Getter and Setter for username
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    // Getter and Setter for phone
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // Getter and Setter for dob
    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    // Getter and Setter for position
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    // Getter and Setter for bio
    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    // Getter and Setter for address
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
	  
}
