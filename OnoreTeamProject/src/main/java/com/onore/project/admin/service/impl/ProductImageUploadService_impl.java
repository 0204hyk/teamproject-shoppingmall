package com.onore.project.admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.onore.project.admin.service.ProductImageUploadService;

@Service
public class ProductImageUploadService_impl implements ProductImageUploadService {

	@Override
	public String uploadFile(HttpServletRequest request, MultipartFile file) {
		JsonObject jsonObject = new JsonObject();
		String product_name = request.getParameter("product_name"); 
		
		String contextRoot = request.getSession().getServletContext().getRealPath("/");
		String fileRoot = contextRoot+"resources/admin/image/product/thumbnail/" + product_name + "/";
		
		// 썸네일 폴더 내부에 상품명으로 하위 폴더 만들기
		File folder = new File(fileRoot);
		if (!folder.exists()) {
			folder.mkdir();
		}
		
		String originalFileName = file.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/project/resources/admin/image/product/thumbnail/" + product_name + "/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");
			fileStream.close();
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject.get("url").getAsString();
	}

}
