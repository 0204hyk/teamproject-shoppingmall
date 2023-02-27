package com.onore.project.shop1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.review.service.ReviewService;
import com.onore.project.shop1.service.Shop1Service;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/shop1")
public class Shop1Controller {
	
	@Autowired
	Shop1Service shop_service;
	
	@GetMapping("/product")
	public String detailProduct(Model model, Integer product_num) {
		model.addAttribute("product", shop_service.getDetail(product_num));
		model.addAttribute("reviews", shop_service.getProReview(product_num));
		
		return "user/shop1/product";
	}
}
