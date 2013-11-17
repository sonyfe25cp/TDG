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
	
	public List<Product> searchProductByName(String name, Page page){
		return productMapper.searchProductByName(name, page);
	}
	
//	/**
//	 * 价格在itemservice中判断，与product无关了
//	 * @deprecated
//	 * @param id
//	 * @return
//	 */
//	public float getPriceByProductId(int productId, int count){
//		Product product  = getProductById(productId);
//		Date now = new Date(System.currentTimeMillis());
//		Date begin = product.getPromotionTime();
//		Date end = product.getPromotionEnd();
//		int min = product.getMinimumQuantity();
//		int max = product.getMaximumAcceptQuantity();
//		if(count < max && count > min){//优先批发价
//			float pifa = product.getWholePrice();
//			if(pifa - 0.0 < 0.01)
//				return product.getRetailPrice();
//			else
//				return product.getWholePrice();
//		}
//		if(begin != null && end !=null){//如果在优惠期就用优惠价
//			if(!now.before(begin) && !end.before(now)){
//				float pro = product.getPromotionPrice();
//				if(pro - 0.0 < 0.1)
//					return product.getRetailPrice();
//				else
//					return product.getPromotionPrice();
//			}else{
//				return product.getRetailPrice();
//			}
//		}else{
//			return product.getRetailPrice();
//		}
//	}

	public Product getProductById(int id){
		Product product =  productMapper.getProductById(id);
		if(product == null){
			return null;
		}
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
		List<Product> products = productMapper.getProductListByPageAndSeller(page, sellerId);
		for(Product product : products){//对于无子商品的产品，需要从Item同步库存量回主产品用于商家列表的显示
			int hasChildren = product.getHasChildren();
			if(hasChildren == 0){
				List<Item> items = itemService.getItemsByProductId(product.getId());
				if(items.size() == 1){
					Item item = items.get(0);
					product.setAvailableQuantity(item.getAvailableQuantity());
					product.setActive(item.getActive());
				}
			}
		}
		return products;
	}
	public List<Product> getProductListByPageAndStatus(Page page, int status){
		return productMapper.getProductListByPageAndStatus(page, status);
	}
	public List<Product> getSellableProductListByPage(Page page){
		return productMapper.getSellableProductListByPage(page, ProductStatus.Sellable, ProductStatus.ChinaListingCreated);
	}
	public List<Product> getUnsellableProductListByPage(Page page){
		return productMapper.getSellableProductListByPage(page, ProductStatus.Unsellable, ProductStatus.ChinaListingCreated);
	}
	
	public List<Product> getProductListByPage(Page page){
		return productMapper.getProductListByPage(page);
	}
	
	public List<Product> getProductsInCategoryByPage(int categoryId, Page page){
		return productMapper.getProductsInCategoryByPage(categoryId,page);
	}

	@Transactional
	public int insertProduct(Product product){
		/**
		 * 验证推广价相关
		 */
		float promoPrice = product.getPromotionPrice();
		Date promoBegin = product.getPromotionTime();
		Date promoEnd = product.getPromotionEnd();
		if(promoPrice == 0f || promoBegin == null || promoEnd == null){
			product.setPromotionEnd(null);
			product.setPromotionTime(null);
			product.setPromotionPrice(0f);
		}
		
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
			itemService.insertItemAsProduct(product);
		}
		return productId;
	}
	
	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}
	/**
	 * 只修改内容，不变更产品状态
	 * @param product
	 */
	public void quickUpdateProduct(Product product){
		updateProduct(product);
	}
	/**
	 * 将会更改产品状态至重新翻译的状态
	 * @param product
	 */
	public void slowUpdateProduct(Product product){
		product.setStatus(ProductStatus.InEnglishDisplay);
		updateProduct(product);
	}
	/**
	 * 当修改无子产品的商品时，需要修改其对应的item
	 * @param product
	 */
	private void updateProduct(Product product){
		int hasChildren = product.getHasChildren();
		if(hasChildren == 0){
			itemService.updateSingleProductItem(product);
		}
		productMapper.updateProduct(product);
	}
	public void translateProduct(Product product){
		int productId  = product.getId();
		List<Item> items = itemService.getItemsByProductId(productId);
		for(Item item: items){
			item.setNameInChinese(product.getNameInChinese());
			itemService.updateItem(item);
		}
		productMapper.updateProduct(product);
	}
	/**
	 * 改变翻译状态
	 * @param productId
	 * @param status
	 */
	public void updateProductStatus(int productId, int status){
		Product product = getProductById(productId);
		if(status == ProductStatus.Sellable || status == ProductStatus.Unsellable){
			updateProductSellable(productId, status);
		}else{
			product.setStatus(status);
			updateProduct(product);
		}
	}
	/**
	 * 改变可售状态
	 * @param productId
	 * @param status
	 */
	public void updateProductSellable(int productId, int status){
		Product product = getProductById(productId);
		product.setSellable(status);
		updateProduct(product);
	}
	public void changeProductsOfSeller(int sellerId, int sellable){//某seller的所有商品改变状态
		productMapper.changeProductsOfSeller(sellerId, sellable, ProductStatus.ChinaListingCreated);
	}
	/**
	 * 删除商品，只是将状态变成删除，并没有真正删除
	 * @param productId
	 */
	public void deleteProduct(int productId){
		updateProductStatus(productId, ProductStatus.Deleted);
	}
	
//	public boolean reduceStock(int productId, int count){
//		Product product = getProductById(productId);
//		int available = product.getAvailableQuantity();
//		int safeStock = product.getSafeStock();
//		
//		available = available - count;
//		if(available < 0){
//			return false;
//		}
//		product.setAvailableQuantity(available);
//		if(available < safeStock){
//			product.setActive(0);
//			Seller  seller = sellerAuthService.getSellerById(product.getSellerId());
//			emailService.sendEmailWhenProductWillSoldOut(productId, seller);
//		}
//		return true;
//	}
	
	public ItemService getItemService() {
		return itemService;
	}
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	
}
