package com.onore.project.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onore.project.dto.CartDTO;
import com.onore.project.dto.MemberDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.WishDTO;
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
		model.addAttribute("wish", shopService.checkWish(product_num));
		model.addAttribute("product", shopService.getDetail(product_num));
		model.addAttribute("reviews", shopService.getProReview(product_num));
		model.addAttribute("qnas", shopService.getProQna(product_num));

		return "user/shop/product";
	}

	@PostMapping("/insert_cart")
	public String insertToCart(Model model, HttpServletRequest req, ProductsDTO product,
															Integer order_cnt,
															Integer cart_product_price,
																 String size,
																 String heel,
																 String sole) {

		MemberDTO member = (MemberDTO)req.getSession().getAttribute("signIn");
		List<CartDTO> carts = shopService.getCartList(member.getMem_id());
		List<ProductsDTO> products = new ArrayList<>();

		String option = "size: " + size + "<br> " + "heel: " + heel + "<br> " + "sole: " + sole;
		Integer row = 0;
		for(int i = 0; i < carts.size(); i++) {
			products.add(shopService.getDetail(carts.get(i).getProduct_num()));
		}

		CartDTO cart = new CartDTO();
		for(int i = 0; i < products.size(); i++) {
			if(carts.size() > 0 && carts.get(i).getCart_product_option().equals(option)) {

				Integer updated_qty = carts.get(i).getCart_product_qty() + order_cnt;
				Integer updated_price = products.get(i).getProduct_price() + cart_product_price;
				cart.setCart_num(carts.get(i).getCart_num());
				cart.setCart_product_qty(updated_qty);
				cart.setCart_product_price(updated_price);
				row = shopService.updateCart(cart);
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
		}

		cart.setMem_id(member.getMem_id());
		cart.setProduct_num(product.getProduct_num());
		cart.setCart_product_qty(order_cnt);
		cart.setCart_product_option(option);
		cart.setCart_product_price(cart_product_price);
		row = shopService.addToCart(cart);

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

	@GetMapping("/cart")
	public String showCart(Model model, HttpServletRequest req) {

		MemberDTO member = (MemberDTO)req.getSession().getAttribute("signIn");
		List<CartDTO> cart_list = shopService.getCartList(member.getMem_id());
		List<ProductsDTO> cart_product_list = new ArrayList<>();
		System.out.println(cart_list);
		Integer total_price = 0;
		List<Integer> total_points = new ArrayList<>();
		for(int i = 0; i < cart_list.size(); i++) {
			// 카트에 담은 상품 상세 정보들
			cart_product_list.add(shopService.getDetail(cart_list.get(i).getProduct_num()));
			// 총 가격
			total_price += cart_list.get(i).getCart_product_price();
			// 최대 포인트
			total_points.add(cart_list.get(i).getCart_product_price() / 100 * 3 + 1000);
		}

		model.addAttribute("total_points", total_points);
		model.addAttribute("total_price", total_price);
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("cart_product_list", cart_product_list);

		return "user/shop/cart";
	}

	@PostMapping("/update_cart")
	public String updateCart(CartDTO cart, ProductsDTO product) {

		cart.setCart_product_price(product.getProduct_price() * cart.getCart_product_qty());
		System.out.println(cart);

		Integer row = shopService.updateCart(cart);

		if(row > 0) {
			return "redirect:/shop/cart?status=update_success";
		} else {
			return "redirect:/shop/cart?status=update_failed";
		}
	}

	@PostMapping("/delete_selected_cart")
	public String deleteCart(@RequestParam("selected_list") List<Integer> cart_num) {

		Integer row = 0;
		for (Integer element : cart_num) {
			row += shopService.deleteCart(element);
		}

		if(row == cart_num.size()) {
			return "redirect:/shop/cart?status=delete_success";
		} else {
			return "redirect:/shop/cart?status=delete_failed";
		}
	}

	@PostMapping("/delete_all_cart")
	public String deleteAllCart() {

		Integer row = shopService.deleteAllCart();

		if(row > 0) {
			return "redirect:/shop/cart?status=delete_success";
		} else {
			return "redirect:/shop/cart?status=delete_failed";
		}

	}

	@ResponseBody
	@PostMapping("/wish")
	public void getWish(@RequestBody WishDTO wish) {
		shopService.getWish(wish);

	}

	@ResponseBody
	@PostMapping("/nowish")
	public void deleteWish(@RequestBody WishDTO wish) {
		shopService.deleteWish(wish);
	}

}
