package com.onore.project.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onore.project.dto.CartDTO;
import com.onore.project.dto.CouponDTO;
import com.onore.project.dto.MemberDTO;
import com.onore.project.dto.OrderDTO;
import com.onore.project.dto.OrderInfoDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.PurchaseInfoDTO;
import com.onore.project.member.service.MemberService;
import com.onore.project.order.service.OrderService;
import com.onore.project.shop.service.ShopService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService order_service;
	
	@Autowired
	MemberService member_service;
	
	@Autowired
	ShopService shop_service;
	
	// 회원정보와 주문 정보를 받아 주문 페이지로 이동 (주문 상품이 여러개 or 선택 상품 주문 클릭시)
		@PostMapping("/order_directly")
		public String orderDirectly(Model model, HttpServletRequest req, Integer product_num,
																		 Integer order_cnt,
																		 Integer cart_product_price,
																		 String size,
																		 String heel,
																		 String sole) throws Exception {
			
			// 주문자인 회원 정보 가져오기
			MemberDTO member = (MemberDTO)req.getSession().getAttribute("signIn");
			List<CouponDTO> coupons  = member_service.getCoupons(member.getMem_id());
			ProductsDTO product = shop_service.getDetail(product_num);
			CartDTO cart = new CartDTO();
			
			cart.setMem_id(member.getMem_id());
			cart.setProduct_num(product.getProduct_num());
			cart.setCart_product_qty(order_cnt);
			cart.setCart_product_price(cart_product_price);
			cart.setCart_product_option("size: " + size + "<br> " + "heel: " + heel + "<br> " + "sole: " + sole);
			
			String order_name = product.getProduct_name();
					// 상품 합계 만들기
			Integer total_price = cart.getCart_product_price();
			
			// 사용가능한 적립금 책정하기 (총 결제액에 5%)
			Integer accessible_points = total_price / 20;
			
			model.addAttribute("product", product);
			model.addAttribute("cart", cart);
			model.addAttribute("order_name", order_name);
			model.addAttribute("total_price", total_price);
			model.addAttribute("orderer", member);
			model.addAttribute("coupons", coupons);
			model.addAttribute("accessible_points", accessible_points);
			
			return "user/order/order_main";
		}
	
	// 회원정보와 주문 정보를 받아 주문 페이지로 이동 (주문 상품이 여러개 or 선택 상품 주문 클릭시)
	@PostMapping("/from_cart")
	public String orderMutipleItems(Model model, HttpServletRequest req,
					@RequestParam("selected_list") List<Integer> selected_list) throws Exception {
		
		// 주문자인 회원 정보 가져오기
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("signIn");
		List<CouponDTO> coupons  = member_service.getCoupons(member.getMem_id());
		List<CartDTO> cart = new ArrayList<CartDTO>();
		System.out.println("selected_list: " + selected_list);
		for(int i = 0; i < selected_list.size(); i++) {		
			cart.add(shop_service.getCart(selected_list.get(i)));
		}
		
		List<ProductsDTO> products = new ArrayList<ProductsDTO>();
		for(int i = 0; i < cart.size(); i++) {
			products.add(shop_service.getDetail(cart.get(i).getProduct_num()));
		}
		
		String order_name = null;
		Integer total_price = 0;
		for(int i = 0; i < products.size(); i++) {
			if(products.size() > 1) {
				// 주문명 만들기
				order_name = products.get(i).getProduct_name() + " 외 " + String.valueOf(products.size()-1) + "개" ;
			} else {
				order_name = products.get(i).getProduct_name();
			}
				// 상품 합계 만들기
				total_price += cart.get(i).getCart_product_price();
		}
		
		// 사용가능한 적립금 책정하기 (총 결제액에 5%)
		Integer accessible_points = total_price / 20;
		
		model.addAttribute("products", products);
		model.addAttribute("cart", cart);
		model.addAttribute("order_name", order_name);
		model.addAttribute("total_price", total_price);
		model.addAttribute("orderer", member);
		model.addAttribute("coupons", coupons);
		model.addAttribute("accessible_points", accessible_points);
		
		return "user/order/order_main";
	}
	
	@PostMapping("/result")
	public String purchase(Model model, OrderDTO order, RedirectAttributes ra,
														@RequestParam("cart_num")
														List<Integer> cart_num,
														@RequestParam(required = false)
														String set_default_check,
														@RequestParam String payment_key,
			   											@RequestParam String amount,
			   											// order_info 테이블 기록용
													    @RequestParam List<String> product_name,
			 										    @RequestParam List<String> order_info_option,
			 										    @RequestParam List<String> order_info_qty,
			 										    @RequestParam List<String> order_info_price) throws Exception {
		
		// 카트 정보 불러오기
		List<CartDTO> cart = new ArrayList<CartDTO>();
		for(int i = 0; i < cart_num.size(); i++) {
			cart.add(shop_service.getCart(cart_num.get(i)));
		}
		
		// 주문한 상품정보 받아오기
		List<ProductsDTO> products = new ArrayList<ProductsDTO>();
		for(int i = 0; i < product_name.size(); i++) {
			products.add(shop_service.getDetail(cart.get(i).getProduct_num()));
		}
		System.out.println("result : " + products);
		
		// 주문 기록
		Integer order_result = order_service.insertOrder(order);
		
		// 사용해 사용한 쿠폰 제거
		Integer delete_coupon_result = null;
		
		System.out.println("쿠폰 : " + order.getDiscount_coupon());
		delete_coupon_result = member_service.deleteCoupon(order.getDiscount_coupon());
		System.out.println(delete_coupon_result);
		
		// 회원 보유 적립금 += (받을 적립금(결제 금액의 3%) - 사용한 적립금)
		MemberDTO member = member_service.getMember(order.getOrderer_id());
		member.setMem_point(member.getMem_point() + ((order.getPay_price() / 100 * 3) - order.getDiscount_points()));
		// 적립금 업데이트
		Integer update_points_result = member_service.updatePoints(member);
		System.out.println(update_points_result);
		
		if(order_result > 0) {
			if(set_default_check != null) {
				MemberDTO address = new MemberDTO();
				address.setMem_id(order.getOrderer_id());
				address.setMem_zip_code(order.getReceiver_zip_code());
				address.setMem_street_address(order.getReceiver_address());
				address.setMem_detail_address(order.getReceiver_detail_address());
				Integer row = member_service.updateMemberAddress(address);
				if (row <= 0) {
					model.addAttribute("status", "update_address_failed");
					return "user/order/order_fail";
				}
			}
			
			if(update_points_result <= 0) {
				return "user/order/order_fail";
			}
			
			List<OrderDTO> all_orders = order_service.getAllOrders();
			order.setOrder_num(all_orders.get(all_orders.size()-1).getOrder_num());
			int result = 0;
			for(int i = 0; i < products.size(); i++) {
				result = order_service.insertOrderInfos(order, products.get(i), product_name.get(i), order_info_option.get(i),
								order_info_qty.get(i), order_info_price.get(i));
			}
		
			if(result > 0) {
				// 주문한 상품 카트에서 지우기
				for(int i = 0; i < cart_num.size(); i++) {
					shop_service.deleteCart(cart_num.get(i));
				}
				
			
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
	
	@PostMapping("/direct_result")
	public String purchase_directly(Model model, OrderDTO order, @RequestParam("product_num") Integer product_num,
																@RequestParam(required = false)
																String set_default_check,
																@RequestParam String payment_key,
					   											@RequestParam String amount,
					   											// order_info 테이블 기록용
															    @RequestParam String product_name,
					 										    @RequestParam String order_info_option,
					 										    @RequestParam String order_info_qty,
					 										    @RequestParam String order_info_price) throws Exception {
		
		System.out.println("Order : " + order);
		
		// 주문한 상품정보 받아오기
		ProductsDTO product = shop_service.getDetail(product_num);
		System.out.println("direct_result : " + product);
		
		// 주문 기록
		Integer order_result = order_service.insertOrder(order);
		System.out.println(order_result);
		
		// 사용해 사용한 쿠폰 제거
		Integer delete_coupon_result = null;
		
		System.out.println("쿠폰 : " + order.getDiscount_coupon());
		delete_coupon_result = member_service.deleteCoupon(order.getDiscount_coupon());
		System.out.println(delete_coupon_result);
		
		// 회원 보유 적립금 += (받을 적립금(결제 금액의 3%) - 사용한 적립금)
		MemberDTO member = member_service.getMember(order.getOrderer_id());
		member.setMem_point(member.getMem_point() + ((order.getPay_price() / 100 * 3) - order.getDiscount_points()));
		
		// 적립금 업데이트
		Integer update_points_result = member_service.updatePoints(member);
		System.out.println(update_points_result);
		
		if(order_result > 0) {
			if(set_default_check != null) {
				MemberDTO address = new MemberDTO();
				address.setMem_id(order.getOrderer_id());
				address.setMem_zip_code(order.getReceiver_zip_code());
				address.setMem_street_address(order.getReceiver_address());
				address.setMem_detail_address(order.getReceiver_detail_address());
				Integer row = member_service.updateMemberAddress(address);
				if (row <= 0) {
					model.addAttribute("status", "update_address_failed");
					return "user/order/order_fail";
				}
			}
			
			if(update_points_result <= 0) {
				return "user/order/order_fail";
			}
			
			List<OrderDTO> all_orders = order_service.getAllOrders();
			order.setOrder_num(all_orders.get(all_orders.size()-1).getOrder_num());
			int result = order_service.insertOrderInfos(order, product, product_name, order_info_option,
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
		List<ProductsDTO> products = new ArrayList<ProductsDTO>();
		for(int i = 0; i < order_infos.size(); i++) {
			products.add(shop_service.getDetail(order_infos.get(i).getProduct_num()));
		}
		PurchaseInfoDTO purchase_info = order_service.getPurchaseInfo(Integer.parseInt(order_num));

		Integer discount_by_coupon = order.getTotal_discount() - order.getDiscount_points();
		Integer expected_points = (order.getPay_price() / 100 * 1) + 1000;
		Integer basic_points = (order.getPay_price() / 100 * 1);
		
		model.addAttribute("order", order);
		model.addAttribute("order_infos", order_infos);
		model.addAttribute("products", products);
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
	
	@PostMapping("/delete")
	public String deleteOrder(Model model, Integer order_num) {
		
		Integer row1 = order_service.deleteOrderInfos(order_num);
		System.out.println("delete_order_infos : " + row1);
		Integer row2 = order_service.deletePayInfos(order_num);
		System.out.println("delete_pay_infos : " + row1);
		
		if(row1 > 0 && row2 > 0) {
			Integer row3 = order_service.deleteOrder(order_num);
			if(row3 > 0) {				
				model.addAttribute("status","delete_order_success");
				return "redirect:/mypage";
			} else {
				model.addAttribute("status","delete_order_failed");
				return "redirect:/mypage";
			}
		} else {
			model.addAttribute("status","delete_order_failed");
			return "redirect:/mypage";			
		}
	}
	
	

}
