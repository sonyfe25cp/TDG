package com.omartech.tdg.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.TranslationTaskMapper;
import com.omartech.tdg.model.TranslationTask;

@Service
public class TranslationTaskService {

	@Autowired
	private TranslationTaskMapper translationTaskMapper;
	
	public int insertTranslationTask(TranslationTask translationTask){
		translationTask.setCreatedAt(new Date());
		return translationTaskMapper.insertTranslationTask(translationTask);
	}

	public TranslationTaskMapper getTranslationTaskMapper() {
		return translationTaskMapper;
	}

	public void setTranslationTaskMapper(TranslationTaskMapper translationTaskMapper) {
		this.translationTaskMapper = translationTaskMapper;
	}
}
