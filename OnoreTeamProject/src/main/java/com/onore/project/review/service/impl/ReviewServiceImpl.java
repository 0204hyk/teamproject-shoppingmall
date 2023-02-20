package com.onore.project.review.service.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.CommentDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.mapper.ReviewMapper;
import com.onore.project.review.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewMapper review_mapper;
	
	@Override
	public List<ReviewDTO> getAll() {
		
		return review_mapper.getAll();
	}

	@Override
	public Integer insert(ReviewDTO rev) {
		
		return review_mapper.insert(rev);
	}

	@Override
	public ReviewDTO get(Integer review_num) {
		
		return review_mapper.get(review_num);
	}

	@Override
	public Integer modify(ReviewDTO rev) {
		
		return review_mapper.modify(rev);
	}

	@Override
	public Integer delete(Integer review_num) {
		
		return review_mapper.delete(review_num);
	}

	@Override
	public List<CommentDTO> getComment(Integer reivew_num) {
		
		return review_mapper.getComment(reivew_num);
	}
	
	
}
