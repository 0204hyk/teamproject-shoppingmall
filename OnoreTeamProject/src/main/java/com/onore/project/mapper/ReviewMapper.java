package com.onore.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.onore.project.dto.CommentDTO;
import com.onore.project.dto.ReviewDTO;

public interface ReviewMapper {
	
	List<ReviewDTO> getAll();
	
	Integer insert(ReviewDTO rev);
	
	ReviewDTO get(Integer review_num);
	
	List<CommentDTO> getComment(Integer review_num);
	
	Integer modify(ReviewDTO rev);
	
	Integer delete(Integer review_num); 
}
