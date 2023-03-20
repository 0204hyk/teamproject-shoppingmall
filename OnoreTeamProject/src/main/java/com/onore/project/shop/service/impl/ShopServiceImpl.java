package com.onore.project.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.CartDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.dto.ShopDTO;
import com.onore.project.dto.WishDTO;
import com.onore.project.mapper.ShopMapper;
import com.onore.project.shop.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	ShopMapper shop_mapper;

	@Override
	public List<ShopDTO> all() {

		return shop_mapper.getAll();

	}


	@Override
	public List<ShopDTO> derbyView() {

		return shop_mapper.getDerby();

	}

	@Override
	public List<ShopDTO> bootsView() {

		return shop_mapper.getBoots();

	}

	@Override
	public List<ShopDTO> loafersView() {

		return shop_mapper.getLoafers();

	}


	@Override
	public List<ShopDTO> sneakersView() {

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
	public List<QnaDTO> getProQna(Integer product_num) {

		return shop_mapper.getProQna(product_num);
	}


	@Override
	public Integer getWish(WishDTO wish) {

		return shop_mapper.getWish(wish);
	}


	@Override
	public Integer deleteWish(WishDTO wish) {

		return shop_mapper.deleteWish(wish);
	}

	@Override
	public String checkWish(Integer product_num) {

		return shop_mapper.checkWish(product_num);
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
}
