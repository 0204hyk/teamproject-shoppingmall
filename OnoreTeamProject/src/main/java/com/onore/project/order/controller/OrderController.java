package com.onore.project.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onore.project.dto.CouponDTO;
import com.onore.project.dto.MembersDTO;
import com.onore.project.member.service.MemberService;
import com.onore.project.dto.OrderDTO;
import com.onore.project.dto.OrderInfoDTO;
import com.onore.project.dto.PurchaseInfoDTO;
import com.onore.project.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService order_service;
	
	@Autowired
	MemberService member_service;
	
	// 회원정보와 주문 정보를 받아 주문 페이지로 이동
	@PostMapping("")
	public String orderPage(Model model, String mem_id, @RequestParam List<String> product_name,
										 					@RequestParam List<String> order_info_size,
										 					@RequestParam List<String> order_info_option,
										 					@RequestParam List<String> order_info_qty,
										 					@RequestParam List<String> order_info_price) {
		// 주문자인 회원 정보 가져오기
		MembersDTO member = member_service.getMemberInfo(mem_id);
		List<CouponDTO> coupons  = member_service.getCoupons(mem_id);
		
		// 주문명 만들기
		String order_name = product_name.get(0) + " 외 " + String.valueOf(product_name.size()-1) + "개" ;
		
		Integer total_price = 0;
		for(int i = 0; i < order_info_price.size(); i++) {
			// 상품 합계 만들기
			total_price += Integer.parseInt(order_info_price.get(i));
		}
		
		// 사용가능한 적립금 책정하기 (총 결제액에 10%)
		Integer accessible_points = total_price / 10;
		
		model.addAttribute("product_type_qty", product_name.size());
		model.addAttribute("product_name", product_name);
		model.addAttribute("order_name", order_name);
		model.addAttribute("order_info_qty", order_info_qty);
		model.addAttribute("order_info_size", order_info_size);
		model.addAttribute("order_info_option", order_info_option);
		model.addAttribute("order_info_price", order_info_price);
		model.addAttribute("total_price", total_price);
		model.addAttribute("orderer", member);
		model.addAttribute("coupons", coupons);
		model.addAttribute("accessible_points", accessible_points);
		
		return "user/order/order_main";
	}
	
	@PostMapping("/result")
	public String purchase(Model model, OrderDTO order,	@RequestParam String mem_id,
														@RequestParam(required = false)
														String set_default_check,
														@RequestParam String payment_key,
			   											@RequestParam String amount,
													    @RequestParam List<String> product_name,
			 										    @RequestParam List<String> order_info_size,
			 										    @RequestParam List<String> order_info_option,
			 										    @RequestParam List<String> order_info_qty,
			 										    @RequestParam List<String> order_info_price) {
		
		System.out.println(order);
		
		// insert Order
		int order_result = order_service.insertOrder(order);
		
		if(order_result > 0) {
			if(set_default_check != null) {
				MembersDTO address = new MembersDTO();
				address.setMem_id(mem_id);
				address.setMem_zip_code(order.getReceiver_zip_code());
				address.setMem_address(order.getReceiver_address());
				address.setMem_detail_address(order.getReceiver_detail_address());
				Integer row = member_service.updateMemberAddress(address);
				if (row <= 0) {
					model.addAttribute("status", "update_address_failed");
					return "user/order/order_fail";
				}
			}
			
			List<OrderDTO> all_orders = order_service.getAllOrders();
			System.out.println(all_orders);
			order.setOrder_num(all_orders.get(all_orders.size()-1).getOrder_num());
			int result = order_service.insertOrderInfos(order, product_name, order_info_size, order_info_option,
								order_info_qty, order_info_price);
		
			if(result > 0) {
				model.addAttribute("order", order);
				model.addAttribute("payment_key", payment_key);
				model.addAttribute("amount", amount);
				return "user/order/order_result";
			} else {
				model.addAttribute("status", "order_info_failed");
				return "user/order/order_fail";
			}
		} else {
			model.addAttribute("status", "order_failed");
			return "user/order/order_fail";
		}
	}
	
	@GetMapping("/complete")
	public String orderComplete(Model model, @RequestParam String order_num) {
		OrderDTO order = order_service.getOrder(Integer.parseInt(order_num));
		List<OrderInfoDTO> order_infos = order_service.getOrderInfos(Integer.parseInt(order_num));
		PurchaseInfoDTO purchase_info = order_service.getPurchaseInfo(Integer.parseInt(order_num));

		Integer discount_by_coupon = order.getTotal_discount() - order.getDiscount_points();
		Integer expected_points = (order.getPay_price() / 100 * 3) + 1000;
		Integer basic_points = (order.getPay_price() / 100 * 3);
		
		model.addAttribute("order", order);
		model.addAttribute("order_infos", order_infos);
		model.addAttribute("purchase_info", purchase_info);
		model.addAttribute("expected_points", expected_points);
		model.addAttribute("basic_points", basic_points);
		if(discount_by_coupon == null || discount_by_coupon == 0) {
			model.addAttribute("discount_by_coupon", 0);
		} else {
			model.addAttribute("discount_by_coupon", discount_by_coupon);
		}
		return "user/order/order_complete";
	}
	
	@PostMapping("/updateReceiver")
	public String updateReceiver(Model model, OrderDTO receiver_info) {
		
		Integer row = order_service.updateReceiver(receiver_info);
		
		if(row > 0) {
			return "redirect:/order/complete?order_num=" + receiver_info.getOrder_num();
		} else {
			return "redirect:/order/complete?order_num=" + receiver_info.getOrder_num() + "&status=update_failed";
		}
	}

}
