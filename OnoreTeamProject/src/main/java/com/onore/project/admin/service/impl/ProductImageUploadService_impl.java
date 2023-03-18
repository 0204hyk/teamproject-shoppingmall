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
		if (file == null) {
			return null;
		}
		
		JsonObject jsonObject = new JsonObject();
		String product_name = request.getParameter("product_name"); 
		
		String contextRoot = request.getSession().getServletContext().getRealPath("/");
		String fileRoot = contextRoot+"resources/admin/image/product/thumbnail/" + product_name + "/";
		
		// ����� ���� ���ο� ��ǰ������ ���� ���� �����
		File folder = new File(fileRoot);
		if (!folder.exists()) {
			folder.mkdir();
		}
		
		String originalFileName = file.getOriginalFilename();	//�������� ���ϸ�
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����
		String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//���� ����
			jsonObject.addProperty("url", "/project/resources/admin/image/product/thumbnail/" + product_name + "/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");
			fileStream.close();
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//����� ���� ����
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject.get("url").getAsString();
	}

}