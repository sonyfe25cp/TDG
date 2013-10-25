package com.omartech.tdg.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omartech.tdg.mapper.ItemMapper;
import com.omartech.tdg.mapper.ShopSettingMapper;
import com.omartech.tdg.model.Coinage;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.ShopSetting;
import com.omartech.tdg.utils.ProductStatus;

@Service
public class ItemService {
	@Autowired
	private ItemMapper itemMapper;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ShopSettingMapper shopSettingMapper;
	
	@Transactional
	public void insertItem(Item item) {
		if(item.getAvailableQuantity() < item.getSafeStock()){
			item.setActive(0);
		}else{
			item.setActive(1);
		}
		item.setStatus(ProductStatus.OK);
		int sellerId = item.getSellerId();
		ShopSetting setting = shopSettingMapper.getShopSettingBySellerId(sellerId);
		int countryCode = setting.getShippingCountry();
		item.setCountryCode(countryCode);
		itemMapper.insertItem(item);
	}
	public float getPriceRMBByItemId(int id, int count){
		float origin = getPriceByItemId(id, count);
		Item item = getItemById(id);
		if(item == null){
			return 0;
		}
		int coinageId = item.getCoinage();
		float result = Coinage.compute(coinageId, origin);//得到该产品对应的人民币价格
		return result;
	}
	/**
	 * 根据itemId和数量来返回对应的价格，是单价，不是乘上数量之后的价格
	 * 返回原来的货币，美元、欧元等
	 */
	public float getPriceByItemId(int id, int count){
		Item item = getItemById(id);
		if(item == null){
			return 0;
		}
		Date now = new Date(System.currentTimeMillis());
		Date begin = item.getPromotionTime();
		Date end = item.getPromotionEnd();
		int min = item.getMinimumQuantity();
		int max = item.getMaximumAcceptQuantity();
		float retail = item.getRetailPrice();
		float result = 0f;
		float pifa = 0;
		float pro = 0;
		if(count < max && count > min){//优先批发价
			pifa = item.getWholePrice();
		}
		if(begin != null && end !=null){//如果在优惠期就用优惠价
			if(now.after(begin) && end.after(now)){
				pro = item.getPromotionPrice();
			}
		}
		//先找pifa和pro中小的那个，如果为0，说明俩有一个是0；
		//再找pifa和pro中最大的那个，若还为0，说明俩都是0；否则就返回这俩中不为0的那个与零售价的最低价
		float tmp = min(pifa, pro);
		if(tmp == 0){
			result =  retail;
		}else{
			float tmpp = max(pifa, pro);
			result =  min(retail, tmpp);
		}
		return result;
	}
	public float min(float a, float b){
		return a < b ? a : b;
	}
	public float max(float a, float b){
		return a > b ? a : b;
	}
	public Item getItemBySku(String sku) {//for 卖家
		Item item = itemMapper.getItemBySku(sku);
		return item;
	}
	
	public Item getItemById(int id){//for 系统
		Item item = itemMapper.getItemById(id);
		return item;
	}
	

	public List<Item> getItemsByProductId(int productId) {
		List<Item> items = itemMapper.getItemsByProductIdAndStatus(productId, ProductStatus.OK);
		return items;
	}
	public List<Item> getItemsByProductIdAndStatus(int productId, int statusId){
		List<Item> items = itemMapper.getItemsByProductIdAndStatus(productId, statusId);
		return items;
	}

	public void updateItem(Item item){
		itemMapper.updateItem(item);
	}
	
	public void updateItemStatus(int itemId, int statusId){
		Item item = getItemById(itemId);
		item.setStatus(statusId);
		updateItem(item);
	}
	
	public void deleteItem(int itemId){
		updateItemStatus(itemId, ProductStatus.Deleted);
//		Item item = getItemById(itemId);
//		int productId = item.getProductId();
//		List<Item> items = getItemsByProductIdAndStatus(productId, ProductStatus.OK);
//		if(items.size() == 0){
//			productService.updateProductStatus(productId, ProductStatus.NoChildren);
//		}
	}
	
	public ItemMapper getItemMapper() {
		return itemMapper;
	}

	public void setItemMapper(ItemMapper itemMapper) {
		this.itemMapper = itemMapper;
	}

}
