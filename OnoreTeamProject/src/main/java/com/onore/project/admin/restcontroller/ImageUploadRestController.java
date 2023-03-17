package com.onore.project.admin.restcontroller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class ImageUploadRestController {

	@PostMapping(value="/admin/notice_image.upload", produces = "application/json; charset=utf8")
	public String uploadNoticeSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) throws IOException {

		JsonObject jsonObject = new JsonObject();

		// 상대경로에 이미지 저장 시 재배포할 때마다 파일 유실 됨. 파일 유실 막으려면 절대경로로 C드라이브 내부에 저장하는게 좋음
		String contextRoot = request.getSession().getServletContext().getRealPath("/");
		String fileRoot = contextRoot+"/resources/admin/image/notice/";

		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/project/resources/admin/image/notice/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");
			fileStream.close();
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
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

		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/project/resources/admin/image/product/detail_image/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");
			fileStream.close();
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String result = jsonObject.toString();
		return result;
	}




}
