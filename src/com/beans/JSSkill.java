package com.beans;

import javax.validation.constraints.NotEmpty;

public class JSSkill {
	private int id;
    private int userId;
    
    @NotEmpty(message = "Skill is required")
    private String skill;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }
}
