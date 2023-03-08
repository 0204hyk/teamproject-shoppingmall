package com.onore.project.shop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.dto.CartDTO;
import com.onore.project.dto.ProductsDTO;
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
	
	@PostMapping("/insert_cart")
	public String insertToCart(Model model, ProductsDTO product, String product_qty,
																 String size,
																 String heel,
																 String sole) {
		CartDTO cart = new CartDTO();
		
		cart.setMem_id("Sai");
		cart.setProduct_num(product.getProduct_num());
		cart.setCart_product_qty(Integer.parseInt(product_qty));
		String option = "size: " + size + " / heel: " + heel + " / sole: " + sole;
		cart.setCart_product_option(option);
		
		Integer row = shopService.addToCart(cart);
		
		if(row > 0) {
			model.addAttribute("product_num", product.getProduct_num());
			model.addAttribute("status","added_to_cart");
			return "redirect:/shop/detail";
		} else {
			model.addAttribute("product_num", product.getProduct_num());
			model.addAttribute("status","failed_to_add");
			return "redirect:/shop/detail";
		}
	}
	
	
	@PostMapping("/cart")
	public String showCart(Model model, String mem_id) {
		
		List<CartDTO> cart_list = shopService.getCart(mem_id);
		List<ProductsDTO> cart_product_list = new ArrayList<>();
		
		for(int i = 0; i < cart_list.size(); i++) {			
			cart_product_list.add(shopService.getDetail(cart_list.get(i).getProduct_num()));
		}
		
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("cart_products", cart_product_list);
		
		return "user/shop/cart";
	}
	
}
