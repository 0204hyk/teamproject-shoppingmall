package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.CartDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.ReviewDTO;


public interface ShopMapper {

	List<ProductsDTO> getAll();

	List<ProductsDTO> getDerby();

	List<ProductsDTO> getBoots();

	List<ProductsDTO> getLoafers();

	List<ProductsDTO> getSneakers();
	
	ProductsDTO getDetail(Integer product_num);
	
	List<ReviewDTO> getProReview(Integer product_num);
	
	Integer addToCart(CartDTO cart);
	
	List<CartDTO> getCart(String mem_id);
	
}
