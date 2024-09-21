package com.beans;

import java.sql.Date;

public class JSEducation {
	private int id;
	private int userId;
	private String university;
	private String major;
	private Date start;
	private Date end;
	
	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
	public int getUserId() {
        return userId;
    }

    public void setUserId(int user_id) {
        this.userId = user_id;
    }
    
    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }
    
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
    
    public Date getEnd() {
        return end;
    }

    public void setEnd(Date to) {
        this.end = to;
    }
    
    public Date getStart() {
        return start;
    }

    public void setStart(Date dob) {
        this.start = dob;
    }
    
	
}
