package com.omartech.tdg.action.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.TranslationTask;
import com.omartech.tdg.service.BrandService;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.service.TranslationTaskService;
import com.omartech.tdg.utils.TaskStatus;
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
	
	@RequestMapping("/show/{id}")
	public ModelAndView showById(@PathVariable int id){
		TranslationTask translationTask = translationTaskService.getTranslationTaskById(id);
		return new ModelAndView("/admin/translationtask/task-show").addObject("translationTask", translationTask);
	}
	
	@RequestMapping("/showByTranslator")
	public ModelAndView taskListByUser(@RequestParam int userId,
			@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo,
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize, HttpSession session){
		List<TranslationTask> tasks = translationTaskService.getTaskListBytranslatorId(userId, new Page(pageNo, pageSize));
		return new ModelAndView("/admin/translationtask/task-list").addObject("tasks", tasks).addObject("pageNo", pageNo).addObject("translatorId", userId);
	}
	
	@RequestMapping("/redo")
	public String reTranslate(@RequestParam int taskId, @RequestParam String taskType){
		TranslationTask task = translationTaskService.getTranslatioonTaskByTaskIdAndTaskType(taskId, taskType);
		int id = task.getId();
		translationTaskService.updateTranslationTaskStatus(id, TaskStatus.REDO);
		return "redirect:/admin/product/listbystatus?status=3";
	}
	
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
