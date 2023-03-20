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
	
	// ���̵� �ߺ�üũ
    @RequestMapping("/idCheck")
    public void idCheck(@RequestParam String mem_id, HttpServletResponse res) throws Exception {
        int result = 0;
        if (service.idCheck(mem_id) != 0) {
            result = 1;
        }
        res.getWriter().print(result);
    }
	
	//ȸ�� ���� insert
	@GetMapping("/join")
	public String member_join() throws Exception {
		return "user/join/member_join";
	}
	
	// ȸ������ ����
	@RequestMapping("/join.do")
	public String member_join(MemberDTO dto, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		try {
			mapper.member_join(dto);
			MemberDTO member_join = mapper.signIn(dto);
			
			HttpSession session = request.getSession();
			session.setAttribute("member_join", member_join);
			return "user/join/member_join_success";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "ȸ�������� Ȯ�����ּ���");
		return "redirect:/join";
		}
	}

	// ȸ�� ���� ������ ������ ������
	@PostMapping("/join_success")
	public String member_join_success(Model model, MemberDTO memberdto) throws Exception {	

		// ��й�ȣ ��ȣȭ
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		System.out.println(memberdto.toString());
		String password = scpwd.encode(memberdto.getMem_pw());
		memberdto.setMem_pw(password);
		System.out.println(memberdto.toString());
		// ��й�ȣ ��ȣȭ ��
		
		Integer join = mapper.member_join(memberdto);

		if(join > 0) {
			// ���� ����
			CouponDTO welcome_coupon = new CouponDTO();
			welcome_coupon.setCoupon_name("ȸ������ �̺�Ʈ 10% ���� ����");
			welcome_coupon.setMem_id(memberdto.getMem_id());
			welcome_coupon.setCoupon_discount(0.1);
			Integer coupon_result = service.insertCoupon(welcome_coupon);
			System.out.println("���� ���� ��� : " + coupon_result);
			model.addAttribute("member", join);
		} else {
			return "redirect:/join";
		}
		
		
		
		return "user/join/member_join_success";
	}

	// �α��� ������
	@GetMapping("/login")
	public String login() {
		return "user/login/member_login";
	}
	
	// �α��� �ϱ� - session, ��й�ȣ ��ȣȭ, ���̵� ����ϱ�
	@PostMapping("/signIn.do")
	public String signIn(RedirectAttributes rttr, MemberDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter("mem_id");
		String pw = request.getParameter("mem_pw");
		int result = 0;
		
	    if (id == null || id.isEmpty() || pw == null || pw.isEmpty()) {
	    	rttr.addFlashAttribute("result", result);
	        return "redirect:/login";
	    }
		
		MemberDTO signIn = mapper.signIn(dto); // ���ǰ�
		HttpSession session = request.getSession();
		
		System.out.println("result : " + result);
		System.out.println("id : " + id);
		System.out.println("signIn : " + signIn);
		System.out.println("session : " + session);
		
	    if (signIn != null) {
	    	// ��й�ȣ ��ȣȭ
	        BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
	        boolean pwdMatch = scpwd.matches(dto.getMem_pw(), signIn.getMem_pw());
	        if (pwdMatch) { // ��й�ȣ ��ġ
	            session.setAttribute("signIn", signIn);
	            if ("on".equals(request.getParameter("remember_id_input"))) {
	            	session.setMaxInactiveInterval(60 * 60); // �������� �ð� 60��
	            	
	            	Cookie cookie = new Cookie("saved_id", id);
	            	cookie.setMaxAge(60); // ��Ű ��ȿ�Ⱓ 30��
	            	cookie.setPath("/");
	            	response.addCookie(cookie);
	            } else {
	            	Cookie cookie = new Cookie("saved_id", "");
	            	cookie.setMaxAge(0);
	            	cookie.setPath("/");
	                response.addCookie(cookie);
	            	session.setMaxInactiveInterval(60 * 60); // �������� �ð� 60��
	            }
	            System.out.println(session.getId() + "�α���");
	            return "redirect:/main/";
	        } else { // ��й�ȣ ����ġ
	            result = 1;
	        }
	    } else { // ȸ�� ���� ����
	        result = 1;
	    }
	    
	    session.setAttribute("signIn", null);    
	    rttr.addFlashAttribute("result", result);    
	    return "redirect:/login";
	}
	
	// �α׾ƿ� - session
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("�α׾ƿ�");
		session.invalidate(); // ���̵� ���� ������ ������ ������ ������ �� ����
		return "user/main/onore";
	}
	
	//���̵�/��й�ȣ ã�� ������
	@GetMapping("/member_search")
	public String member_search(HttpServletRequest request, Model model, MemberDTO memberdto) throws Exception {
		return "user/login/member_search";
	}
	
	
	//���̵� ã�� 
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	@ResponseBody
	public String find_id(@RequestParam("mem_name") String name,@RequestParam("mem_email") String email) {
		String result = service.find_id(name, email);
		return result;
	}
	
	// ��й�ȣ ã�� - �̸��� ����
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public void find_pw(@RequestParam("input_mem_id") String mem_id, @RequestParam("input_mem_email2") String mem_email, HttpServletResponse response) throws Exception {
		MemberDTO member = new MemberDTO();
		member.setMem_id(mem_id);
		member.setMem_email(mem_email);
		service.find_pw(response, member);
	}
}