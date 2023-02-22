package com.onore.project.shop.controller.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.onore.project.dto.ProductsDTO;
import com.onore.project.mapper.ShopMapper;
import com.onore.project.shop.controller.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	ShopMapper shop_mapper;
	
	@Override
	public List<ProductsDTO> bootsView() {
		
	return shop_mapper.getBoots();
		
	}

	@Override
	public List<ProductsDTO> loafersView() {
		
		return shop_mapper.getLoafers();
	}

}
