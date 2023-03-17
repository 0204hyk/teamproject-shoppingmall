package com.onore.project.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.admin.service.AdminBoardService;
import com.onore.project.dto.QnaAndProductsDTO;
import com.onore.project.dto.ReviewandProductDTO;
import com.onore.project.mapper.QnaMapper;
import com.onore.project.mapper.ReviewMapper;

@Service
public class AdminBoardService_impl implements AdminBoardService {

	@Autowired
	QnaMapper qnaMapper;
	
	@Autowired
	ReviewMapper reviewMapper;
	
	@Override
	public List<QnaAndProductsDTO> readAllQna(QnaAndProductsDTO qna) {
		return qnaMapper.getSearchQnaList(qna);
	}

	@Override
	public Integer qnaDeleteService(Integer qna_num) {
		return qnaMapper.qnaDelete(qna_num);
	}
	
	@Override
	public List<ReviewandProductDTO> readAllReview(ReviewandProductDTO review) {
		return reviewMapper.getSearchReviewList(review);
	}

	@Override
	public Integer reviewDeleteService(Integer review_num) {
		return reviewMapper.delete(review_num);
	}
}
