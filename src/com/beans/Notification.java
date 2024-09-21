package com.beans;

import java.util.Date;

public class Notification {

	private int applicationId; // application_id
	private int jobId; // job_id
	private int jobSeekerId; // job_seeker_id
	private Date applicationDate; // application_date
	private String status; // status
	private String notiStatus; // noti_status
	private String cv; // cv (file path or binary data)
	private int userId; // user_id
	private String jobTitle;
	private String username;

	// Getters and Setters for each field

	public int getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(int applicationId) {
		this.applicationId = applicationId;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public int getJobSeekerId() {
		return jobSeekerId;
	}

	public void setJobSeekerId(int jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNotiStatus() {
		return notiStatus;
	}

	public void setNotiStatus(String notiStatus) {
		this.notiStatus = notiStatus;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getCv() {
		return cv;
	}

	public void setCv(String cv) {
		this.cv = cv;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
