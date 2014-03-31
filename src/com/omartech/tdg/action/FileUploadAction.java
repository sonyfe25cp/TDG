package com.omartech.tdg.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		File foler = new File(realPath);
		if(!foler.exists()){
			foler.mkdirs();
		}
		String imagePath = "";
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Entry<String, MultipartFile> fileEntry : fileMap.entrySet()) {
			MultipartFile fileTemp = fileEntry.getValue();
			String suffix = fileTemp.getOriginalFilename().substring  
		                    (fileTemp.getOriginalFilename().lastIndexOf("."));
		    /**拼成完整的文件保存路径加文件**/    
		    String fileName = realPath + File.separator   + System.currentTimeMillis() + suffix;        
		    File file = new File(fileName);
		    try {
		    	FileCopyUtils.copy(fileTemp.getBytes(),file);
		    } catch (IllegalStateException e) {     
		        e.printStackTrace();     
		    } catch (IOException e) {            
		        e.printStackTrace();     
		    }
		    fileName = fileName.substring(fileName.indexOf("/uploads"));
			imagePath += fileName;
		}
		return new UploadResult(0, imagePath);
	}
	
	@RequestMapping(value= "/upload/image", method = RequestMethod.POST)
	@ResponseBody
	public UploadResult uploadImageNO(
			HttpServletResponse response,
			HttpServletRequest request
			){

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String realPath = request.getSession().getServletContext().getRealPath("/uploads/images/");
		File foler = new File(realPath);
		if(!foler.exists()){
			foler.mkdirs();
		}
		String imagePath = "";
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		System.out.println("size: " + fileMap.size());
		for (Entry<String, MultipartFile> fileEntry : fileMap.entrySet()) {
			MultipartFile fileTemp = fileEntry.getValue();
			if(!fileTemp.getOriginalFilename().contains(".")){
				continue;
			}
			String suffix = fileTemp.getOriginalFilename().substring(fileTemp.getOriginalFilename().lastIndexOf("."));
		    /**拼成完整的文件保存路径加文件**/    
		    String fileName = realPath + File.separator   + System.currentTimeMillis() + suffix;        
		    File file = new File(fileName);
		    try {
		    	FileCopyUtils.copy(fileTemp.getBytes(),file);
		    } catch (IllegalStateException e) {     
		        e.printStackTrace();     
		    } catch (IOException e) {            
		        e.printStackTrace();     
		    }
		    fileName = fileName.substring(fileName.indexOf("/uploads"));
			imagePath += fileName;
		}
		return new UploadResult(0, imagePath);
	}
	
	@RequestMapping("/testaddpic")
	public String testadd(){
		return "/tmp/aupload";
	}
	@RequestMapping("/testaaaaddpic")
	public String testaaaadd(){
		return "/tmp/testaaa";
	}
	@RequestMapping(value="/addpic", method=RequestMethod.POST)
	public void uploadPicture(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="bigPic") MultipartFile bigPic) {
		String bigPicPath = null;
		JSONObject json = new JSONObject();
		
		if(!bigPic.isEmpty()) {
			String fileName = bigPic.getOriginalFilename();
			String expand = fileName.substring(fileName.lastIndexOf("."));
			fileName = new Date().getTime() + expand;
			bigPicPath = "/uploads/images/" + fileName;
			String path = request.getSession().getServletContext().getRealPath("/uploads/images/");
			try {
				FileUtils.copyInputStreamToFile(bigPic.getInputStream(), new File(path, fileName));
			} catch (IOException e) {
				e.printStackTrace();
				json.put("success", "false");
				response.setContentType("text/html;charset=UTF-8");  
                try {
					response.getWriter().println(json.toString());
				} catch (IOException e1) {
					e1.printStackTrace();
				}
                return;
			}
		} else {
			json.put("success", "false");
			response.setContentType("text/html;charset=UTF-8");  
            try {
				response.getWriter().println(json.toString());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
            return;
		}
		json.put("success", "true");
		json.put("picpath", bigPicPath);
		response.setContentType("text/html;charset=UTF-8");
        try {
			response.getWriter().println(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
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
