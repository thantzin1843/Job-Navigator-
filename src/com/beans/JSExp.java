
package com.beans;

import java.sql.Date;

public class JSExp {
	private int id;
	private int userId;
	private String company;
	private String position;
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
    
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
    
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
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
