package com.omartech.tdg.action.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.TranslationTask;
import com.omartech.tdg.service.BrandService;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.service.TranslationTaskService;
import com.omartech.tdg.utils.TaskType;
@RequestMapping("/admin/translationTask/")
@Controller
public class AdminTranslationTask {
	@Autowired
	private ProductService productService;
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private TranslationTaskService translationTaskService;
	
	@ResponseBody
	@RequestMapping("batch")
	public String batchCommand(@RequestParam String ids, @RequestParam int translatorId, @RequestParam String taskType){
		String[] tmpArray = ids.split(",");
		for(String tmp : tmpArray){
			if(tmp.length()==0){
				continue;
			}
			TranslationTask tt = new TranslationTask();
			int id = Integer.parseInt(tmp);
			if(taskType.equals(TaskType.PRODUCT)){
				Product product = productService.getProductById(id);
				tt.setSellerId(product.getSellerId());
			}else if(taskType.equals(TaskType.BRAND)){
				Brand brand = brandService.getBrandById(id);
				tt.setSellerId(brand.getSellerId());
			}
			tt.setTaskId(id);
			tt.setTaskType(taskType);
			tt.setTranslatorId(translatorId);
			translationTaskService.insertTranslationTask(tt);
		}
		return "ok";
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