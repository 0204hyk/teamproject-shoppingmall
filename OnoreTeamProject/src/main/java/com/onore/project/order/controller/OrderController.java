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

import com.ctc.wstx.io.SystemId;
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
	
	// ȸ�������� �ֹ� ������ �޾� �ֹ� �������� �̵� (�ֹ� ��ǰ�� ������ or ���� ��ǰ �ֹ� Ŭ����)
		@PostMapping("/order_directly")
		public String orderDirectly(Model model, HttpServletRequest req, Integer product_num,
																		 Integer order_cnt,
																		 Integer cart_product_price,
																		 String size,
																		 String heel,
																		 String sole) throws Exception {
			
			// �ֹ����� ȸ�� ���� ��������
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
					// ��ǰ �հ� �����
			Integer total_price = cart.getCart_product_price();
			
			// ��밡���� ������ å���ϱ� (�� �����׿� 5%)
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
	
	// ȸ�������� �ֹ� ������ �޾� �ֹ� �������� �̵� (�ֹ� ��ǰ�� ������ or ���� ��ǰ �ֹ� Ŭ����)
	@PostMapping("/from_cart")
	public String orderMutipleItems(Model model, HttpServletRequest req,
					@RequestParam("selected_list") List<Integer> selected_list) throws Exception {
		
		// �ֹ����� ȸ�� ���� ��������
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
				// �ֹ��� �����
				order_name = products.get(i).getProduct_name() + " �� " + String.valueOf(products.size()-1) + "��" ;
			} else {
				order_name = products.get(i).getProduct_name();
			}
				// ��ǰ �հ� �����
				total_price += cart.get(i).getCart_product_price();
		}
		
		// ��밡���� ������ å���ϱ� (�� �����׿� 5%)
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
	public String purchase(Model model, OrderDTO order, @RequestParam("cart_num")
														List<Integer> cart_num,
														@RequestParam(required = false)
														String set_default_check,
														@RequestParam String payment_key,
			   											@RequestParam String amount,
			   											// order_info ���̺� ��Ͽ�
													    @RequestParam List<String> product_name,
			 										    @RequestParam List<String> order_info_option,
			 										    @RequestParam List<String> order_info_qty,
			 										    @RequestParam List<String> order_info_price) throws Exception {
		
		System.out.println("Order : " + order);
		System.out.println(cart_num);
		
		// īƮ ���� �ҷ�����
		List<CartDTO> cart = new ArrayList<CartDTO>();
		for(int i = 0; i < cart_num.size(); i++) {
			cart.add(shop_service.getCart(cart_num.get(i))); 
		}
		
		// �ֹ��� ��ǰ���� �޾ƿ���
		List<ProductsDTO> products = new ArrayList<ProductsDTO>();
		for(int i = 0; i < cart.size(); i++) {
			products.add(shop_service.getDetail(cart.get(i).getProduct_num()));
		}
		System.out.println(products);
		
		// �ֹ� ���
		Integer order_result = order_service.insertOrder(order);
		System.out.println(order_result);
		
		// ����� ����� ���� ����
		Integer delete_coupon_result = null;
		
		System.out.println("���� : " + order.getDiscount_coupon());
		delete_coupon_result = member_service.deleteCoupon(order.getDiscount_coupon());
		System.out.println(delete_coupon_result);
		
		// ȸ�� ���� ������ += (���� ������(���� �ݾ��� 3%) - ����� ������)
		MemberDTO member = member_service.getMember(order.getOrderer_id());
		member.setMem_point(member.getMem_point() + ((order.getPay_price() / 100 * 3) - order.getDiscount_points()));
		// ������ ������Ʈ
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
			
//			if(order.getDiscount_coupon() != null || order.getDiscount_coupon() != " " || order.getDiscount_coupon() != "") {
//				System.out.println("in");
//				if(delete_coupon_result <= 0) {
//					return "user/order/order_fail";
//				}
//			}
			
			if(update_points_result <= 0) {
				return "user/order/order_fail";
			}
			
			List<OrderDTO> all_orders = order_service.getAllOrders();
			order.setOrder_num(all_orders.get(all_orders.size()-1).getOrder_num());
			int result = 0;
			for(int i = 0; i < products.size(); i++) {
				result = order_service.insertOrderInfos(order, products.get(i), product_name, order_info_option,
								order_info_qty, order_info_price);
			}
		
			if(result > 0) {
				// �ֹ��� ��ǰ īƮ���� �����
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
					   											// order_info ���̺� ��Ͽ�
															    @RequestParam List<String> product_name,
					 										    @RequestParam List<String> order_info_option,
					 										    @RequestParam List<String> order_info_qty,
					 										    @RequestParam List<String> order_info_price) throws Exception {
		
		System.out.println("Order : " + order);
		
		// �ֹ��� ��ǰ���� �޾ƿ���
		ProductsDTO product = shop_service.getDetail(product_num);
		System.out.println(product);
		
		// �ֹ� ���
		Integer order_result = order_service.insertOrder(order);
		System.out.println(order_result);
		
		// ����� ����� ���� ����
		Integer delete_coupon_result = null;
		
		System.out.println("���� : " + order.getDiscount_coupon());
		delete_coupon_result = member_service.deleteCoupon(order.getDiscount_coupon());
		System.out.println(delete_coupon_result);
		
		// ȸ�� ���� ������ += (���� ������(���� �ݾ��� 3%) - ����� ������)
		MemberDTO member = member_service.getMember(order.getOrderer_id());
		member.setMem_point(member.getMem_point() + ((order.getPay_price() / 100 * 3) - order.getDiscount_points()));
		
		// ������ ������Ʈ
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

}