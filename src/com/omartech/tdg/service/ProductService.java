package com.omartech.tdg.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omartech.tdg.mapper.ProductMapper;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.utils.ProductStatus;
import com.omartech.tdg.utils.SystemDefaultSettings;

@Service
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private ItemService itemService;

	public Product getProductById(int id){
		Product product =  productMapper.getProductById(id);
		String subImages = product.getSubImages();
		if(subImages.length()>1){
			List<String> images = new ArrayList<String>();
			String tmps[] = subImages.split(";");
			for(String tmp : tmps){
				images.add(tmp);
			}
			product.setOtherImages(images);
		}
		return product;
	}
	public List<Product> getProductListByPageAndSeller(Page page, int sellerId){
		return productMapper.getProductListByPageAndSeller(page, sellerId);
	}
	public List<Product> getProductListByPageAndStatus(Page page, int status){
		return productMapper.getProductListByPageAndStatus(page, status);
	}
	public List<Product> getProductListByPage(Page page){
		return productMapper.getProductListByPage(page);
	}
	
	public List<Product> getProductsInCategoryByPage(int categoryId, Page page){
		return productMapper.getProductsInCategoryByPage(categoryId,page);
	}
	
	@Transactional
	public void insertProduct(Product product){
		String mainImage = product.getMainImage();
		if(mainImage == null || mainImage.equals("") || mainImage.equals("undefined")){
			product.setMainImage(SystemDefaultSettings.DEFAULTPRODUCTIMAGE);
		}
		int sku = product.getId();
		if(product.getAvailableQuantity() >= product.getSafeStock()){
			product.setActive(1);
		}else{
			product.setActive(0);
		}
		product.setStatus(ProductStatus.InProductCreation);
		productMapper.insertProduct(product);
		int productId  = product.getId();
		int hasChildren = product.getHasChildren();
		if(hasChildren==0){
			Item item = new Item();
			if(sku == 0){
				item.setSku(product.getId());
			}else{
				item.setSku(sku);
			}
			item.setWholePrice(product.getWholePrice());
			item.setAvailableQuantity(product.getAvailableQuantity());
			item.setCategoryId(product.getProductTypeId());
			item.setImage(product.getMainImage());
			item.setMaximumAcceptQuantity(product.getMaximumAcceptQuantity());
			item.setMinimumQuantity(product.getMinimumQuantity());
			item.setName(product.getName());
			item.setNameInChinese(product.getNameInChinese());
			item.setPromotionPrice(product.getPromotionPrice());
			item.setPromotionTime(product.getPromotionTime());
			item.setRetailPrice(product.getRetailPrice());
			item.setSafeStock(product.getSafeStock());
			item.setFeatureJson("");
			item.setSellerId(product.getSellerId());
			item.setProductId(productId);
			itemService.insertItem(item);
		}
	}
	
	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}
	public void updateProduct(Product product){
		productMapper.updateProduct(product);
	}
	public void updateProductStatus(int productId, int status){
		Product product = getProductById(productId);
		product.setStatus(status);
		updateProduct(product);
	}
	public ItemService getItemService() {
		return itemService;
	}
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	
}
