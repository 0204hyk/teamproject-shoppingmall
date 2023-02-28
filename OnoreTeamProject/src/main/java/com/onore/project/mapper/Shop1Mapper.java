package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.ProductDTO;
import com.onore.project.dto.ReviewDTO;

public interface Shop1Mapper {
	
	ProductDTO getDetail(Integer product_num);
	
	List<ReviewDTO> getProReview(Integer product_num);
}
