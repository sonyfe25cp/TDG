package com.omartech.tdg.service;

import java.util.ArrayList;
import java.util.Date;
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
	
	public float getPriceByProductId(int productId, int count){
		Product product  = getProductById(productId);
		Date now = new Date(System.currentTimeMillis());
		Date begin = product.getPromotionTime();
		Date end = product.getPromotionEnd();
		int min = product.getMinimumQuantity();
		int max = product.getMaximumAcceptQuantity();
		if(count < max && count > min){//优先批发价
			float pifa = product.getWholePrice();
			if(pifa - 0.0 < 0.01)
				return product.getRetailPrice();
			else
				return product.getWholePrice();
		}
		if(begin != null && end !=null){//如果在优惠期就用优惠价
			if(now.after(begin) && end.after(now)){
				float pro = product.getPromotionPrice();
				if(pro - 0.0 < 0.1)
					return product.getRetailPrice();
				else
					return product.getPromotionPrice();
			}else{
				return product.getRetailPrice();
			}
		}else{
			return product.getRetailPrice();
		}
	}

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
		
		if(product.getHasChildren() == 1){
			List<Item> items = itemService.getItemsByProductId(id);
			product.setItems(items);
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
	public int insertProduct(Product product){
		String mainImage = product.getMainImage();
		if(mainImage == null || mainImage.equals("") || mainImage.equals("undefined")){
			product.setMainImage(SystemDefaultSettings.DEFAULTPRODUCTIMAGE);
		}
		String sku = product.getSku();
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
			item.setSku(sku);
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
			item.setPromotionEnd(product.getPromotionEnd());
			item.setRetailPrice(product.getRetailPrice());
			item.setSafeStock(product.getSafeStock());
			item.setFeatureJson("");
			item.setCoinage(product.getCoinage());
			item.setSellerId(product.getSellerId());
			item.setProductId(productId);
			itemService.insertItem(item);
		}
		return productId;
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
	public void deleteProduct(int productId){
		updateProductStatus(productId, ProductStatus.Deleted);
		
	}
	public ItemService getItemService() {
		return itemService;
	}
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	
}
