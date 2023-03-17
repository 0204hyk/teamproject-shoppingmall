package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.CartDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.dto.WishDTO;


public interface ShopMapper {

	List<ProductsDTO> getAll();

	List<ProductsDTO> getDerby();

	List<ProductsDTO> getBoots();

	List<ProductsDTO> getLoafers();

	List<ProductsDTO> getSneakers();

	ProductsDTO getDetail(Integer product_num);

	List<ReviewDTO> getProReview(Integer product_num);

	List<QnaDTO> getProQna(Integer product_num);

	Integer getWish (WishDTO wish);

	Integer deleteWish(WishDTO wish);

	String checkWish(Integer product_num);

	Integer addToCart(CartDTO cart);

	List<CartDTO> getCartList(String mem_id);

	CartDTO getCart(Integer cart_num);

	Integer updateCart(CartDTO cart);

	Integer deleteCart(Integer cart_num);

	Integer deleteAllCart();

}
