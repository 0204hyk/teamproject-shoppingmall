package com.onore.project.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onore.project.dto.ProductsDTO;
import com.onore.project.mapper.ShopMapper;
import com.onore.project.qna.service.ShopService;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;

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
