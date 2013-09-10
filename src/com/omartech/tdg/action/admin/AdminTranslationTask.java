package com.omartech.tdg.action.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.TranslationTask;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.service.TranslationTaskService;
@RequestMapping("/admin/translationTask/")
@Controller
public class AdminTranslationTask {
	@Autowired
	private ProductService productService;
	@Autowired
	private TranslationTaskService translationTaskService;
	
	@RequestMapping("batch")
	public String batchCommand(@RequestParam String ids, @RequestParam int translatorId, @RequestParam String taskType){
		String[] tmpArray = ids.split(",");
		for(String tmp : tmpArray){
			TranslationTask tt = new TranslationTask();
			int id = Integer.parseInt(tmp);
			Product product = productService.getProductById(id);
			tt.setSellerId(product.getSellerId());
			tt.setTaskId(id);
			tt.setTaskType(taskType);
			tt.setTranslatorId(translatorId);
			translationTaskService.insertTranslationTask(tt);
		}
		return "";
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public TranslationTaskService getTranslationTaskService() {
		return translationTaskService;
	}
	public void setTranslationTaskService(
			TranslationTaskService translationTaskService) {
		this.translationTaskService = translationTaskService;
	}

}
