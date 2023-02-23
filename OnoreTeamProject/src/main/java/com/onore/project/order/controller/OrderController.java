package com.onore.project.order.controller;

import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onore.project.order.dto.OrderDTO;
import com.onore.project.order.dto.OrderInfoDTO;
import com.onore.project.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService order_service;
	
	// 주문 페이지 prototype
	@GetMapping("/shop")
	public String purchase() {
		
		return "order/shop";
	}
	
	@PostMapping("")
	public String orderPage(Model model, @RequestParam List<String> product_name,
										 @RequestParam List<String> order_info_size,
										 @RequestParam List<String> order_info_option,
										 @RequestParam List<String> order_info_qty,
										 @RequestParam List<String> order_info_price) {
		
		// 주문명 만들기
		String order_name = product_name.get(0) + " 외 " + String.valueOf(product_name.size()-1) + "개" ;
		
		Integer total_price = 0;
		System.out.println(order_info_option);
		
		for(int i = 0; i < order_info_price.size(); i++) {
			// 상품 합계 만들기
			total_price += Integer.parseInt(order_info_price.get(i));
		}
		model.addAttribute("product_type_qty", product_name.size());
		model.addAttribute("product_name", product_name);
		model.addAttribute("order_name", order_name);
		model.addAttribute("order_info_qty", order_info_qty);
		model.addAttribute("order_info_size", order_info_size);
		model.addAttribute("order_info_option", order_info_option);
		model.addAttribute("order_info_price", order_info_price);
		model.addAttribute("total_price", total_price);
		
		return "order/order";
	}
	
	@PostMapping("/result")
	public String purchase(Model model, OrderDTO order, @RequestParam List<String> product_name,
			 										   @RequestParam List<String> order_info_size,
			 										   @RequestParam List<String> order_info_option,
			 										   @RequestParam List<String> order_info_qty,
			 										   @RequestParam List<String> order_info_price) {
		
		// insert
		int result = order_service.insertOrder(order, product_name, order_info_size, order_info_option,
								order_info_qty, order_info_price);
		
		
		if(result > 0) {
			List<OrderInfoDTO> infos = order_service.getOrderInfos(order.getOrder_id());
			model.addAttribute("orders", order);
			model.addAttribute("order_infos", infos);
			return "order/order_result";
		} else {
			return "order/order_fail";
		}
	}
	
}
