package com.onore.project.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.dto.CommentDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.review.service.PageService;
import com.onore.project.review.service.ReplyService;
import com.onore.project.review.service.ReviewService;
import com.onore.project.shop.service.ShopService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	PageService page;
	
	@Autowired
	ReviewService review_service;
	
	@Autowired
	ReplyService reply_service;
	
	@Autowired
	ShopService shopService;
	
	@GetMapping("/list")
	public String reviewList(HttpServletRequest req) {
		page.service(req);
		
		return "user/review/review_main";
	}
	
	@GetMapping("/write")
	public String reviewWrite(Model model, Integer product_num) {
		model.addAttribute("product", shopService.getDetail(product_num));
		
		return "user/review/review_write";
	}
	
	@PostMapping("/write")
	public String writeReview(List<MultipartFile> file, Model model, ReviewDTO review) throws IllegalStateException, IOException {
		review_service.fileUpload(review, file);
		review_service.insert(model, review);
		
		return "redirect:/review/list";
	}
	
	@GetMapping("/detail")
	public String reviewDetail(Model model, Integer review_num) {
		model.addAttribute("contents", review_service.get(review_num));
		model.addAttribute("comments", reply_service.getReply(review_num));
		model.addAttribute("cnt", reply_service.cntReply(review_num));
		
		return "user/review/review_detail";
	}
	
	@GetMapping("/modify")
	public String reviewModify(Model model, Integer review_num, Integer product_num) {
		model.addAttribute("product", shopService.getDetail(product_num));
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
	
	@ResponseBody
	@GetMapping("/replyList/{num}")
	public List<CommentDTO> replyList(@PathVariable("num")Integer review_num) {
		List<CommentDTO> reply = reply_service.getReply(review_num);
		
		return reply;
	}
	
	@ResponseBody
	@PostMapping(value="/comment")
	public CommentDTO createComment(@RequestBody CommentDTO comment) {
		reply_service.insertReply(comment);
		
		return comment;
	}
	
	@ResponseBody
	@PostMapping(value="/com_modify")
	public String modfiyReply(@RequestBody CommentDTO com, Integer review_num) {
		Integer row = reply_service.replyModify(com);
		
		return "redirect:/review/detail?review_num=" + review_num;
	}
	
	@ResponseBody
	@GetMapping("/com_delete/{num}")
	public String deleteReply(@PathVariable("num")Integer comment_num, Integer review_num) {
		Integer row = reply_service.replyDelete(comment_num);
		
		return "redirect:/review/detail?review_num=" + review_num;
	}
	

	
}
