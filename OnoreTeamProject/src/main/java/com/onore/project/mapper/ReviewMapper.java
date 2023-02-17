package com.onore.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.onore.project.dto.ReviewDTO;

public interface ReviewMapper {
	
	public List<ReviewDTO> getAll();
	
	public Integer insert(ReviewDTO rev);
	
	public ReviewDTO get(Integer review_num);
}
