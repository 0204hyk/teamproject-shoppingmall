package com.onore.project.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.onore.project.member.dto.MemberDTO;
import com.onore.project.member.mapper.MemberMapper;
import com.onore.project.member.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/main")
public class MemberController { 

	@Autowired
	MemberMapper mapper;

	@Autowired
	MemberService service;

	@Autowired
	MemberDTO memberdto;


	//회원 가입 insert
	@GetMapping("/join")
	public String member_join() throws Exception {
		return "user/join/member_join";
	}

	// 회원 가입 성공시 나오는 페이지
	@PostMapping("/join_success")
	public String member_join(Model model, MemberDTO memberdto) throws Exception {
		model.addAttribute("member", mapper.member_join(memberdto));
		return "user/join/member_join_success";
	}

	// 로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "user/login/member_login";
	}
	
	// 아이디 찾기 페이지
	@GetMapping("/member_search")
	public String member_search() {
		return "user/login/member_search";
	}
	
	/*
	 로그인 실패한 부분
	// 로그인 하기
	@PostMapping(value = "/login")
	@ResponseBody
	public Integer userLoginPass(MemberDTO memberdto, HttpSession httpSession, 
			HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		String mem_check = request.getParameter("remember_id_input");
		
		// 로그인 메서드
		Integer result = service.mem_login_service(memberdto, httpSession, mem_check, response);

		return result;
	}
	*/
}

