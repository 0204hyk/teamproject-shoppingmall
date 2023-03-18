package com.onore.project.admin.restcontroller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class ImageUploadRestController {
	
	@PostMapping(value="/admin/notice_image.upload", produces = "application/json; charset=utf8")
	public String uploadNoticeSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) throws IOException {
		
		JsonObject jsonObject = new JsonObject();
		
		// ����ο� �̹��� ���� �� ������� ������ ���� ���� ��. ���� ���� �������� �����η� C����̺� ���ο� �����ϴ°� ����
		String contextRoot = request.getSession().getServletContext().getRealPath("/");
		String fileRoot = contextRoot+"/resources/admin/image/notice/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//�������� ���ϸ�
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����
		String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//���� ����
			jsonObject.addProperty("url", "/project/resources/admin/image/notice/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");		
			fileStream.close();
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//����� ���� ����
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String result = jsonObject.toString();
		return result;
	}
	
	@PostMapping(value="/admin/product_image.upload", produces = "application/json; charset=utf8")
	public String uploadProductSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) throws IOException {
		
		JsonObject jsonObject = new JsonObject();
				
		String contextRoot = request.getSession().getServletContext().getRealPath("/");
		String fileRoot = contextRoot+"resources/admin/image/product/detail_image/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//�������� ���ϸ�
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����
		String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//���� ����
			jsonObject.addProperty("url", "/project/resources/admin/image/product/detail_image/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");		
			fileStream.close();
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//����� ���� ����
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String result = jsonObject.toString();
		return result;
	}
	
	


}