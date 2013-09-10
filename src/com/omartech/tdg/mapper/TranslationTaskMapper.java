package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.TranslationTask;

public interface TranslationTaskMapper {

	public int insertTranslationTask(TranslationTask translationTask);
	
	public List<TranslationTask> getTranslationTaskBySellerId(int sellerId);
	
	public List<TranslationTask> getTranslationTaskByTranslatorId(int translatorId);
	
	
}
