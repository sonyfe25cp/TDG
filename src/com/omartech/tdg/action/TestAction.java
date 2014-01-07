package com.omartech.tdg.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omartech.tdg.mapper.ItemMapper;
import com.omartech.tdg.mapper.ProductLineMapper;
import com.omartech.tdg.mapper.ProductMapper;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.FinanceService;
import com.omartech.tdg.service.seller.SellerAuthService;

@Controller
@RequestMapping("/test")
public class TestAction {

	@Autowired 
	ProductLineMapper lineMapper;
	
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	ItemMapper itemMapper;
	@Autowired
	private FinanceService financeService;
	@Autowired
	private SellerAuthService sellerAuthService;
	
	@RequestMapping("/financeRecordTestYesterday")
	public void generateYesterdayRecord(){
		System.out.println("生成昨天的对账单");
		List<Seller> sellers = sellerAuthService.getSellerListByPage(null);
		for(Seller seller : sellers){
			Calendar now = Calendar.getInstance();
			System.out.println("begin to compute seller : "+ seller.getEmail() +" at "+now.getTime());
			Calendar beg = Calendar.getInstance();
			beg.set(Calendar.DATE, beg.get(Calendar.DATE)-1);
			beg.set(Calendar.HOUR_OF_DAY, 0);
			beg.set(Calendar.MINUTE, 0);
			beg.set(Calendar.SECOND, 0);
			
			Date begin = beg.getTime();
			
			Calendar ed = Calendar.getInstance();
			ed.set(Calendar.HOUR_OF_DAY, 0);
			ed.set(Calendar.MINUTE, 0);
			ed.set(Calendar.SECOND, 0);
			Date end = ed.getTime();
			System.out.println("begin: "+ begin +" end: "+end);
			int userId = seller.getId();
			financeService.computeForSeller(begin, end, userId);
		}
	}
	@RequestMapping("/financeRecordTestToday")
	public void generateTodayRecord(){
		System.out.println("生成今天的对账单");
		List<Seller> sellers = sellerAuthService.getSellerListByPage(null);
		for(Seller seller : sellers){
			Calendar now = Calendar.getInstance();
			System.out.println("begin to compute seller : "+ seller.getEmail() +" at "+now.getTime());
			Calendar beg = Calendar.getInstance();
			beg.set(Calendar.HOUR_OF_DAY, 0);
			beg.set(Calendar.MINUTE, 0);
			beg.set(Calendar.SECOND, 0);
			
			Date begin = beg.getTime();
			
			Calendar ed = Calendar.getInstance();
			ed.set(Calendar.DATE, beg.get(Calendar.DATE)+1);
			ed.set(Calendar.HOUR_OF_DAY, 0);
			ed.set(Calendar.MINUTE, 0);
			ed.set(Calendar.SECOND, 0);
			Date end = ed.getTime();
			System.out.println("begin: "+ begin +" end: "+end);
			int userId = seller.getId();
			financeService.computeForSeller(begin, end, userId);
		}
	}
	
	
//	@RequestMapping("/updateLine")
//	public void updateProductLineId(){
//		List<Item> items = itemMapper.getItemListByPage(new Page(0, 50));
//		for(Item item : items){
//			int productId = item.getProductId();
//			Product product = productMapper.getProductById(productId);
//			int lineId = product.getProductLine();
//			item.setProductLineId(lineId);
//			itemMapper.updateProductLine(item);
//		}
//	}
	
	@RequestMapping("/hello")
	public String hello(){
		return "/tmp/hello";
	}

	public ProductLineMapper getLineMapper() {
		return lineMapper;
	}

	public void setLineMapper(ProductLineMapper lineMapper) {
		this.lineMapper = lineMapper;
	}

	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	public ItemMapper getItemMapper() {
		return itemMapper;
	}

	public void setItemMapper(ItemMapper itemMapper) {
		this.itemMapper = itemMapper;
	}
}
