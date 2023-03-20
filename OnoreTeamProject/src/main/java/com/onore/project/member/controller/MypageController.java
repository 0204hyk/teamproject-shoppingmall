package com.onore.project.member.controller;

import java.io.PrintWriter;
import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	/*
	// 마이페이지로 이동
	@GetMapping("/mypage")
	public String member_mypage(Model model) throws Exception {
			return "user/mypage/member_mypage";
		}
	*/
	
	// 마이페이지로 이동
	@GetMapping("/mypage")
	public String member_mypage(Model model, HttpSession session) throws Exception {
		
		MemberDTO signIn = (MemberDTO) session.getAttribute("signIn");
		
		if (signIn != null) {
			String mem_id = signIn.getMem_id();
			Integer mem_point = service.getMemPoint(mem_id);
			model.addAttribute("mem_point", mem_point);
			
			System.out.println("signIn : " + signIn);
			System.out.println("mem_id : " + mem_id);
			System.out.println("mem_point : " + mem_point);
			System.out.println("model : " + model);
			return "user/mypage/member_mypage";
		} else {
		return "redirect:/login";
		}
	}

	
	// 비밀번호 수정으로 이동
	@GetMapping("/member_pw_modify")
	public String member_pw_modify(String mem_id, Model model) throws Exception {
		return "user/mypage/member_pw_modify";
	}
	
	// 비밀번호수정하기
	@RequestMapping("/memberPwModify")
	public String memberPwModify(Model model, MemberDTO memberdto, HttpSession session) throws Exception {
		// 비밀번호 암호화
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String password = scpwd.encode(memberdto.getMem_pw());
		memberdto.setMem_pw(password);
		// 비밀번호 암호화 끝
		mapper.memberPwModify(memberdto);
		// session.setAttribute("signIn", memberdto); // 세션에 수정된 정보 저장
		model.addAttribute("member", mapper.memberPwModify(memberdto)); 
		System.out.println("비밀번호 수정 성공");
		return "redirect:/mypage";
	}
	
	// 회원정보수정으로 이동
	@GetMapping("/member_info_modify")
	public String member_info_modify(Model model, HttpSession session) throws Exception {
		MemberDTO signIn = (MemberDTO) session.getAttribute("signIn");
			if (signIn != null) {
				String mem_id = signIn.getMem_id();
				model.addAttribute("member", mapper.getMember(mem_id));
				return "user/mypage/member_info_modify";
			} else {
				return "redirect:/login";
		}
	}
	
	// 회원정보수정하기
	@RequestMapping(value = "/memberInfoModify", method=RequestMethod.POST)
	public String memberInfoModify(Model model, MemberDTO memberdto, HttpSession session) throws Exception {
		mapper.memberInfoModify(memberdto);
		session.setAttribute("signIn", memberdto); // 세션에 수정된 정보 저장
		model.addAttribute("member", memberdto);
		return "redirect:/mypage";
	}


	// 회원탈퇴로 이동
	@GetMapping("/memberDelete")
	public String memberDelete(String mem_id, MemberDTO memberdto, Model model) throws Exception {
		
		model.addAttribute("member", memberdto);
		
		return "user/mypage/member_delete";
	}
	
	// 회원탈퇴 -- 2차 수정
	@RequestMapping(value="/memberDeleteDo", method = RequestMethod.POST)
	public String memberDelete(@RequestParam("mem_pw") String mem_pw, HttpSession session, HttpServletResponse response) throws Exception{

	    MemberDTO member = (MemberDTO) session.getAttribute("signIn");
	    String sessionPass = member.getMem_pw(); // 세션에 있는 비밀번호

	    // 입력받은 비밀번호를 암호화하여 비교합니다.
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	    if(!passwordEncoder.matches(mem_pw, sessionPass)) {
	        // 비밀번호가 일치하지 않으면 탈퇴 실패 처리
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='./memberDelete';</script>");
	        out.flush();
	        return null;
	    } else {
	        // coupon 삭제 구문
	        service.memberDeleteCoupon(member.getMem_id());
	        // 회원 삭제 구문
	        service.memberDelete(member);
	        session.invalidate();
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('회원탈퇴가 완료되었습니다.'); location.href='./main/';</script>");
	        out.flush();
	        return null;
	    }
	}
}