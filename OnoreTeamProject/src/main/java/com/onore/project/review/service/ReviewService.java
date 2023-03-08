package com.onore.project.review.service;

import java.util.List;

import com.onore.project.review.dto.ReviewDTO;

public interface ReviewService {
	
	List<ReviewDTO> getAll();
	
	ReviewDTO get(Integer review_num);
	
	Integer insert(ReviewDTO rev);
	
	Integer modify(ReviewDTO rev);
	
	Integer delete(Integer review_num);
}
