package com.onore.project.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.onore.project.dto.ProductsDTO;
import com.onore.project.shop.controller.service.ShopService;

import lombok.extern.log4j.Log4j2;


@Log4j2
@RestController
public class ShopRestController {
	
	@Autowired
	ShopService shopService;
	
	@GetMapping(value = {"/restful/all"}, produces = "application/json; charset=UTF-8")
	public List<ProductsDTO> categoryAll() {
		
		return shopService.all();
	}
	
	@GetMapping(value = {"/restful/derby"}, produces = "application/json; charset=UTF-8")
	public List<ProductsDTO> derby() {

		return shopService.derbyView();
		
	}
	
	@GetMapping(value = {"/restful/boots"}, produces = "application/json; charset=UTF-8")
	public List<ProductsDTO> boots() {

		return shopService.bootsView();
		
	}
	
//	@GetMapping(value = {"/restful/loafer/{product_num}"}, produces = "application/json; charset=UTF-8")
//	public List<ProductsDTO> loafer(@PathVariable("product_num")Integer product_num) {
//		return shopService.bootSelect(product_num);
//	}

}
