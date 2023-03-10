package com.onore.project.shop.service;

import java.util.List;

import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.dto.WishDTO;

public interface ShopService {


	List<ProductsDTO> all();

	List<ProductsDTO> derbyView();

	List<ProductsDTO> bootsView();

	List<ProductsDTO> loafersView();

	List<ProductsDTO> snakersView();

	ProductsDTO getDetail(Integer product_num);

	List<ReviewDTO> getProReview(Integer product_num);
	
	List<QnaDTO> getProQna(Integer product_num);
	
	Integer getWish (WishDTO wish);
	
	Integer deleteWish(WishDTO wish);
}
