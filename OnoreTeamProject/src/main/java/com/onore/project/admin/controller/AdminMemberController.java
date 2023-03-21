package com.onore.project.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onore.project.admin.service.AdminMemberService;
import com.onore.project.dto.MembersDTO;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/member")
@Controller
public class AdminMemberController {
	
	@Autowired
	AdminMemberService service;
	
	
	@GetMapping("/list")
	public String memberList(HttpServletRequest request, MembersDTO member) {
		String search_type = request.getParameter("search_type");
		String search_keyword = request.getParameter("search_keyword");
		
		member.setSearch_type(search_type);
		member.setSearch_keyword(search_keyword);			
		
		List<MembersDTO> memberList = service.readAllMembers(member);

		String pageStr = request.getParameter("page");
		
		int page;
				
		if (pageStr == null) {
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}
		
		int board_size = 7;
		int member_size = memberList.size();
		int start_index = (page - 1) * board_size;
		int end_index = page * board_size;
		end_index = end_index > member_size ? member_size : end_index;
		
		int max_page = member_size % board_size == 0 ?
				member_size / board_size : member_size / board_size + 1;
		
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
		
		request.setAttribute("memberList", memberList.subList(start_index, end_index));
		request.setAttribute("pagination_start", pagination_start);
		request.setAttribute("pagination_end", pagination_end);
		request.setAttribute("prev", prevBtn);
		request.setAttribute("next", nextBtn);
		request.setAttribute("page", page);
		request.setAttribute("search_type", search_type);
		request.setAttribute("search_keyword", search_keyword);
		
		return "/admin/member/admin_member_list";
	}
	
	@PostMapping("/delete")
	public String noticeDelete(@RequestParam(value = "row_check", required = false) String[] row_check) {
		if (row_check != null) {
			for (String mem_id : row_check) {
				service.memberDeleteService(mem_id);
			}
		}
		return "redirect:/admin/member/list";
	}

	
}
