package com.omartech.tdg.action;

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

@Controller
@RequestMapping("/test")
public class TestAction {

	@Autowired 
	ProductLineMapper lineMapper;
	
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	ItemMapper itemMapper;
	
	@RequestMapping("/updateLine")
	public void updateProductLineId(){
		List<Item> items = itemMapper.getItemListByPage(new Page(0, 50));
		for(Item item : items){
			int productId = item.getProductId();
			Product product = productMapper.getProductById(productId);
			int lineId = product.getProductLine();
			item.setProductLineId(lineId);
			itemMapper.updateProductLine(item);
		}
		
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
