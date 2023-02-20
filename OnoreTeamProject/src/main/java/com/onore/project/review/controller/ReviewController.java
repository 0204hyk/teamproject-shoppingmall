package com.onore.project.review.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onore.project.dto.CommentDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.review.service.PageService;
import com.onore.project.review.service.ReviewService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	PageService page;
	
	@Autowired
	ReviewService review_service;
	
	@GetMapping("/list")
	public String reviewList(HttpServletRequest req) {
		page.service(req);
		
		return "user/review/review_main";
	}
	
	@GetMapping("/write")
	public String reviewWrite(Model model) {
		
		return "user/review/review_write";
	}
	
	@PostMapping("/write")
	public String writeReview(ReviewDTO review) {
		Integer row = review_service.insert(review);
		
		return "redirect:/review/list";
	}
	
	@GetMapping("/detail")
	public String reviewDetail(Model model, Integer review_num) {
		model.addAttribute("contents", review_service.get(review_num));
		
		return "user/review/review_detail";
	}
	
	@GetMapping("/modify")
	public String reviewModify(Model model, Integer review_num) {
		model.addAttribute("contents",review_service.get(review_num));
		
		return "user/review/review_modify";
	}
	
	@PostMapping("/modify")
	public String modifyReview(ReviewDTO rev) {
		Integer row = review_service.modify(rev);
		
		return "redirect:/review/list";
	}
	
	@GetMapping("/delete")
	public String deleteReview(Integer review_num) {
		Integer row = review_service.delete(review_num);
		
		return "redirect:/review/list";
	}
	
	
//	@ResponseBody
//	@GetMapping(value="/detail")
//	public List<CommentDTO> viewComment(Model model, Integer review_num) {
//		List<CommentDTO> comments = review_service.getComment(review_num);
//		
//		return comments;
//	}
}
