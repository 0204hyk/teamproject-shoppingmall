package com.onore.project.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class LocationController {

	
	@GetMapping("/location")
	public String member_mypage() throws Exception {
		return "user/location/location";
	}
}
