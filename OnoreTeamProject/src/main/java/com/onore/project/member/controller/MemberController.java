package com.onore.project.member.controller;

import javax.servlet.http.Cookie;
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

import com.onore.project.dto.CouponDTO;
import com.onore.project.dto.MemberDTO;
import com.onore.project.mapper.MemberMapper;
import com.onore.project.member.service.MemberService;

@Controller
public class MemberController { 

	@Autowired
	MemberMapper mapper;

	@Autowired
	MemberService service;

	@Autowired
	MemberDTO memberdto;
	
	// 아이디 중복체크
    @RequestMapping("/idCheck")
    public void idCheck(@RequestParam String mem_id, HttpServletResponse res) throws Exception {
        int result = 0;
        if (service.idCheck(mem_id) != 0) {
            result = 1;
        }
        res.getWriter().print(result);
    }
	
	//회원 가입 insert
	@GetMapping("/join")
	public String member_join() throws Exception {
		return "user/join/member_join";
	}
	
	// 회원가입 성공
	@RequestMapping("/join.do")
	public String member_join(MemberDTO dto, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		try {
			mapper.member_join(dto);
			MemberDTO member_join = mapper.signIn(dto);
			
			HttpSession session = request.getSession();
			session.setAttribute("member_join", member_join);
			return "user/join/member_join_success";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "회원정보를 확인해주세요");
		return "redirect:/join";
		}
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
		
		Integer join = mapper.member_join(memberdto);

		if(join > 0) {
			// 쿠폰 지급
			CouponDTO welcome_coupon = new CouponDTO();
			welcome_coupon.setCoupon_name("회원가입 이벤트 10% 할인 쿠폰");
			welcome_coupon.setMem_id(memberdto.getMem_id());
			welcome_coupon.setCoupon_discount(0.1);
			Integer coupon_result = service.insertCoupon(welcome_coupon);
			System.out.println("쿠폰 지급 결과 : " + coupon_result);
			model.addAttribute("member", join);
		} else {
			return "redirect:/join";
		}
		
		
		
		return "user/join/member_join_success";
	}

	// 로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "user/login/member_login";
	}
	
	// 로그인 하기 - session, 비밀번호 복호화, 아이디 기억하기
	@PostMapping("/signIn.do")
	public String signIn(RedirectAttributes rttr, MemberDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter("mem_id");
		String pw = request.getParameter("mem_pw");
		int result = 0;
		
	    if (id == null || id.isEmpty() || pw == null || pw.isEmpty()) {
	    	rttr.addFlashAttribute("result", result);
	        return "redirect:/login";
	    }
		
		MemberDTO signIn = mapper.signIn(dto); // 세션값
		HttpSession session = request.getSession();
		
		System.out.println("result : " + result);
		System.out.println("id : " + id);
		System.out.println("signIn : " + signIn);
		System.out.println("session : " + session);
		
	    if (signIn != null) {
	    	// 비밀번호 복호화
	        BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
	        boolean pwdMatch = scpwd.matches(dto.getMem_pw(), signIn.getMem_pw());
	        if (pwdMatch) { // 비밀번호 일치
	            session.setAttribute("signIn", signIn);
	            if ("on".equals(request.getParameter("remember_id_input"))) {
	            	session.setMaxInactiveInterval(60 * 60); // 세션유지 시간 60분
	            	
	            	Cookie cookie = new Cookie("saved_id", id);
	            	cookie.setMaxAge(60); // 쿠키 유효기간 30일
	            	cookie.setPath("/");
	            	response.addCookie(cookie);
	            } else {
	            	Cookie cookie = new Cookie("saved_id", "");
	            	cookie.setMaxAge(0);
	            	cookie.setPath("/");
	                response.addCookie(cookie);
	            	session.setMaxInactiveInterval(60 * 60); // 세션유지 시간 60분
	            }
	            System.out.println(session.getId() + "로그인");
	            return "redirect:/main/";
	        } else { // 비밀번호 불일치
	            result = 1;
	        }
	    } else { // 회원 정보 없음
	        result = 1;
	    }
	    
	    session.setAttribute("signIn", null);    
	    rttr.addFlashAttribute("result", result);    
	    return "redirect:/login";
	}
	
	// 로그아웃 - session
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("로그아웃");
		session.invalidate(); // 아이디 값을 제외한 나머지 정보는 접근할 수 없다
		return "user/main/onore";
	}
	
	//아이디/비밀번호 찾기 페이지
	@GetMapping("/member_search")
	public String member_search(HttpServletRequest request, Model model, MemberDTO memberdto) throws Exception {
		return "user/login/member_search";
	}
	
	
	//아이디 찾기 
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	@ResponseBody
	public String find_id(@RequestParam("mem_name") String name,@RequestParam("mem_email") String email) {
		String result = service.find_id(name, email);
		return result;
	}
	
	// 비밀번호 찾기 - 이메일 전송
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public void find_pw(@RequestParam("input_mem_id") String mem_id, @RequestParam("input_mem_email2") String mem_email, HttpServletResponse response) throws Exception {
		MemberDTO member = new MemberDTO();
		member.setMem_id(mem_id);
		member.setMem_email(mem_email);
		service.find_pw(response, member);
	}
}