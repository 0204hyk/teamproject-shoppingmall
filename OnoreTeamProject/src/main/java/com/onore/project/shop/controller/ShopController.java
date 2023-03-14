package com.onore.project.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import com.onore.project.dto.MemberDTO;
import com.onore.project.dto.WishDTO;
import com.onore.project.qna.service.QnaService;
import com.onore.project.shop.service.ShopService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	ShopService shopService;
	
	@Autowired
	QnaService qnaService;

	@GetMapping("/main")
	public String main() {

		return "user/shop/shop_main";

	}
	
	@GetMapping("/detail")
	public String detailProduct(Model model, Integer product_num)  {
		model.addAttribute("product", shopService.getDetail(product_num));
		model.addAttribute("reviews", shopService.getProReview(product_num));
		model.addAttribute("qnas", shopService.getProQna(product_num));
//		HttpSession session = req.getSession();
//		int p_num = Integer.parseInt(req.getParameter("product_num"));
//		String id = ((MemberDTO)session.getAttribute("signIn")).getMem_id();
//		log.info(p_num);
//		log.info(id);
		model.addAttribute("wish", shopService.checkWish(product_num));
		
		return "user/shop/product";
	}
	
	@PostMapping("/cart")
	public String carttest() {
		
		return "user/shop/cart";
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
