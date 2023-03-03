package com.onore.project.review.service;

import java.util.List;

import com.onore.project.dto.CommentDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.dto.ReviewandProductDTO;

public interface ReviewService {
	
	List<ReviewandProductDTO> getAll();
	
	ReviewandProductDTO get(Integer review_num);
	
	Integer insert(ReviewDTO rev);
	
	Integer modify(ReviewDTO rev);
	
	Integer delete(Integer review_num);
}
