package com.model;

public class Category {
	private int categoryId;
	private String categoryName;
	private String imageFilename;
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public String getImageFilename() {
		return imageFilename;
	}
	
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
}
