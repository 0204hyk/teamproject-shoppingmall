package com.onore.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/order")
@Controller
public class AdminOrderController {
	
	@GetMapping("/list")
	public String orderList() {
		return "/admin/order/admin_order_management";
	}
	
}
