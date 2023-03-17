package com.onore.project.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.onore.project.dto.PurchaseInfoDTO;
import com.onore.project.order.service.OrderService;

@RestController
public class OrderRestController {

	@Autowired
	OrderService order_service;

	@PostMapping(value="/order/purchase", produces="text/plain; charset=UTF-8")
	public String insertPurchaseInfo(@RequestBody PurchaseInfoDTO purchase_info) {

		System.out.println(purchase_info);

		Integer row = order_service.insertPurchaseInfo(purchase_info);

		if(row > 0) {
			return "purchase_success";
		} else {
			return "purchase_fail";
		}
	}
}
