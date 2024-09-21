package com.beans;
import java.time.LocalDateTime;


public class AdminDashboard {
	
	
	
	    private Long id;
	    private String ipAddress;
	    private boolean isNewVisitor;
	    private LocalDateTime visitTime;

	    // Getters and Setters
	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getIpAddress() {
	        return ipAddress;
	    }

	    public void setIpAddress(String ipAddress) {
	        this.ipAddress = ipAddress;
	    }

	    public boolean isNewVisitor() {
	        return isNewVisitor;
	    }

	    public void setNewVisitor(boolean isNewVisitor) {
	        this.isNewVisitor = isNewVisitor;
	    }

	    public LocalDateTime getVisitTime() {
	        return visitTime;
	    }

	    public void setVisitTime(LocalDateTime visitTime) {
	        this.visitTime = visitTime;
	    }
	


}
