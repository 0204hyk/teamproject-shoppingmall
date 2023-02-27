package com.onore.project.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.onore.project.member.dto.MemberDTO;
import com.onore.project.member.mapper.MemberMapper;
import com.onore.project.member.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController { 

	@Autowired
	MemberMapper mapper;

	@Autowired
	MemberService service;

	@Autowired
	MemberDTO memberdto;
	
	// 아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("mem_id") String mem_id) {
		int cnt = service.idCheck(mem_id);
		return cnt;
	}
	
	//회원 가입 insert
	@GetMapping("/join")
	public String member_join() throws Exception {
		return "user/join/member_join";
	}

	// 회원가입하면 자동 로그인
	@RequestMapping("/join.do")
	public String member_join(MemberDTO dto, HttpServletRequest request) throws Exception {
		mapper.member_join(dto);
		MemberDTO member_join = mapper.signIn(dto);
		HttpSession session = request.getSession();
		session.setAttribute("member_join", member_join);
		return "user/join/member_join_success";
	}

	// 회원 가입 성공시 나오는 페이지
	@PostMapping("/join_success")
	public String member_join_success(Model model, MemberDTO memberdto) throws Exception {	

		// 비밀번호 암호화
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		System.out.println(memberdto.toString());
		String password = scpwd.encode(memberdto.getMem_pw());
		memberdto.setMem_pw(password);
		System.out.println(memberdto.toString());
		// 비밀번호 암호화 끝
		
		model.addAttribute("member", mapper.member_join(memberdto));
		
		return "user/join/member_join_success";
	}

	// 로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "user/login/member_login";
	}
	
	// 로그인 하기 - session, 비밀번호 복호화
	@PostMapping("/signIn.do")
	public String signIn(RedirectAttributes rttr, MemberDTO dto, HttpServletRequest request) throws Exception {

		String id = request.getParameter("mem_id");
		
		MemberDTO signIn = mapper.signIn(dto);
		HttpSession session = request.getSession();
		
		// 비밀번호 복호화
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String pw = request.getParameter("mem_pw");
		boolean pwdMatch = scpwd.matches(dto.getMem_pw(), signIn.getMem_pw());
		// 비밀번호 복호화 끝
		
		if (signIn != null && pwdMatch == true) {
			session.setAttribute("signIn", signIn);	
			session.setMaxInactiveInterval(20) ; // 세션유지 시간 24시간((60*60)*24)
			System.out.println(session.getId() + "로그인");
			return "redirect:/main/";
		} else {
			session.setAttribute("signIn", null);
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/login";
		} 
	}
	
	// 로그아웃 - session
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("로그아웃");
		session.invalidate(); // 아이디 값을 제외한 나머지 정보는 접근할 수 없다
		return "user/main/onore";
	}
	
	//회원 가입 insert
	@GetMapping("/member_search")
	public String member_search() throws Exception {
		return "user/login/member_search";
	}

}

