package com.onore.project.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LocationController {

	
	@GetMapping("/location")
	public String member_mypage() throws Exception {
		return "user/location/location";
	}
}
