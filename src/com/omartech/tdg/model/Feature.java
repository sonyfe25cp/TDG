package com.omartech.tdg.model;

public class Feature {
	
	private int id;
	private String name;
	private String english;
	
	private int featureGroupId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnglish() {
		return english;
	}

	public void setEnglish(String english) {
		this.english = english;
	}

	public int getFeatureGroupId() {
		return featureGroupId;
	}

	public void setFeatureGroupId(int featureGroupId) {
		this.featureGroupId = featureGroupId;
	}

}
