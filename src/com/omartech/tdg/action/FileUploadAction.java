package com.omartech.tdg.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.omartech.tdg.model.Admin;
import com.omartech.tdg.model.Customer;
import com.omartech.tdg.model.Seller;
import com.omartech.tdg.model.Translator;
import com.omartech.tdg.utils.UploadResult;

@Controller
public class FileUploadAction {

	@RequestMapping(value= "/{userType}/upload/image", method = RequestMethod.POST)
	@ResponseBody
	public UploadResult uploadImage(
			@PathVariable String userType,
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session){

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String realPath = request.getSession().getServletContext().getRealPath("/uploads/images/");
		String imagePath = "";
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Entry<String, MultipartFile> fileEntry : fileMap.entrySet()) {
			String key = fileEntry.getKey();
			System.out.println("key: "+ key);
			MultipartFile fileTemp = fileEntry.getValue();
			String suffix = fileTemp.getOriginalFilename().substring  
		                    (fileTemp.getOriginalFilename().lastIndexOf("."));
			System.out.println("suffix: "+ suffix);
		    String logImageName = fileTemp.getOriginalFilename();  
		    System.out.println("logImageName: "+ logImageName);
		    /**拼成完整的文件保存路径加文件**/    
		    String fileName = realPath + File.separator   + System.currentTimeMillis() + suffix;        
		    System.out.println("fileName: "+ fileName);
		    File file = new File(fileName);
		    try {
//		    	file.mkdirs();
		    	FileCopyUtils.copy(fileTemp.getBytes(),file);
//		    	fileTemp.transferTo(file);
		    } catch (IllegalStateException e) {     
		        e.printStackTrace();     
		    } catch (IOException e) {            
		        e.printStackTrace();     
		    }
		    fileName = fileName.substring(fileName.indexOf("/uploads"));
			imagePath += fileName;
		}
		return new UploadResult(0, imagePath);
//		return new UploadResult(1, "can't get the image.");
	}
	
	
	private String generateSavePath(HttpSession session, String saveType){
		int id = 0;
		Seller saler = (Seller)session.getAttribute("seller");
		if(saler != null){//saler is online
			id = saler.getId();
		}else{
			Customer customer = (Customer)session.getAttribute("customer");
			if(customer != null){
				id = customer.getId();
			}else{
				Admin admin = (Admin)session.getAttribute("admin");
				if(admin != null){
					id = admin.getId();
				}else{
					Translator translator = (Translator)session.getAttribute("translator");
					if(translator !=null){
						id = translator.getId();
					}
				}
			}
		}
		return "/"+id+"/"+saveType+"/";
	}
	
}
