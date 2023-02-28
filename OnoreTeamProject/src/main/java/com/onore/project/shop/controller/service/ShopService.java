package com.onore.project.shop.controller.service;

import java.util.List;

import com.onore.project.dto.ProductsDTO;

public interface ShopService {


	List<ProductsDTO> all();

	List<ProductsDTO> derbyView();

	List<ProductsDTO> bootsView();

	List<ProductsDTO> loafersView();

	List<ProductsDTO> snakersView();


}
