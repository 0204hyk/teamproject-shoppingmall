package com.onore.project.about.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/about")
public class AboutController {

	@GetMapping("/")
	public String about() {

		return "user/about/about_main";
	}
}
