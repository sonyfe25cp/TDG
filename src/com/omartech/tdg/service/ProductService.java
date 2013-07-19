package com.omartech.tdg.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omartech.tdg.mapper.BaseFeatureMapper;
import com.omartech.tdg.mapper.ItemSubPropertyMapper;
import com.omartech.tdg.mapper.ProductMapper;
import com.omartech.tdg.model.BaseFeature;
import com.omartech.tdg.model.ItemSubProperty;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;

@Service
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ItemSubPropertyMapper itemSubPropertyMapper;
	
	@Autowired
	private BaseFeatureMapper baseFeatureMapper;

	public Product getProductById(long id){
		Product product =  productMapper.getProductById(id);
		int cid = product.getProductTypeId();
		String subImages = product.getSubImages();
		if(subImages.length()>1){
			List<String> images = new ArrayList<String>();
			String tmps[] = subImages.split(";");
			for(String tmp : tmps){
				images.add(tmp);
			}
			product.setOtherImages(images);
		}
		String basicParams = product.getBasicParams();
		if(basicParams.length() > 1){
			Map<String, String> params = new HashMap<String, String>();
			Map<String, String> paramsInEnglish = new HashMap<String, String>();
			String tmps[] = basicParams.split(";");
			for(String pair : tmps){
				String tmp[] = pair.split(":");
				String pid =  tmp[0];
				String vid = tmp[1];
				String inputOrSelect = tmp[2];
				System.out.println(pid +" :  " + vid +" : "+inputOrSelect);
				ItemSubProperty property = itemSubPropertyMapper.getItemSubPropertyByPid(Integer.parseInt(pid), cid);
				String name = property.getPname();
				String nameInEnglish = property.getEnglish();
				if(inputOrSelect.equals("1")){
					BaseFeature baseFeature = baseFeatureMapper.getBaseFeatureById(Integer.parseInt(vid));
					String value = baseFeature.getName();
					String valueInEnglish = property.getEnglish();
					params.put(name, value);
					paramsInEnglish.put(nameInEnglish, valueInEnglish);
				}else{
					params.put(name, vid);
					paramsInEnglish.put(name, vid);
				}
			}
			product.setBasicParamsMap(params);
			product.setBasicParamsMapInEnglish(paramsInEnglish);
		}
		return product;
	}
	
	public List<Product> getProductListByPage(Page page){
		return productMapper.getProductListByPage(page);
	}
	
	public List<Product> getProductsInCategoryByPage(int categoryId, Page page){
		return productMapper.getProductsInCategoryByPage(categoryId,page);
	}
	
	@Transactional
	public void insertProduct(Product product){
		productMapper.insertProduct(product);
	}
	
	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	void updateProduct(Product product){
		
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
}
