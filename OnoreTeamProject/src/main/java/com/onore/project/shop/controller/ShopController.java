package com.onore.project.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.shop.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	ShopService shopService;

	@GetMapping("/main")
	public String main() {

		return "user/shop/shop_main";

	}
	
	@GetMapping("/detail")
	public String detailProduct(Model model, Integer product_num) {
		model.addAttribute("product", shopService.getDetail(product_num));
		model.addAttribute("reviews", shopService.getProReview(product_num));
		
		return "user/shop/product";
	}
	
	@PostMapping("/cart")
	public String carttest() {
		
		return "user/shop/cart";
	}
	
}
