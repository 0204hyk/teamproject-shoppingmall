package com.onore.project.member.controller;

import java.io.PrintWriter;

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

	/*
	// 회원정보수정으로 이동
	@GetMapping("/member_info_modify")
	public String member_info_modify(String mem_id, Model model) throws Exception {
		model.addAttribute("member", mapper.getMember(mem_id)); 
		return "user/mypage/member_info_modify";
	}
	*/
	
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
	public String memberDelete(String mem_id, Model model) throws Exception {
		return "user/mypage/member_delete";
	}

	/*
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
			return "redirect:/main/";
		}
	}
	*/	
	
	/*
	// 회원탈퇴 - 4차시도
	@RequestMapping(value="/memberDelete.do", method = RequestMethod.POST)
	public String memberDelete(MemberDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception{
	    
		MemberDTO member = (MemberDTO) session.getAttribute("signIn");  
	    String sessionPass = member.getMem_pw();  // 세션에 있는 비밀번호 
	    String dtoPass = dto.getMem_pw();  // dto로 들어오는 비밀번호
	    
	    System.out.println("member : " + member);
	    System.out.println("sessionPass : " + sessionPass);
	    System.out.println("dtoPass : " + dtoPass);
	    
	    // 비밀번호가 일치하지 않으면 탈퇴 실패 처리
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	   
	    if(!passwordEncoder.matches(dtoPass, sessionPass)) {
	        String message = "비밀번호가 일치하지 않습니다.";
	        rttr.addAttribute("message", message);
	        return "redirect:/memberDelete";
	    }
	    
	    // 비밀번호가 일치하면 탈퇴 완료 처리
	    service.memberDelete(dto);
	    session.invalidate();

	    String successMessage = "회원탈퇴가 완료되었습니다.";
	    rttr.addAttribute("message", successMessage);
	    
	    return "redirect:/main/";
	}
	*/
	
	// 회원탈퇴 - 수정된 소스코드
	@RequestMapping(value="/memberDelete.do", method = RequestMethod.POST)
	public void memberDelete(MemberDTO dto, HttpSession session, HttpServletResponse response) throws Exception{
	    
		MemberDTO member = (MemberDTO) session.getAttribute("signIn");  
	    String sessionPass = member.getMem_pw();  // 세션에 있는 비밀번호 
	    String dtoPass = dto.getMem_pw();  // dto로 들어오는 비밀번호
	    
	    System.out.println("member : " + member);
	    System.out.println("sessionPass : " + sessionPass);
	    System.out.println("dtoPass : " + dtoPass);
	    
	    // 비밀번호가 일치하지 않으면 탈퇴 실패 처리
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	   
	    if(!passwordEncoder.matches(dtoPass, sessionPass)) {
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
	        out.flush();
	    } else {
	        // 비밀번호가 일치하면 탈퇴 완료 처리
	        service.memberDelete(dto);
	        session.invalidate();
	        
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('회원탈퇴가 완료되었습니다.'); location.href='./main/';</script>");
	        out.flush();
	    }
	}

	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public int passChk(MemberDTO memberdto) throws Exception {
	    String mem_pw = mapper.getMember(memberdto.getMem_id()).getMem_pw();
	    if (mem_pw == null) { // 회원정보 없음
	        return 0;
	    } else {
	        // 비밀번호 일치 여부 확인
	        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	        boolean pwdMatch = passwordEncoder.matches(memberdto.getMem_pw(), mem_pw);
	        if (pwdMatch) { // 비밀번호 일치
	            return 1;
	        } else { // 비밀번호 불일치
	            return -1;
	        }
	    }
	}
	
}