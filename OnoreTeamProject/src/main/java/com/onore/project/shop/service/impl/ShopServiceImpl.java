package com.onore.project.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.mapper.ShopMapper;
import com.onore.project.shop.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	ShopMapper shop_mapper;

	@Override
	public List<ProductsDTO> all() {

		return shop_mapper.getAll();

	}


	@Override
	public List<ProductsDTO> derbyView() {

		return shop_mapper.getDerby();

	}

	@Override
	public List<ProductsDTO> bootsView() {

		return shop_mapper.getBoots();

	}

	@Override
	public List<ProductsDTO> loafersView() {

		return shop_mapper.getLoafers();

	}


	@Override
	public List<ProductsDTO> snakersView() {

		return shop_mapper.getSnakers();

	}
	
	@Override
	public ProductsDTO getDetail(Integer product_num) {
		
		return shop_mapper.getDetail(product_num);
	}

	@Override
	public List<ReviewDTO> getProReview(Integer product_num) {
		
		return shop_mapper.getProReview(product_num);
	}
	
}
