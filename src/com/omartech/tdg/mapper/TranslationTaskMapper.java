package com.omartech.tdg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.TranslationTask;

public interface TranslationTaskMapper {

	public int insertTranslationTask(TranslationTask translationTask);
	
	public List<TranslationTask> getTranslationTaskBySellerId(int sellerId);
	
	public List<TranslationTask> getTranslationTaskByTranslatorId(@Param("translatorId")int translatorId, @Param("page")Page page);
	
	public List<TranslationTask> getTasksByTypeAndPage(@Param("translatorId") int translatorId, @Param("taskType") String taskType, @Param("page") Page page);
	
	public TranslationTask getTranslationTaskById(int id);
	
	public TranslationTask getTranslatioonTaskByTaskIdAndTaskType(@Param("taskId")int taskId,@Param("taskType")String taskType);
	
	public void updateTranslationTask(TranslationTask translationTask);
	
}
