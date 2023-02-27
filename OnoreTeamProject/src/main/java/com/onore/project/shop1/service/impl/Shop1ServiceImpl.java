package com.onore.project.shop1.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.ProductDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.mapper.Shop1Mapper;
import com.onore.project.shop1.service.Shop1Service;

@Service
public class Shop1ServiceImpl implements Shop1Service {
	
	@Autowired
	Shop1Mapper shop_mapper;

	@Override
	public ProductDTO getDetail(Integer product_num) {
		
		return shop_mapper.getDetail(product_num);
	}

	@Override
	public List<ReviewDTO> getProReview(Integer product_num) {
		
		return shop_mapper.getProReview(product_num);
	}
	
	
}
