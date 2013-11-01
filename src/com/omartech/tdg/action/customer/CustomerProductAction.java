package com.omartech.tdg.action.customer;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.CustomerMapper;
import com.omartech.tdg.mapper.SellerMapper;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.ProductLine;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.service.ProductLineService;
import com.omartech.tdg.service.ProductService;

@Controller
@RequestMapping("/product")
public class CustomerProductAction {

	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerMapper customerMapper;
	@Autowired
	private SellerMapper sellerMapper;
	@Autowired
	private ItemService itemService;
	@Autowired
	private ProductLineService productLineService;
	
	
	@RequestMapping("/list-for-index")
	public ModelAndView productList(@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
									@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize, Locale locale){
		List<Product> products = productService.getSellableProductListByPage(new Page(pageNo,pageSize));
		return new ModelAndView("/customer/product/list-for-index").addObject("products", products).addObject("pageNo",pageNo).addObject("locale", locale);
	}

	
	@RequestMapping("/category/{categoryId}")
	public ModelAndView showProductsInCategory(
			@PathVariable int categoryId,
			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize, Locale locale){
		List<Product> products = productService.getProductsInCategoryByPage(categoryId,new Page(pageNo, pageSize));
		ProductLine productLine = productLineService.getProductLineById(categoryId);
		return new ModelAndView("/customer/product/list-for-category").addObject("products", products)
				.addObject("productLine", productLine)
				.addObject("locale", locale)
				.addObject("pageNo",pageNo)
				.addObject("category", categoryId);
	}
//	@RequestMapping("/search")
//	public ModelAndView searchProductByName(@RequestParam String name,
//			@RequestParam(value="pageNo", required=false, defaultValue="0") int pageNo,
//			@RequestParam(value="pageSize", required=false, defaultValue="10") int pageSize, Locale locale){
//		List<Product> products = productService.searchProductByName(name, new Page(pageNo, pageSize));
//		return new ModelAndView("/customer/product/list-for-search").addObject("products", products).addObject("searchWord", name).addObject("locale", locale).addObject("pageNo",pageNo);
//	}
	
	
	@RequestMapping("/customerProductAdd")
	public ModelAndView productAdd(){
		return new ModelAndView("/customer/product/add");
	}
	
	/**
	 * 根据产品id，向淘宝卖家店铺中上架产品，其中必选参数为：num:数量，price：单价，type：商品类型（fixed表示一口价），stuffStatus：产品新旧程度（new表示全新），
	 * title：产品标题，desc：产品描述，locationState：卖家所在省份，locationCity：卖家所在城市，cid：产品的叶子类目，outerId：产品自编码，props：产品销售属性
	 * @param productId
	 * @param session
	 * @return
	 */
//	@RequestMapping("/add")
//	public ModelAndView productAdd(@RequestParam(value="productId", required=true) int productId,
//			HttpSession session){
//		Product product = productService.getProductById(productId);
//		Customer customer = (Customer) session.getAttribute("customer");
//		//Customer customer = customerMapper.getCustomerById(Integer.parseInt(customerId));
//		TaobaoClient client=new DefaultTaobaoClient(TaobaoSettings.requestUrl, TaobaoSettings.appKey, TaobaoSettings.appSecret);
//		ItemAddRequest req=new ItemAddRequest();
//		req.setNum(new Long(product.getAvailableQuantity()));
//		req.setPrice(String.valueOf(product.getRetailPrice()));
//		//fixed表示一口价商品
//		req.setType("fixed");
//		//new表示商品为全新
//		req.setStuffStatus("new");
//		req.setTitle(product.getName());
//		req.setDesc(product.getDescription());
//		Seller seller = sellerMapper.getSellerById(product.getSellerId());
//		req.setLocationState(seller.getState());
//		req.setLocationCity(seller.getCity());
//		//req.setCid(new Long(product.getProductTypeId()));
//		//req.setCid(1201L);
//		req.setCid(1402L);
//		List<Item> items = itemService.getItemsByProductId(product.getId());
//		if(items!=null){
//			Item item = items.get(0);
//			req.setOuterId(String.valueOf(item.getSku()));
//		}
//		String propString = product.getBasicParams();
//		String props = "";
//		System.out.println(propString);
//		if(propString!=null&&(!propString.trim().equals(""))){
//			String[] propsList = propString.split(";");
//			for(String prop: propsList){
//				String[] temProp = prop.split(":");
//				props+= temProp[0] + ":" + temProp[1] + ";";
//			}
//		}
//		//props = "20000:30111;30518:29780;31055:97130;30514:103646;20140:85711;30197:21456;30267:65236;1627207:28335;1627207:28324;1928203:179594601;";
//		System.out.println(props);
//		req.setProps(props);
////        String pic_path = product.getMainImage();
////		if(pic_path!=null&&!(pic_path.trim().equals(""))){
////			FileItem fileitem=new FileItem(new File(pic_path));
////			req.setImage(fileitem);
////		}
//		ItemAddResponse response=null;
//		try {
//			response = client.execute(req , customer.getAccessToken());
//		} catch (ApiException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			System.out.println(e.getMessage());
//		}
//		return new ModelAndView("/customer/product/add");
//	}
	
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


	public SellerMapper getSellerMapper() {
		return sellerMapper;
	}


	public void setSellerMapper(SellerMapper sellerMapper) {
		this.sellerMapper = sellerMapper;
	}
	public ItemService getItemService() {
		return itemService;
	}
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}


	public ProductLineService getProductLineService() {
		return productLineService;
	}
	public void setProductLineService(ProductLineService productLineService) {
		this.productLineService = productLineService;
	}
	
}
