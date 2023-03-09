package com.onore.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.mapper.MemberMapper;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	MemberMapper mapper;
	
	// 메인 페이지
	@GetMapping("/")
		public String main() {
		
		return "user/main/onore";
	}

}
