package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.ProductsDTO;


public interface ShopMapper {
	
	List<ProductsDTO> getAll();
	
	List<ProductsDTO> getDerby();
	
	List<ProductsDTO> getBoots();
	
	List<ProductsDTO> getLoafers();
	
}
