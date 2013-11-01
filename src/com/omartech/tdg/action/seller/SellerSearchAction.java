package com.omartech.tdg.action.seller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.model.Order;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.OrderService;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.utils.SearchOptions;
@Controller
@RequestMapping("/seller/search")
public class SellerSearchAction {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/index")
	public String search(){
		return "/seller/search/index";
	}
	@RequestMapping("/byProductId")
	public ModelAndView productSearch(@RequestParam int productId){
		Product product = productService.getProductById(productId);
		List<Product> products = new ArrayList<Product>();
		if(product !=null)
			products.add(product);
		return new ModelAndView("/seller/search/product-search").addObject("products", products);
	}
	
	@RequestMapping("/byOrderId")
	public ModelAndView searchById(@RequestParam int orderId){
		Order order = orderService.getOrderById(orderId);
		List<Order> orders = new ArrayList<Order>();
		if(order !=null )
			orders.add(order);
		return new ModelAndView("/seller/search/order-search").addObject("orders", orders);
	}
	
	@RequestMapping("/byDateRange")
	public ModelAndView searchByDate(@RequestParam int option){
		Calendar begin = Calendar.getInstance();
		
		switch(option){
		case SearchOptions.LastDay:
			begin.add(Calendar.DATE, -1);
			break;
		case SearchOptions.Last3days:
			begin.add(Calendar.DATE, -3);
			break;
		case SearchOptions.Last7days:
			begin.add(Calendar.DATE, -7);
			break;
		case SearchOptions.Last14days:
			begin.add(Calendar.DATE, -14);
			break;
		case SearchOptions.Last30days:
			begin.add(Calendar.DATE, -30);
			break;
		case SearchOptions.Last90days:
			begin.add(Calendar.DATE, -90);
			break;
		case SearchOptions.LastMonth:
			begin.add(Calendar.MONTH, -1);
			begin.add(Calendar.DAY_OF_MONTH, 1);
			break;
		}
		Calendar now = Calendar.getInstance();;
		Date beginDate = begin.getTime();
		Date endDate = now.getTime();
		
		List<Order> orders = orderService.getOrdersByDateRange(beginDate, endDate);
		return new ModelAndView("/seller/search/order-search").addObject("orders", orders);
	}
	
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
}
