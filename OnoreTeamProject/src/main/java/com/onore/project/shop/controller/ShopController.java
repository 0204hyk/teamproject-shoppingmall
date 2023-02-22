package com.onore.project.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop")
public class ShopController {

	
	@GetMapping("/main")
	public String shopMain() {
		
		
		return "user/shop/shop_main";
	}
	

	
	
}
