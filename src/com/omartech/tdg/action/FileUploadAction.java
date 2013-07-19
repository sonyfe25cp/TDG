package com.omartech.tdg.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
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
			@RequestParam MultipartFile image,
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session){

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/uploads/images/");
		String imagePath = "";
		if(!image.isEmpty()){
			String mainImageName = System.currentTimeMillis()+image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
			try {
				FileUtils.copyInputStreamToFile(image.getInputStream(), new File(realPath, mainImageName));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			imagePath = realPath +"/"+ mainImageName;
			imagePath = imagePath.substring(imagePath.indexOf("/uploads"));
			return new UploadResult(0, imagePath);
		}else{
			return new UploadResult(1, "can't get the image.");
		}
	}
	
	
//	@RequestMapping(value= "/fileupload", method = RequestMethod.POST)
//	public void upload(@RequestParam String saveType, HttpServletResponse response, HttpServletRequest request, HttpSession session){
//
//		String path = generateSavePath(session, saveType);
//		
//		//文件保存目录URL
//		String saveUrl  = request.getContextPath() + "/"+ path;
//		File savePath = new File(saveUrl);
//		if(!savePath.exists()){
//			savePath.mkdirs();
//		}
//		//定义允许上传的文件扩展名
//		HashMap<String, String> extMap = new HashMap<String, String>();
//		extMap.put("image", "gif,jpg,jpeg,png,bmp");
//
//		//最大文件大小
//		long maxSize = 1000000;
//
//		response.setContentType("text/html; charset=UTF-8");
//
//		PrintWriter out = response.getWriter();
//		FileItemFactory factory = new DiskFileItemFactory();
//		ServletFileUpload upload = new ServletFileUpload(factory);
//		upload.setHeaderEncoding("UTF-8");
//		List items = upload.parseRequest(request);
//		Iterator itr = items.iterator();
//		while (itr.hasNext()) {
//			FileItem item = (FileItem) itr.next();
//			String fileName = item.getName();
//			long fileSize = item.getSize();
//			if (!item.isFormField()) {
//				//检查文件大小
//				if(item.getSize() > maxSize){
//					out.println(getError("上传文件大小超过限制。"));
//					return;
//				}
//				//检查扩展名
//				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
//				if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
//					out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
//					return;
//				}
//
//				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
//				String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
//				try{
//					File uploadedFile = new File(savePath, newFileName);
//					item.write(uploadedFile);
//				}catch(Exception e){
//					out.println(getError("上传文件失败。"));
//					return;
//				}
//
//				JSONObject obj = new JSONObject();
//				obj.put("error", 0);
//				obj.put("url", saveUrl + newFileName);
//				out.println(obj.toJSONString());
//			}
//		}
//	}
	
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
