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
	public List<QnaAndProductsDTO> readAllQna() {
		return qnaMapper.getQnaAndProductsAll();
	}

	@Override
	public List<ReviewandProductDTO> readAllReview() {
		return reviewMapper.getAll();
	}

}
