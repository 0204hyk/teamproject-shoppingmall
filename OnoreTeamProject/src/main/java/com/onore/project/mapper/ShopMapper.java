package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.ReviewDTO;


public interface ShopMapper {

	List<ProductsDTO> getAll();

	List<ProductsDTO> getDerby();

	List<ProductsDTO> getBoots();

	List<ProductsDTO> getLoafers();

	List<ProductsDTO> getSnakers();
	
	ProductsDTO getDetail(Integer product_num);
	
	List<ReviewDTO> getProReview(Integer product_num);
	
	Integer getWish ( Integer product_num, String mem_id);
	
	Integer deleteWish(Integer product_num, String mem_id);
}
