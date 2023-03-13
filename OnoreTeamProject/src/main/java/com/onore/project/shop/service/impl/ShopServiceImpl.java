package com.onore.project.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.CartDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.mapper.ShopMapper;
import com.onore.project.shop.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	ShopMapper shop_mapper;

	@Override
	public List<ProductsDTO> all() {

		return shop_mapper.getAll();

	}


	@Override
	public List<ProductsDTO> derbyView() {

		return shop_mapper.getDerby();

	}

	@Override
	public List<ProductsDTO> bootsView() {

		return shop_mapper.getBoots();

	}

	@Override
	public List<ProductsDTO> loafersView() {

		return shop_mapper.getLoafers();

	}


	@Override
	public List<ProductsDTO> sneakersView() {

		return shop_mapper.getSneakers();

	}
	
	@Override
	public ProductsDTO getDetail(Integer product_num) {
		
		return shop_mapper.getDetail(product_num);
	}

	@Override
	public List<ReviewDTO> getProReview(Integer product_num) {
		
		return shop_mapper.getProReview(product_num);
	}
	
	@Override
	public Integer addToCart(CartDTO cart) {
		
		return shop_mapper.addToCart(cart);
	}
	
	@Override
	public List<CartDTO> getCartList(String mem_id) {
		
		return shop_mapper.getCartList(mem_id);
	}
	
	@Override
	public CartDTO getCart(Integer cart_num) {
		
		return shop_mapper.getCart(cart_num);
	}
	
	@Override
	public Integer updateCart(CartDTO cart) {
		
		return shop_mapper.updateCart(cart);
	}
	
	@Override
	public Integer deleteCart(Integer cart_num) {
	
		return shop_mapper.deleteCart(cart_num);
	}
	
	@Override
	public Integer deleteAllCart() {
		
		return shop_mapper.deleteAllCart();
	}
	
	@Override
	public Integer getWish(Integer product_num, String mem_id ) {
		
		return shop_mapper.getWish(product_num, mem_id);
	}


	@Override
	public Integer deleteWish(Integer product_num, String mem_id) {
		
		return shop_mapper.deleteWish(product_num, mem_id);
	}
}
