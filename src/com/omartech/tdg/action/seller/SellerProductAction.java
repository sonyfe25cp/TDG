package com.omartech.tdg.action.seller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.ShopSettingMapper;
import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.Item;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.ProductLine;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.model.ShopSetting;
import com.omartech.tdg.service.BrandService;
import com.omartech.tdg.service.ItemService;
import com.omartech.tdg.service.ProductLineService;
import com.omartech.tdg.service.ProductParameterService;
import com.omartech.tdg.service.ProductService;
import com.omartech.tdg.utils.JsonMessage;
import com.omartech.tdg.utils.ProductStatus;
import com.omartech.tdg.utils.TimeFormat;

@Controller
@RequestMapping(value="/seller/product/")
public class SellerProductAction {

	@Autowired
	private ProductLineService productLineService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private ShopSettingMapper shopSettingMapper;
	@Autowired
	private ProductParameterService productParameterService;
	
	@Autowired
	private ItemService itemService;
	
	private Logger logger = Logger.getLogger(SellerProductAction.class);
	
	@RequestMapping("/edit")
	public ModelAndView editProduct(@RequestParam int id){
		Product product = productService.getProductById(id);
		return new ModelAndView("/seller/product/product-edit").addObject("product", product);
	}
	@ResponseBody
	@RequestMapping("delete")
	public JsonMessage deleteProduct(@RequestParam int id){
		productService.deleteProduct(id);
		return new JsonMessage();
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String updateProduct(
			@RequestParam int id,
			@RequestParam String name,
			@RequestParam(value="sku", required=false, defaultValue = "0") String sku,
			@RequestParam int categoryId,
			@RequestParam(value="nodeId", required=false, defaultValue = "0") int nodeId,
			@RequestParam int productLine,
			@RequestParam int iss,
			@RequestParam(value="ifee", required=false, defaultValue = "0") int ifee,
			@RequestParam(value="idays", required=false, defaultValue = "0") int idays,
			@RequestParam int hasChildren,//0:no,1:yes
			@RequestParam String mainImg,
			@RequestParam String subImgs,
			@RequestParam float retailPrice,
			@RequestParam float promotionPrice,
			@RequestParam String promotionTime,
			@RequestParam float wholePrice,
			@RequestParam int minimumQuantity,
			@RequestParam int maximumAcceptQuantity,
			@RequestParam int availableQuantity,
			@RequestParam int safeStock,
			@RequestParam(value = "netWeight", required = false) float netWeight,
			@RequestParam(value = "grossWeight", required = false) float grossWeight,
			@RequestParam(value = "sizeWithPackage", required = false) String sizeWithPackage,
			@RequestParam(value="brandId", required = false, defaultValue = "0") int brandId,
			@RequestParam String description,
			HttpServletRequest request,
			HttpSession session
			){

		Seller seller = (Seller) session.getAttribute("seller");
		int sellerId = seller.getId();
		ShopSetting shopSetting = shopSettingMapper.getShopSettingBySellerId(sellerId);
		if(shopSetting == null){
			return "redirect:/seller/shopsetting/show";
		}
		int defaultCoinage = shopSetting.getDefaultCoinage();//设定货币
		
		Product product = productService.getProductById(id);
		product.setSku(sku);//用id暂存sku
		product.setName(name);
		product.setMainImage(mainImg);
		product.setSubImages(subImgs);
		product.setInternationalShippingService(iss);
		product.setInternationalPromiseDays(idays);
		product.setInternationalShippingFee(ifee);
		product.setProductLine(productLine);
		if(nodeId != 0){
			product.setProductTypeId(nodeId);
		}else{
			product.setProductTypeId(categoryId);
		}
		product.setHasChildren(hasChildren);

		product.setRetailPrice(retailPrice);
		product.setPromotionPrice(promotionPrice);
		product.setPromotionTime(TimeFormat.StringToDate(promotionTime));
		product.setWholePrice(wholePrice);
		product.setMinimumQuantity(minimumQuantity);
		product.setMaximumAcceptQuantity(maximumAcceptQuantity);
		product.setAvailableQuantity(availableQuantity);
		product.setSafeStock(safeStock);
		
		product.setNetWeight(netWeight);
		product.setGrossWeight(grossWeight);
		product.setSizeWithPackage(sizeWithPackage);
		
		product.setBrandId(brandId);
		product.setDescription(description);
		product.setSellerId(sellerId);
		product.setCoinage(defaultCoinage);
		productService.updateProduct(product);
		return "redirect:/seller/product/list";
	}
	
	
	//通向产品分类选择页面，选择category
	@RequestMapping(value="category-select")
	public ModelAndView categorySelect(){
		List<ProductLine> productLines = productLineService.getProductLinesByParentId(0);
		return new ModelAndView("/seller/product/category-select").addObject("productLines", productLines);
	}
	//提交category，开始进入产品详细页面
	@RequestMapping(value="productadd")
	public ModelAndView selectCategory(
			@RequestParam(value="productLine") int productLine,
			@RequestParam(value="categoryId") int categoryId,
			@RequestParam(value="nodeId", required=false) Integer nodeId,
			HttpSession session
			){
		Seller seller = (Seller) session.getAttribute("seller");
		int sellerId = seller.getId();
		//获取对应的销售属性
		List<Brand> brands = brandService.getBrandListBySellerId(sellerId);
		return new ModelAndView("/seller/product/product-add")
			.addObject("productLine", productLine)
			.addObject("categoryId", categoryId)
			.addObject("nodeId", nodeId)
			.addObject("brands", brands);
	}
	@ResponseBody
	@RequestMapping(value="addproduct", method=RequestMethod.POST)
	public JsonMessage addProduct(
			@RequestParam String name,
			@RequestParam(value="sku", required=false) String sku,
			@RequestParam int categoryId,
			@RequestParam(value="nodeId", required=false) Integer nodeId,
			@RequestParam int productLine,
			@RequestParam int iss,
			@RequestParam(value="ifee", required=false) Integer ifee,
			@RequestParam(value="idays", required=false) Integer idays,
			@RequestParam int hasChildren,//0:no,1:yes
			@RequestParam String mainImg,
			@RequestParam String subImgs,
			@RequestParam float retailPrice,
			@RequestParam(value="promotionPrice", required=false) Float promotionPrice,
			@RequestParam(value="promotionTime", required=false) String promotionTime,
			@RequestParam(value="promotionEnd", required=false) String promotionEnd,
			@RequestParam(value="wholePrice", required=false) Float wholePrice,
			@RequestParam(value="minimumQuantity", required=false, defaultValue="0") Integer minimumQuantity,
			@RequestParam(value="maximumAcceptQuantity", required=false) Integer maximumAcceptQuantity,
			@RequestParam int availableQuantity,
			@RequestParam int safeStock,
			@RequestParam(value = "netWeight", required = false) Float netWeight,
			@RequestParam(value = "grossWeight", required = false) Float grossWeight,
			@RequestParam(value = "sizeWithPackage", required = false) String sizeWithPackage,
			@RequestParam(value="brandId", required = false, defaultValue="0") Integer brandId,
			@RequestParam String description,
			HttpServletRequest request,
			HttpSession session,
			Locale locale
			){
		JsonMessage message = new JsonMessage();
		Seller seller = (Seller) session.getAttribute("seller");
		int pId = 0;
		int internationalShippingService = iss;
		int internationalShippingFee = 0;
		int internationalPromiseDays = 0;
		if(internationalShippingService == 1){
			internationalShippingFee = ifee;
			internationalPromiseDays = idays;
		}
		int status = ProductStatus.InProductCreation;
		int sellerId = seller.getId();
		ShopSetting shopSetting = shopSettingMapper.getShopSettingBySellerId(sellerId);
		if(shopSetting == null){
			message.setFlag(false);
			if(locale.equals("zh_CN")){
				message.setObject("请先设置店铺中的默认货币");
			}else{
				message.setObject("Please init the coinage of shopsetting.");
			}
			return message;
		}
		int defaultCoinage = shopSetting.getDefaultCoinage();//设定货币
		int productTypeId = categoryId;
		
		if(nodeId != null){
			productTypeId = nodeId;
		}
		
		Date proBegin = TimeFormat.StringToDate(promotionTime);
		Date proEnd = TimeFormat.StringToDate(promotionEnd);
		
		int countryCode = shopSetting.getShippingCountry();
		
		if(promotionPrice == null){
			promotionPrice = 0f;
		}
		if(wholePrice == null){
			wholePrice = 0f;
			minimumQuantity = 0;
			maximumAcceptQuantity = 0;
		}
		if(maximumAcceptQuantity == null){
			wholePrice = 0f;
			minimumQuantity = 0;
			maximumAcceptQuantity = 0;
		}
		
		Product product = new Product(pId, sku, name,  description,
				 hasChildren,  status,  internationalShippingService,
				 internationalShippingFee,  internationalPromiseDays,
				 retailPrice,  promotionPrice, proBegin,
				 proEnd,  wholePrice,  minimumQuantity,
				 maximumAcceptQuantity,  defaultCoinage,  availableQuantity,
				 safeStock,  netWeight,  grossWeight,
				 sizeWithPackage,  mainImg,  subImgs,
				 brandId,  sellerId,  productTypeId,  productLine, countryCode);
		
		int productId = productService.insertProduct(product);
		
		message.setFlag(true);
		message.setObject(productId);
		return message;
	}
	
	
	
	
	
	@RequestMapping(value="list")
	public ModelAndView list(@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, 
			@RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize,
			HttpSession session){
		Page page = new Page(pageNo,pageSize);
		Seller seller = (Seller) session.getAttribute("seller");
		
		List<Product> products = productService.getProductListByPageAndSeller(page, seller.getId());
		
		return new ModelAndView("/seller/product/product-list").addObject("products", products).addObject("pageNo", pageNo);
	}
	
	@RequestMapping(value="itemadd")
	public ModelAndView itemAdd(
			@RequestParam int productId
			){
		Product product = productService.getProductById(productId);
		
		return new ModelAndView("/seller/product/item-add")
				.addObject("product", product);
	}
	@RequestMapping(value="addItem")
	public String addItem(
			@RequestParam int productId,
			@RequestParam(value="sku", required=false) String sku,
			@RequestParam String mainImg,
			@RequestParam String params,
			@RequestParam float retailPrice,
			@RequestParam(value="promotionPrice", required=false) Float promotionPrice,
			@RequestParam(value="promotionTime", required=false) String promotionTime,
			@RequestParam(value="promotionEnd", required=false) String promotionEnd,
			@RequestParam float wholePrice,
			@RequestParam int minimumQuantity,
			@RequestParam int maximumAcceptQuantity,
			@RequestParam int availableQuantity,
			@RequestParam int safeStock,
			HttpSession session
			){
		Seller seller = (Seller) session.getAttribute("seller");
		int sellerId = seller.getId();
		if(params.length()>1){
			Item item = new Item();
			Product product = productService.getProductById(productId);
			System.out.println(params);
			item.setSku(sku);
			item.setImage(mainImg);
			item.setName(product.getName());
			item.setNameInChinese(product.getNameInChinese());
			item.setAvailableQuantity(availableQuantity);
			item.setMaximumAcceptQuantity(maximumAcceptQuantity);
			item.setMinimumQuantity(minimumQuantity);
			item.setPromotionPrice(promotionPrice);
			item.setPromotionTime(TimeFormat.StringToDate(promotionTime));
			item.setPromotionEnd(TimeFormat.StringToDate(promotionEnd));
			item.setRetailPrice(retailPrice);
			item.setSafeStock(safeStock);
			item.setWholePrice(wholePrice);
			item.setFeatureJson(params);
			item.setCoinage(product.getCoinage());
			item.setProductId(productId);
			item.setCategoryId(product.getProductTypeId());
			item.setSellerId(sellerId);
			itemService.insertItem(item);
		}
		return "redirect:/seller/product/list";
	}
	@RequestMapping("/changestatus")
	public String changeProductStatus(@RequestParam int productId, @RequestParam int status){
		productService.updateProductStatus(productId, status);
		return "redirect:/seller/product/list";
	}
	
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public ShopSettingMapper getShopSettingMapper() {
		return shopSettingMapper;
	}
	public void setShopSettingMapper(ShopSettingMapper shopSettingMapper) {
		this.shopSettingMapper = shopSettingMapper;
	}
	public ProductLineService getProductLineService() {
		return productLineService;
	}
	public void setProductLineService(ProductLineService productLineService) {
		this.productLineService = productLineService;
	}
	public ItemService getItemService() {
		return itemService;
	}
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	public ProductParameterService getProductParameterService() {
		return productParameterService;
	}
	public void setProductParameterService(
			ProductParameterService productParameterService) {
		this.productParameterService = productParameterService;
	}
	public BrandService getBrandService() {
		return brandService;
	}
	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}
}
