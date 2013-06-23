package com.omartech.tdg.mapper;

import java.util.List;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Translator;

public interface TranslatorMapper {

	public List<Translator> getTranslatorListByPage(Page page);
	
	public Translator getTranslatorByEmail(String email);
	
	public void insertTranslator(Translator translator);
	
	public void updateTranslator(Translator translator);
	
	public void deleteTranslator(int id);
	
	public Translator getTranslatorByEmailAndPassword(String email, String password);
	
	public void active(int id);
	
	public void disActive(int id);
}
