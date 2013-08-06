package com.omartech.tdg.action.customer;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.CustomerMapper;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.utils.TaobaoSettings;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.FileItem;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.Item;
import com.taobao.api.request.ItemAddRequest;
import com.taobao.api.response.ItemAddResponse;

@Controller
@RequestMapping("/product")
public class CustomerProductAction {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CustomerMapper customerMapper;
	
	@RequestMapping("/list-for-index")
	public ModelAndView productList(@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
									@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize){
		List<Product> products = productService.getProductListByPage(new Page(pageNo,pageSize));
		return new ModelAndView("/customer/product/list-for-index").addObject("products", products).addObject("pageNo",pageNo);
	}

	
	@RequestMapping("/category/{categoryId}")
	public ModelAndView showProductsInCategory(
			@PathVariable int categoryId,
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize){
		List<Product> products = productService.getProductsInCategoryByPage(categoryId,new Page(pageNo, pageSize));
		return new ModelAndView("/customer/product/list-for-search").addObject("products", products);
	}
	
	@RequestMapping("/customerProductAdd")
	public ModelAndView productAdd(){
		return new ModelAndView("/customer/product/add");
	}
	
	@RequestMapping("/add")
	public ModelAndView productAdd(@RequestParam(value="customerId", required=true) String customerId,
			@RequestParam(value="num", required=true) String num,
			@RequestParam(value="price", required=true) String price,
			@RequestParam(value="type", required=true) String type,
			@RequestParam(value="stuff_status", required=true) String stuff_status,
			@RequestParam(value="title", required=true) String title,
			@RequestParam(value="desc", required=true) String desc,
			@RequestParam(value="location_state", required=true) String location_state,
			@RequestParam(value="location_city", required=true) String location_city,
			@RequestParam(value="cid", required=true) String cid,
			@RequestParam(value="out_id", required=false) String out_id,
			@RequestParam(value="props", required=true) String props,
			@RequestParam(value="pic_path", required=false) String pic_path){
		
		Customer customer = customerMapper.getCustomerById(Integer.parseInt(customerId));
		TaobaoClient client=new DefaultTaobaoClient(TaobaoSettings.requestUrl, TaobaoSettings.appKey, TaobaoSettings.appSecret);
		ItemAddRequest req=new ItemAddRequest();
		req.setNum(Long.parseLong(num));
		req.setPrice(price);
		req.setType(type);
		req.setStuffStatus(stuff_status);
		req.setTitle(title);
		req.setDesc(desc);
		req.setLocationState(location_state);
		req.setLocationCity(location_city);
		//req.setApproveStatus(param.get("approve_status"));
		req.setCid(Long.parseLong(cid));
		req.setOuterId(out_id);
		req.setProps(props);
//		req.setProps(param.get("props"));
//		req.setFreightPayer(param.get("freight_payer"));
//		req.setSkuProperties(param.get("sku_properties"));
//		req.setSkuQuantities(param.get("sku_quantities"));
//		req.setSkuPrices(param.get("sku_price"));
		//req.setPicPath(param.get("pic_path"));
		if(pic_path!=null&&!(pic_path.trim().equals(""))){
			FileItem fileitem=new FileItem(new File(pic_path));
			req.setImage(fileitem);
		}
		ItemAddResponse response=null;
		Item item=null;
		try {
			response = client.execute(req , customer.getAccessToken());
			item=response.getItem();
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return new ModelAndView("/customer/product/add");
	}
	
	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}


	public CustomerMapper getCustomerMapper() {
		return customerMapper;
	}


	public void setCustomerMapper(CustomerMapper customerMapper) {
		this.customerMapper = customerMapper;
	}
	
	
	
}
