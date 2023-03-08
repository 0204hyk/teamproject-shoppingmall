package com.onore.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onore.project.dto.MembersDTO;
import com.onore.project.member.service.MemberService;

@Controller
@RequestMapping("")
public class MemberController {

	@Autowired
	MemberService member_service;
	
	@GetMapping("/login")
	public String loginPage() {
		
		return "login";
	}
	
	@PostMapping("/shop")
	public String login(Model model, @RequestParam String login_id, @RequestParam String login_pw) {
		
		MembersDTO member = member_service.getMemberInfo(login_id);
		
		if(member.getMem_pw().equals(login_pw)) {
			
			model.addAttribute("mem_id", login_id);
			return "shop";
		} else {
			return "redirect:/login?status=login_failed";
		}
		
	}
	
	@GetMapping("/cart")
	public String cart() {
		return "user/shop/cart";
	}
}
