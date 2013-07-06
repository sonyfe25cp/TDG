package com.omartech.tdg.action.seller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.ProductCategory;
import com.omartech.tdg.service.CategoryService;
import com.omartech.tdg.service.ProductService;

@Controller
@RequestMapping(value="/seller/product/")
public class SellerProductAction {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	private Logger logger = Logger.getLogger(SellerProductAction.class);
	
	//通向产品分类选择页面，选择category
	@RequestMapping(value="category-select")
	public ModelAndView categorySelect(){
		List<ProductCategory> categories = categoryService.getProductCategories();
		logger.info("categories list size is :"+categories.size());
		return new ModelAndView("/seller/product/category-select").addObject("categories", categories);
	}
	//提交category，开始进入产品详细页面
	@RequestMapping(value="productadd")
	public ModelAndView selectCategory(
			@RequestParam(value="cid") String categoryId){
		//获取对应的销售属性
		
		return new ModelAndView("/seller/product/product-add").addObject("categoryId", categoryId);
	}
	@RequestMapping(value="addproduct", method=RequestMethod.POST)
	public String addProduct(
			@RequestParam int categoryId,
			@RequestParam MultipartFile mainImage,
			@RequestParam MultipartFile[] images,
			HttpServletRequest request
			){
		for(MultipartFile subImage : images){  
            if(subImage.isEmpty()){  
                System.out.println("文件未上传");  
            }else{  
                System.out.println("文件长度: " + subImage.getSize());  
                System.out.println("文件类型: " + subImage.getContentType());  
                System.out.println("文件名称: " + subImage.getName());  
                System.out.println("文件原名: " + subImage.getOriginalFilename());  
                System.out.println("========================================");  
                String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/uploads/");
                try {
                	String newName = System.currentTimeMillis()+subImage.getContentType();
					FileUtils.copyInputStreamToFile(subImage.getInputStream(), new File(realPath, newName));
				} catch (IOException e) {
					e.printStackTrace();
				}  
            }  
        }  
		return "redirect:/seller/product/list";
	}
	
	
	@RequestMapping(value="list")
	public ModelAndView list(@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, @RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		Page page = new Page(pageNo,pageSize);
		
		List<Product> products = productService.getProductListByPage(page);
		
		return new ModelAndView("/seller/product/product-list").addObject("products", products).addObject("pageNo", pageNo);
	}
	
	@RequestMapping(value="subcategory")
	@ResponseBody
	public List<ProductCategory> getSubCategoriesByCid(@RequestParam(value="cid") int cid){
		List<ProductCategory> subCategories = categoryService.getSubProductCategories(cid);
		return subCategories;
	}
	
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
}
