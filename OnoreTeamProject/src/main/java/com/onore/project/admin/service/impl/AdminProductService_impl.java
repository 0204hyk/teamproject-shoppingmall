package com.onore.project.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.admin.service.AdminProductService;
import com.onore.project.dto.CategoriesDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.mapper.CategoriesMapper;
import com.onore.project.mapper.ProductsMapper;

@Service
public class AdminProductService_impl implements AdminProductService{
	
	@Autowired
	CategoriesMapper categoriesMapper;
	
	@Autowired
	ProductsMapper productsMapper;

	@Override
	public List<CategoriesDTO> readCaregoriesList() {
		return categoriesMapper.getAllCategory();
	}

	@Override
	public Integer productRegist(ProductsDTO product) {
		return productsMapper.insertProduct(product);
	}

}
