package com.omartech.tdg.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.omartech.tdg.mapper.TranslatorMapper;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Translator;

@Service
public class TranslatorAuthService {

	private TranslatorMapper translatorMapper;
	
	public boolean isEmailExist(String email){
		Translator translator = getTranslatorByEmail(email);
		if(translator!=null){
			return false;
		}else{
			return true;
		}
	}
	
	public Translator getTranslatorByEmail(String email){
		return translatorMapper.getTranslatorByEmail(email);
	}
	
	public Translator getTranslatorByEmailAndPassword(String email,String password){
		return translatorMapper.getTranslatorByEmailAndPassword(email, password);
	}
	
	public List<Translator> getTranslatorListByPage(Page page){
		return translatorMapper.getTranslatorListByPage(page);
	}
	
	public void updateTranslator(Translator translator){
		translatorMapper.updateTranslator(translator);
	}
	
	public void insertTranslator(Translator translator){
		translatorMapper.insertTranslator(translator);
	}
	
	public void deleteTranslator(int id){
		translatorMapper.deleteTranslator(id);
	}
	public void active(int id){
		translatorMapper.active(id);
	}
	public void disActive(int id){
		translatorMapper.disActive(id);
	}

	public TranslatorMapper getTranslatorMapper() {
		return translatorMapper;
	}

	public void setTranslatorMapper(TranslatorMapper translatorMapper) {
		this.translatorMapper = translatorMapper;
	}
	
}
