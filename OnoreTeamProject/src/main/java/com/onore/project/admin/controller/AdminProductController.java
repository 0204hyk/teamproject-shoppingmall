package com.onore.project.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.onore.project.admin.service.AdminProductService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/product")
@Controller
public class AdminProductController {
	
	@Autowired
	AdminProductService service;
	
	@GetMapping("/regist")
	public String productRegistForm(HttpServletRequest request) {
		request.setAttribute("categories", service.readCaregoriesList());
		return "/admin/product/admin_product_regist";
	}
	
	@PostMapping("/regist")
	public String productRegist(HttpServletRequest request, @RequestParam(value = "product_thumbnail_1", required = false) MultipartFile product_thumbnail_1,
			@RequestParam(value = "product_thumbnail_2", required = false) MultipartFile product_thumbnail_2, 
			@RequestParam(value = "product_thumbnail_3", required = false) MultipartFile product_thumbnail_3) throws IOException {
		
		String category_num = request.getParameter("category_num");
		String product_name = request.getParameter("product_name");
		String product_price = request.getParameter("product_price");
		String product_info = request.getParameter("product_info");
		
		System.out.println("category_num" + category_num);
		System.out.println("product_name" + product_name);
		System.out.println("product_price" + product_price);
		System.out.println("product_info" + product_info);
		System.out.println("product_thumbnail_1" + product_thumbnail_1);
		System.out.println("product_thumbnail_2" + product_thumbnail_2);
		System.out.println("product_thumbnail_3" + product_thumbnail_3);
//		if (!category_num.equals("") && !product_name.equals("") && !product_price.equals("") && !product_info.equals("")) {
//			ProductsDTO product = new ProductsDTO();
//			product.setCategory_num(Integer.parseInt(category_num));
//			product.setProduct_name(product_name);
//			product.setProduct_price(Integer.parseInt(product_price));
//			product.setProduct_info(product_info);
//			product.setProduct_thumbnail_1(product_thumbnail_1);
//			product.setProduct_thumbnail_2(product_thumbnail_2);
//			product.setProduct_thumbnail_3(product_thumbnail_3);
//			service.productRegist(product);
//		}
		
		return "redirect:/admin/product/regist";
	}
	
}
