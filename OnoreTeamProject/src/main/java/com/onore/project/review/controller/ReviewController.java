package com.onore.project.review.controller;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.review.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	ReviewMapper review_mapper;
	
	
	@GetMapping("/list")
	public String reviewList(Model model) {
		model.addAttribute("reviews", review_mapper.getAll());
		
		return "user/review/review_main";
	}
	
	
	
	
}
