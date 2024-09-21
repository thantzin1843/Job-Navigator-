package com.beans;

import java.sql.Timestamp;

public class Review {
    private long reviewId;
    private int companyId;
    private int jobSeekerId;  // Default value set to 1
    private int rating;
    private String reviewText;
    private Timestamp reviewDate;
    private String position;  // Pulled from workexperience table
    private String firstName;  // Add this field
    private String lastName; 
    private String name; 
    private String jobSeekerPhoto;
    // Getters and Setters
    public long getReviewId() {
        return reviewId;
    }

    public void setReviewId(long reviewId) {
        this.reviewId = reviewId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public int getJobSeekerId() {
        return jobSeekerId;
    }

    public void setJobSeekerId(int jobSeekerId) {
        this.jobSeekerId = jobSeekerId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public Timestamp getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Timestamp reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
    
    public String getJobSeekerPhoto() {
        return jobSeekerPhoto;
    }
    public void setJobSeekerPhoto(String jobSeekerPhoto) {
        this.jobSeekerPhoto = jobSeekerPhoto;
    }
   

    public String getFirstName() {
        return firstName;
    }

    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String getName() {
        return name;
    }

    
    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}
