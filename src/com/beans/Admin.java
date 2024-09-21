package com.beans;

public class Admin {
    private Integer adminId;
    private Integer userId;    
    private String firstName;
    private String lastName;
    private String email;
    private String password; // Correctly storing password
    private String currentPassword; // Separate field for current password in forms
    private String adminPhoto;

    // Getters and Setters
    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }
    
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Correct getter and setter for the password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Getter and setter for currentPassword if used in the form
    public String getCurrentPassword() {
        return currentPassword;
    }

    public void setCurrentPassword(String currentPassword) {
        this.currentPassword = currentPassword;
    }

    public String getAdminPhoto() {
        return adminPhoto;
    }

    public void setAdminPhoto(String adminPhoto) {
        this.adminPhoto = adminPhoto;
    }
}
