package com.onore.project.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.shop.controller.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	ShopService shopService;

	@GetMapping("/main")
	public String main() {

		return "user/shop/shop_main";

	}
}
