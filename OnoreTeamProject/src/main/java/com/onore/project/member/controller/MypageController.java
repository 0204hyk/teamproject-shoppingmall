package com.onore.project.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.onore.project.member.dto.MemberDTO;
import com.onore.project.member.mapper.MemberMapper;
import com.onore.project.member.service.MemberService;

import jdk.internal.org.jline.utils.Log;


@Controller
public class MypageController {
	
	@Autowired
	MemberMapper mapper;

	@Autowired
	MemberService service;

	@Autowired
	MemberDTO memberdto;

	// 마이페이지로 이동
	@GetMapping("/mypage")
	public String member_mypage() throws Exception {
		return "user/mypage/member_mypage";
	}
	
	// 회원정보수정으로 이동
	@GetMapping("/member_info_modify")
	public String member_info_modify(String mem_id, Model model) throws Exception {
		return "user/mypage/member_info_modify";
	}

	// 회원정보수정하기
    @RequestMapping("/memberInfoModify")
    public String memberInfoModify(Model model, MemberDTO memberdto) throws Exception {
		// 비밀번호 암호화
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String password = scpwd.encode(memberdto.getMem_pw());
		memberdto.setMem_pw(password);
		// 비밀번호 암호화 끝
		model.addAttribute("member", mapper.memberInfoModify(memberdto));  		
    	return "user/mypage/member_mypage";
    	
    }
}
