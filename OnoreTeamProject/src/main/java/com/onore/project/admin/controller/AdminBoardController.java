package com.onore.project.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.admin.service.AdminBoardService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/board")
@Controller
public class AdminBoardController {
	
	@Autowired
	AdminBoardService service;
	
	@GetMapping("/qna")
	public String qnaList(HttpServletRequest request) {
		request.setAttribute("qnaList", service.readAllQna());
		return "/admin/board/admin_qna_management";
	}
	
	@GetMapping("/review")
	public String reviewList(HttpServletRequest request) {
		request.setAttribute("reviewList", service.readAllReview());
		return "/admin/board/admin_review_management";
	}
	
}
