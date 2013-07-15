package com.omartech.tdg.action.seller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.omartech.tdg.mapper.BrandMapper;
import com.omartech.tdg.mapper.ShopSettingMapper;
import com.omartech.tdg.model.Brand;
import com.omartech.tdg.model.ItemProperty;
import com.omartech.tdg.model.Page;
import com.omartech.tdg.model.Product;
import com.omartech.tdg.model.ProductCategory;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.service.CategoryService;
import com.omartech.tdg.service.ItemPropertyService;
import com.omartech.tdg.service.ProductService;

@Controller
@RequestMapping(value="/seller/product/")
public class SellerProductAction {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BrandMapper brandMapper;
	@Autowired
	private ShopSettingMapper shopSettingMapper;
	@Autowired
	private ItemPropertyService itemPropertyService;
	
	private Logger logger = Logger.getLogger(SellerProductAction.class);
	
	//通向产品分类选择页面，选择category
	@RequestMapping(value="category-select")
	public ModelAndView categorySelect(){
		List<ProductCategory> categories = categoryService.getProductCategories();
		logger.info("categories list size is :"+categories.size());
		return new ModelAndView("/seller/product/category-select").addObject("categories", categories);
	}
	//提交category，开始进入产品详细页面
	@RequestMapping(value="productadd")
	public ModelAndView selectCategory(
			@RequestParam(value="cid") int categoryId){
		//获取对应的销售属性
		List<Brand> brands = brandMapper.getBrandList();
		ItemProperty itemProperty = itemPropertyService.getItemPropertyByCategoryId(categoryId);
		return new ModelAndView("/seller/product/product-add").addObject("categoryId", categoryId).addObject("brands", brands);
	}
	@RequestMapping(value="addproduct", method=RequestMethod.POST)
	public String addProduct(
			@RequestParam String name,
			@RequestParam int categoryId,
			@RequestParam float retailPrice,
			@RequestParam float promotionPrice,
			@RequestParam String promotionTime,
			@RequestParam float wholePrice,
			@RequestParam int minimumQuantity,
			@RequestParam int maximumAcceptQuantity,
			@RequestParam int availableQuantity,
			@RequestParam int safeStock,
			@RequestParam float netWeight,
			@RequestParam float grossWeight,
			@RequestParam String sizeWithPackage,
			@RequestParam int brandId,
			@RequestParam String description,
			@RequestParam MultipartFile mainimage,
			@RequestParam MultipartFile[] subimages,
			HttpServletRequest request,
			HttpSession session
			){
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Seller seller = (Seller) session.getAttribute("seller");
		int sellerId = seller.getId();
		String mainImagePath="";
		String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/uploads/images/");
		if(!mainimage.isEmpty()){
			String mainImageName = System.currentTimeMillis()+mainimage.getOriginalFilename().substring(mainimage.getOriginalFilename().lastIndexOf("."));
			try {
				FileUtils.copyInputStreamToFile(mainimage.getInputStream(), new File(realPath, mainImageName));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			mainImagePath = realPath +"/"+ mainImageName;
			mainImagePath = mainImagePath.substring(mainImagePath.indexOf("/uploads"));
		}
		String subImagesPath = "";
		for(MultipartFile subImage : subimages){
            if(subImage.isEmpty()){  
//                System.out.println("文件未上传");
            }else{  
//                System.out.println("文件长度: " + subImage.getSize());  
//                System.out.println("文件类型: " + subImage.getContentType());  
//                System.out.println("文件名称: " + subImage.getName());  
//                System.out.println("文件原名: " + subImage.getOriginalFilename());
//                System.out.println("文件扩展名: " + subImage.getOriginalFilename().substring(subImage.getOriginalFilename().lastIndexOf(".")));
//                System.out.println("========================================");  
//                System.out.println(realPath);
                try {
                	String imageName = System.currentTimeMillis()+subImage.getOriginalFilename().substring(subImage.getOriginalFilename().lastIndexOf("."));
					FileUtils.copyInputStreamToFile(subImage.getInputStream(), new File(realPath, imageName));
					String subImagePath = realPath +"/"+ imageName;
					String subPath = subImagePath.substring(subImagePath.indexOf("/uploads")) + ";";
					subImagesPath += subPath;
				} catch (IOException e) {
					e.printStackTrace();
				}
            }
        }
		
		int defaultCoinage = shopSettingMapper.getShopSettingBySellerId(sellerId).getDefaultCoinage();
		ProductCategory category  = categoryService.findRootCategory(categoryId);
		int categoryRootId = category.getRoot();
		Product product = new Product();
		product.setName(name);
		product.setMainImage(mainImagePath);
		product.setSubImages(subImagesPath);
		product.setRetailPrice(retailPrice);
		product.setPromotionPrice(promotionPrice);
		product.setPromotionTime(null);
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
		product.setProductTypeId(categoryId);
		product.setSellerId(sellerId);
		product.setCoinage(defaultCoinage);
		product.setCategoryId(categoryRootId);
		productService.insertProduct(product);
		return "redirect:/seller/product/list";
	}
	
	
	@RequestMapping(value="list")
	public ModelAndView list(@RequestParam(value="pageNo", defaultValue= "0", required = false) int pageNo, @RequestParam(value="pageSize", defaultValue = "10", required = false) int pageSize){
		Page page = new Page(pageNo,pageSize);
		
		List<Product> products = productService.getProductListByPage(page);
		
		return new ModelAndView("/seller/product/product-list").addObject("products", products).addObject("pageNo", pageNo);
	}
	
	@RequestMapping(value="subcategory")
	@ResponseBody
	public List<ProductCategory> getSubCategoriesByCid(@RequestParam(value="cid") int cid){
		List<ProductCategory> subCategories = categoryService.getSubProductCategories(cid);
		return subCategories;
	}
	
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public BrandMapper getBrandMapper() {
		return brandMapper;
	}
	public void setBrandMapper(BrandMapper brandMapper) {
		this.brandMapper = brandMapper;
	}
	public ShopSettingMapper getShopSettingMapper() {
		return shopSettingMapper;
	}
	public void setShopSettingMapper(ShopSettingMapper shopSettingMapper) {
		this.shopSettingMapper = shopSettingMapper;
	}
	public ItemPropertyService getItemPropertyService() {
		return itemPropertyService;
	}
	public void setItemPropertyService(ItemPropertyService itemPropertyService) {
		this.itemPropertyService = itemPropertyService;
	}
}
