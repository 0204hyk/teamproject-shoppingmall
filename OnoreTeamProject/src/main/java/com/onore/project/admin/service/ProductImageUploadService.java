package com.onore.project.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface ProductImageUploadService {
	
	String uploadFile(HttpServletRequest request, MultipartFile file);
}
