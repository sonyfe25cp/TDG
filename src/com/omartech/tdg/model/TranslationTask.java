package com.omartech.tdg.model;

import java.util.Date;

public class TranslationTask {

	private int id; //自增id
	private int taskId; //任务id 如：productId
	private int sellerId; //sellerId
	private int translatorId;
	private String taskType; //#{TaskType}
	private int status;
	private Date createdAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getTranslatorId() {
		return translatorId;
	}
	public void setTranslatorId(int translatorId) {
		this.translatorId = translatorId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getTaskType() {
		return taskType;
	}
	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}
}
