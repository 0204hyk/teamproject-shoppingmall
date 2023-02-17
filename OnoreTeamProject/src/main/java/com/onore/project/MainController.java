package com.onore.project;

import java.sql.Connection;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.member.dto.Member;
import com.onore.project.member.mapper.MemberMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	MemberMapper mapper;
	
	// 메인 페이지
	@GetMapping("/")
		public String main() {
		
		return "user/main/onore";
	}
	
	// 로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "user/login/member_login";
	}
	
	// 아이디/비밀번호 찾기
	@GetMapping("/member_search")
	public String member_Search() {
		return "user/login/member_search";
	}
	
	// 회원가입
	@GetMapping("/join")
	public String join() {
		return "user/join/member_join";
	}
	
	// 회원가입 성공 페이지
	@PostMapping("/join_success")
	public String joinSuccess(Model model, Member member) {
		
		model.addAttribute("member", mapper.memJoin(member));
	
		return "user/join/member_join_success";
	}
	
}
