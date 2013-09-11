package com.omartech.tdg.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omartech.tdg.mapper.TranslationTaskMapper;
import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.TranslationTask;
import com.omartech.tdg.utils.ProductStatus;
import com.omartech.tdg.utils.TaskType;

@Service
public class TranslationTaskService {

	@Autowired
	private TranslationTaskMapper translationTaskMapper;
	@Autowired
	private ProductService productService;
	@Autowired
	private BrandService brandService;
	
	public void updateTranslationTaskStatus(int id, int status){
		TranslationTask task = translationTaskMapper.getTranslationTaskById(id);
		task.setStatus(status);
		translationTaskMapper.updateTranslationTask(task);
	}
	
	public TranslationTask getTranslationTaskById(int taskId){
		TranslationTask task = translationTaskMapper.getTranslationTaskById(taskId);
		String taskType = task.getTaskType();
		int id = task.getTaskId();
		if(taskType.equals(TaskType.PRODUCT)){
			Product product = productService.getProductById(id);
			task.setProduct(product);
		}else if(taskType.equals(TaskType.BRAND)){
			Brand brand = brandService.getBrandById(id);
			task.setBrand(brand);
		}
		return task;
	}
	
	public List<TranslationTask> getTasksByTypeAndPage(int translatorId, String taskType, Page page){
		List<TranslationTask> tasks = translationTaskMapper.getTasksByTypeAndPage(translatorId, taskType, page);
		for(TranslationTask tt : tasks){
			int id = tt.getTaskId();
			if(taskType.equals(TaskType.PRODUCT)){
				Product product = productService.getProductById(id);
				tt.setProduct(product);
			}else if(taskType.equals(TaskType.BRAND)){
				Brand brand = brandService.getBrandById(id);
				tt.setBrand(brand);
			}
		}
		return tasks;
	}
	@Transactional
	public int insertTranslationTask(TranslationTask translationTask){
		String taskType = translationTask.getTaskType();
		int id = translationTask.getTaskId();
		if(taskType.equals(TaskType.PRODUCT)){
			productService.updateProductStatus(id, ProductStatus.InTranslation);
		}else if(taskType.equals(TaskType.BRAND)){
			brandService.updateBrandStatus(id, ProductStatus.InTranslation);
		}
		translationTask.setCreatedAt(new Date());
		return translationTaskMapper.insertTranslationTask(translationTask);
	}
	public TranslationTaskMapper getTranslationTaskMapper() {
		return translationTaskMapper;
	}
	public void setTranslationTaskMapper(TranslationTaskMapper translationTaskMapper) {
		this.translationTaskMapper = translationTaskMapper;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public BrandService getBrandService() {
		return brandService;
	}
	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}
}
