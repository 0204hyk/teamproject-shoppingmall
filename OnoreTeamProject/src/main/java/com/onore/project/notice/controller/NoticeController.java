package com.onore.project.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.dto.NoticeDTO;
import com.onore.project.notice.service.NoticePageService;
import com.onore.project.notice.service.NoticeService;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService notice_service;
	
	@Autowired
	NoticePageService page;
	
	@GetMapping("/main")
	public String notice(HttpServletRequest req, NoticeDTO notice) {
		page.service(req, notice);
		
		return "user/notice/notice_main";
	}
	
	@GetMapping("/detail")
	public String viewNotice(Model model, Integer notice_num) {
		model.addAttribute("notices", notice_service.getNotice(notice_num));
		
		return "user/notice/notice_detail";
	}
}
