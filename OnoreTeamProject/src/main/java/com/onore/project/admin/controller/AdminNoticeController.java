package com.onore.project.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onore.project.admin.service.AdminNoticeService;
import com.onore.project.dto.NoticeDTO;

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
		if (!request.getParameter("notice_title").equals("") && !request.getParameter("notice_content").equals("")) {
			NoticeDTO notice = new NoticeDTO();
			notice.setNotice_title(request.getParameter("notice_title"));
			notice.setNotice_content(request.getParameter("notice_content"));
			service.noticeWriteService(notice);
		}
		
		return "redirect:/admin/notice/list";
	}
	
	@GetMapping("/list")
	public String noticeList(HttpServletRequest request) {
		request.setAttribute("notices", service.readAllNotice());
		return "/admin/notice/admin_notice_list";
	}
	
	@GetMapping("/modify")
	public String noticeModifyForm(HttpServletRequest request) {
		request.setAttribute("notice", service.readNotice(Integer.parseInt(request.getParameter("notice_num"))));
		return "/admin/notice/admin_notice_modify";
	}
	
	@PostMapping("/modify")
	public String noticeModify(HttpServletRequest request) {
		if (!request.getParameter("notice_title").equals("") && !request.getParameter("notice_content").equals("")) {
			NoticeDTO notice = new NoticeDTO();
			notice.setNotice_num(Integer.parseInt(request.getParameter("notice_num")));
			notice.setNotice_title(request.getParameter("notice_title"));
			notice.setNotice_content(request.getParameter("notice_content"));
			service.noticeModifyService(notice);
		}
		return "redirect:/admin/notice/list";
	}
	
	@PostMapping("/delete")
	public String noticeDelete(@RequestParam(value = "row_check", required = false) String[] row_check) {
		if (row_check != null) {
			for (String notice_num : row_check) {
				service.noticeDeleteService(Integer.parseInt(notice_num));
			}
		}
		return "redirect:/admin/notice/list";
	}
}
