package com.onore.project.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.about.controller.AboutController;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@GetMapping("/")
	public String about() {
		
		return "user/mypage/mypage";
	}
	
}
