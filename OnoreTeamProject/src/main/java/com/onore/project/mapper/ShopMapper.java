package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.ProductsDTO;


public interface ShopMapper {
	
	List<ProductsDTO> getBoots();
	
	List<ProductsDTO> getLoafers();
	
	List<ProductsDTO> getSelectBoot(int product_num);
}
