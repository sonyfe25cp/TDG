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
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.seller.SellerAuthService;
import com.omartech.tdg.utils.ProductStatus;

@Service
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private ItemService itemService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private SellerAuthService sellerAuthService;
	
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
		/*
		 * 插入产品
		 */
		product.setStatus(ProductStatus.InProductCreation);
		productMapper.insertProduct(product);
		
		/*
		 * 判断是否需要插入单品
		 */
		int productId  = product.getId();
		int hasChildren = product.getHasChildren();
		if(hasChildren==0){
			Item item = new Item(product);
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
	
	public boolean reduceStock(int productId, int count){
		Product product = getProductById(productId);
		int available = product.getAvailableQuantity();
		int safeStock = product.getSafeStock();
		
		available = available - count;
		if(available < 0){
			return false;
		}
		product.setAvailableQuantity(available);
		if(available < safeStock){
			product.setActive(0);
			Seller  seller = sellerAuthService.getSellerById(product.getSellerId());
			emailService.sendEmailWhenProductWillSoldOut(productId, seller);
		}
		return true;
	}
	
	public ItemService getItemService() {
		return itemService;
	}
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	
}
