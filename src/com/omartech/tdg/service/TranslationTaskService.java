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
import com.omartech.tdg.utils.TaskStatus;
import com.omartech.tdg.utils.TaskType;

@Service
public class TranslationTaskService {

	@Autowired
	private TranslationTaskMapper translationTaskMapper;
	@Autowired
	private ProductService productService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private FinanceService financeService;
	
	/**
	 * 找到某个翻译人的所有任务
	 * @param translatorId
	 * @param page
	 * @return
	 */
	public List<TranslationTask> getTaskListBytranslatorId(int translatorId , Page page){
		List<TranslationTask> tasks = translationTaskMapper.getTranslationTaskByTranslatorId(translatorId, page);
		if(tasks !=null && tasks.size() > 0){
			for(TranslationTask tt : tasks){
				String taskType = tt.getTaskType();
				int id = tt.getTaskId();
				if(taskType.equals(TaskType.PRODUCT)){
					Product product = productService.getProductById(id);
					tt.setProduct(product);
				}else if(taskType.equals(TaskType.BRAND)){
					Brand brand = brandService.getBrandById(id);
					tt.setBrand(brand);
				}
			}
		}
		return tasks;
	}
	/**
	 * 更新某个翻译任务的状态
	 * @param id
	 * @param status
	 */
	public void updateTranslationTaskStatus(int id, int status){
		TranslationTask task = translationTaskMapper.getTranslationTaskById(id);
		String taskType = task.getTaskType();
		int taskId = task.getTaskId();
		if(status == TaskStatus.OK){
			int count = task.getCount();
			count = count+1;
			task.setCount(count);
			financeService.insertTranslationFinance(task);
		}else if(status == TaskStatus.REDO){
			if(taskType.equals(TaskType.PRODUCT)){
				productService.updateProductStatus(taskId, ProductStatus.InTranslation);
			}else if(taskType.equals(TaskType.BRAND)){
				brandService.updateBrandStatus(taskId, ProductStatus.InTranslation);
			}
		}
		task.setStatus(status);
		translationTaskMapper.updateTranslationTask(task);
	}
	
	public TranslationTask getTranslationTaskById(int id){
		TranslationTask task = translationTaskMapper.getTranslationTaskById(id);
		String taskType = task.getTaskType();
		int taskId = task.getTaskId();
		if(taskType.equals(TaskType.PRODUCT)){
			Product product = productService.getProductById(taskId);
			task.setProduct(product);
		}else if(taskType.equals(TaskType.BRAND)){
			Brand brand = brandService.getBrandById(taskId);
			task.setBrand(brand);
		}
		return task;
	}
	
	public TranslationTask getTranslatioonTaskByTaskIdAndTaskType(int taskId, String taskType){
		return translationTaskMapper.getTranslationTaskByTaskIdAndTaskType(taskId, taskType);
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
