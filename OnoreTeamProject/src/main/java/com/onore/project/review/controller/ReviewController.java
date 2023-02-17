package com.onore.project.review.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.dto.ReviewDTO;
import com.onore.project.review.mapper.ReviewMapper;
import com.onore.project.review.service.PageService;
import com.onore.project.review.service.impl.PageServiceImpl;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	ReviewMapper review_mapper;
	
	@Autowired
	PageService page;
	
	@GetMapping("/list")
	public String reviewList(HttpServletRequest req) {
		
		return page.service(req);
	}
	

	@GetMapping("/write")
	public String reviewWrite(Model model) {
		
		return "user/review/review_write";
	}
	
	@PostMapping("/write")
	public String writeReview(Model model, ReviewDTO review) {
		Integer row = review_mapper.insert(review);
		
		return "redirect:/review/list";
	}
	
	@GetMapping("/detail")
	public String reviewDetail(Model model, Integer review_num) {
		model.addAttribute("contents", review_mapper.get(review_num));
		
		return "user/review/review_detail";
	}
	
	
	
	
	
}
