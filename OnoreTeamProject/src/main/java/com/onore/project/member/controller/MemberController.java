package com.onore.project.member.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
import com.onore.project.member.util.MailUtil;

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
	            session.setMaxInactiveInterval(60 * 60 * 24) ; // 세션유지 시간 24시간((60*60)*24)
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
	
	/*
	//비밀번호 찾기 - 성공
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	@ResponseBody
	public String find_pw(@RequestParam("mem_id") String id,@RequestParam("mem_email") String email) {
		
	String result = service.find_pw(id, email);
		
	return result;
	}
	*/
	
	// 임시 비밀번호 이메일 전송 -- 실패
	@PostMapping(value = "/finduserpwd", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String findPw(MemberDTO dto) throws Exception {
		BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
		String result=null;
		
		//회원정보 불러오기
		MemberDTO dto1 = service.searchPwd(dto);
		System.out.println(dto1);
		
		//가입된 이메일이 존재한다면 이메일 전송
		if(dto1!=null) {
			
			//임시 비밀번호 생성(UUID이용)
			String tempPw=UUID.randomUUID().toString().replace("-", "");//-를 제거
			tempPw = tempPw.substring(0,10);//tempPw를 앞에서부터 10자리 잘라줌
			
			dto1.setMem_pw(tempPw);//임시 비밀번호 담기
	
			MailUtil mail=new MailUtil(); //메일 전송하기
			mail.sendEmail(dto1);
			service.updatePwd(dto1);
			String securePw = encoder.encode(dto1.getMem_pw());//회원 비밀번호를 암호화하면 vo객체에 다시 저장
			dto1.setMem_pw(securePw);
			result="true";
		}else {
			result="false";
		}
		return result;
	}
}

