package com.onore.project.admin.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.admin.service.AdminNoticeService;
import com.onore.project.dto.NoticeDTO;

import lombok.Getter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/notice")
@Controller
public class AdminNoticeController {
	
	@Autowired
	AdminNoticeService service;
	
	@GetMapping("/write")
	public String noticeWriteForm() {
		return "/admin/notice/admin_notice_write";
	}
	
	@PostMapping("/write")
	public String noticeWrite(HttpServletRequest request) {
		NoticeDTO notice = new NoticeDTO();
		notice.setNotice_title(request.getParameter("notice_title"));
		notice.setNotice_content(request.getParameter("notice_content"));
		service.noticeWriteService(notice);
		
		return "redirect:/admin/notice/write";
	}
	
	@GetMapping("/list")
	public String noticeList() {
		return "/admin/notice/admin_notice_list";
	}
}
