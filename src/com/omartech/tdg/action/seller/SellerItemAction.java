package com.omartech.tdg.action.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.utils.JsonMessage;
import com.omartech.tdg.utils.TimeFormat;

@Controller
@RequestMapping("/seller/item/")
public class SellerItemAction {
	@Autowired
	private ItemService itemService;

	@RequestMapping("/add")
	public ModelAndView addItem(@RequestParam int sku){
		
		return new ModelAndView();
	}
	
	@RequestMapping("/edit")
	public ModelAndView editItem(@RequestParam int itemId){
		Item item = itemService.getItemById(itemId);
		return new ModelAndView("/seller/product/item-edit").addObject("item", item);
	}
	@ResponseBody
	@RequestMapping(value =  "/update", method = RequestMethod.POST)
	public JsonMessage updateItem(@RequestParam int itemId,
			@RequestParam(value="sku", required=false) String sku,
			@RequestParam(value="mainImg", required=false) String mainImg,
			@RequestParam(value="params", required=false) String params,
			@RequestParam(value="retailPrice", required=false) float retailPrice,
			@RequestParam(value="promotionPrice", required=false) Float promotionPrice,
			@RequestParam(value="promotionTime", required=false) String promotionTime,
			@RequestParam(value="promotionEnd", required=false) String promotionEnd,
			@RequestParam(value="wholePrice", required=false) float wholePrice,
			@RequestParam(value="minimumQuantity", required=false) Integer minimumQuantity,
			@RequestParam(value="maximumAcceptQuantity", required=false) Integer maximumAcceptQuantity,
			@RequestParam(value="maximumAcceptQuantity", required=false) Integer availableQuantity,
			@RequestParam(value="safeStock", required=false) Integer safeStock
			){
		Item item = itemService.getItemById(itemId);
		
		item.setSku(sku);
		item.setImage(mainImg);
		item.setFeatureJson(params);
		item.setRetailPrice(retailPrice);
		item.setPromotionPrice(promotionPrice);
		if(promotionTime !=null && promotionEnd !=null){
			item.setPromotionTime(TimeFormat.StringToDate(promotionTime));
			item.setPromotionEnd(TimeFormat.StringToDate(promotionEnd));
		}
		item.setWholePrice(wholePrice);
		item.setMinimumQuantity(minimumQuantity);
		item.setMaximumAcceptQuantity(maximumAcceptQuantity);
		item.setAvailableQuantity(availableQuantity);
		item.setSafeStock(safeStock);
		
		if(item.getSellable() == Item.UnSellable || item.getActive() == Product.UnSafeStock){
			if(availableQuantity > 0){
				item.setSellable(Item.Sellable);
				if(availableQuantity >= safeStock){
					item.setActive(Product.SafeStock);
				}
			}
		}
		boolean flag = itemService.updateItem(item);
		if(flag){
			return new JsonMessage(true, "success");
		}else{
			return new JsonMessage(false, "You chose a different variance type in this Child SKU with other Child SKU, Variance Type is required to be same for all Child SKUs under One Parent SKU. Please check and change.");
		}
	}
	@ResponseBody
	@RequestMapping("/delete")
	public JsonMessage deleteItem(@RequestParam int itemId){
    itemService.deleteItem(itemId);
		return new JsonMessage(true, "delete it successful~");
	}
}
