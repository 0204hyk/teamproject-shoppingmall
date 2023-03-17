package com.onore.project.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String noticeList(HttpServletRequest request, NoticeDTO notice) {
		String search_type = request.getParameter("search_type");
		String search_keyword = request.getParameter("search_keyword");
		
		notice.setSearch_type(search_type);
		notice.setSearch_keyword(search_keyword);			
		
		List<NoticeDTO> noticeList = service.readAllNotice(notice);

		String pageStr = request.getParameter("page");
		
		int page;
				
		if (pageStr == null) {
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}
		
		int board_size = 14;
		int notice_size = noticeList.size();
		int start_index = (page - 1) * board_size;
		int end_index = page * board_size;
		end_index = end_index > notice_size ? notice_size : end_index;
		
		int max_page = notice_size % board_size == 0 ?
				notice_size / board_size : notice_size / board_size + 1;
		
		int page_size = 10;
		int pagination_start;
		int pagination_end;
		
		if (page % 10 == 0) {
			pagination_end = (page / page_size) * page_size; 
		} else {
			pagination_end = (page / page_size + 1) * page_size;
		}
		
		pagination_start = page % page_size == 0 ? 
				page - 9 : (page / page_size) * page_size + 1;
		
		pagination_end = pagination_end > max_page ? max_page : pagination_end;
		
		boolean prevBtn = true;
		boolean nextBtn = true;
		
		if (pagination_start == 1) {
			prevBtn = false;
		}
		
		if (pagination_end == max_page) {
			nextBtn = false;
		}
		
		request.setAttribute("noticeList", noticeList.subList(start_index, end_index));
		request.setAttribute("pagination_start", pagination_start);
		request.setAttribute("pagination_end", pagination_end);
		request.setAttribute("prev", prevBtn);
		request.setAttribute("next", nextBtn);
		request.setAttribute("page", page);
		request.setAttribute("search_type", search_type);
		request.setAttribute("search_keyword", search_keyword);
		
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
