package com.onore.project.shop.controller.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.onore.project.dto.ProductsDTO;

public interface ShopService {

	
	List<ProductsDTO> all();
	
	List<ProductsDTO> derbyView();
	
	List<ProductsDTO> bootsView();
	
	List<ProductsDTO> loafersView();
	
	List<ProductsDTO> snakersView();

	
}
