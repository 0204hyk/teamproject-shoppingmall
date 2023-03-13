package com.onore.project.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.dto.MemberDTO;
import com.onore.project.mapper.MemberMapper;
import com.onore.project.member.service.MemberService;


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

	// 비밀번호 수정으로 이동
	@GetMapping("/member_pw_modify")
	public String member_pw_modify(String mem_id, Model model) throws Exception {
		return "user/mypage/member_pw_modify";
	}

	// 회원정보수정으로 이동
	@GetMapping("/member_info_modify")
	public String member_info_modify(String mem_id, Model model) throws Exception {
		return "user/mypage/member_info_modify";
	}

	// 회원정보수정하기
	@RequestMapping("/memberInfoModify")
	public String memberInfoModify(Model model, MemberDTO memberdto) throws Exception { 
		mapper.memberInfoModify(memberdto);
		return "redirect:/mypage";
	}

	// 비밀번호수정하기
	@RequestMapping("/memberPwModify")
	public String memberPwModify(Model model, MemberDTO memberdto) throws Exception {
		// 비밀번호 암호화
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String password = scpwd.encode(memberdto.getMem_pw());
		memberdto.setMem_pw(password);
		// 비밀번호 암호화 끝
		mapper.memberPwModify(memberdto);
		
		model.addAttribute("member", mapper.memberPwModify(memberdto)); 
		System.out.println("비밀번호 수정 성공");
		return "redirect:/mypage";
	}

	// 회원탈퇴로 이동
	@GetMapping("/memberDelete")
	public String memberDelete(String mem_id, Model model) throws Exception {
		return "user/mypage/member_delete";
	}

	// 회원탈퇴하기
	@RequestMapping("/memberDelete.do")
	public String memberDeleteDo(MemberDTO dto, HttpSession session) throws Exception {

		System.out.println("회원탈퇴 결과");

		MemberDTO member = (MemberDTO) session.getAttribute("signIn");
		String mem_pw = member.getMem_pw();
		String pw = dto.getMem_pw();

		System.out.println("mem_pw : " + mem_pw);
		System.out.println("pw : " + pw);

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean isPasswordMatched = encoder.matches(pw, mem_pw);

		if (!isPasswordMatched) {
			return "redirect:/member_delete";
		} else {
			int result = mapper.memberDeleteDo(member);
			System.out.println("탈퇴 result : " + result);

			if (result != 0) {
				System.out.println("탈퇴 성공");
			} else {
				System.out.println("탈퇴 실패");
			}
			
			session.invalidate();
			return "redirect:/user/main/onore";
		}
	}
}