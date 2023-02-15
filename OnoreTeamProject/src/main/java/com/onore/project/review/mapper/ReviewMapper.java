package com.onore.project.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.onore.project.dto.ReviewDTO;

public interface ReviewMapper {
	
	public List<ReviewDTO> getAll();
}
