package com.onore.project.review.service;

import javax.servlet.http.HttpServletRequest;

import com.onore.project.dto.ReviewDTO;


public interface PageService {
	
	ReviewDTO service(HttpServletRequest req);
}
