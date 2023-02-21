package com.onore.project.member.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.onore.project.member.dto.MemberDTO;
import com.onore.project.member.mapper.MemberMapper;

@Service
@Qualifier("memberservice")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
	// 로그인 하기용
	@Autowired
	private MemberService service;
	
	@Override
	public List<MemberDTO> getAll() {
		
		return null;
	}
	
	@Override
	public Integer member_join(MemberDTO memberdto) throws Exception{
		return mapper.member_join(memberdto);
	}
	
	/*
	 로그인 실패한 부분
	// 로그인 하기
	@Override
	public Integer mem_login_service(MemberDTO memberdto, HttpSession httpSession, String mem_check,
			HttpServletResponse response) throws Exception {
		System.out.println("mem_login_service MeberDTO :" + memberdto); // 로그인객체 확인
		
		String mem_id = memberdto.getMem_id();
		String mem_pw = memberdto.getMem_pw();
		
		mapper = session.getMapper(MemberMapper.class);
		MemberDTO dto = mapper.mem_login_service(mem_id);
		
		System.out.println("UserLoginService dto : " + dto);
		
		// 로그인 결과값
		Integer result = 0;
		
		// 회원 정보가 없을 시
		if (dto == null) {
			result = 0;
			return result;
		}
		
		if (dto != null) {
			if(dto.getMem_id().equals(mem_id) && dto.getMem_pw().equals(mem_pw)) {
				// 쿠키 체크 검사
				Cookie cookie = new Cookie("mem_check", mem_id);
				
				if (mem_check.equals("true")) {
					response.addCookie(cookie);
					System.out.println("쿠키 아이디 저장O");
				} else {
					System.out.println("쿠키 아이디 저장X");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				System.out.println("로그인 단계");
				dto.setMem_pw(""); // 세션 저장하기 전에 비밀번호 가리기
				
				// 세션에 dto 객체 저장
				httpSession.setAttribute("session", dto);
				System.out.println("회원아이디 세션 :" + httpSession.getAttribute("session"));
				
				result = 1;
				
				// 중복 로그인 start
				
				// 접속자 아이디를 세션에 담는다.
				httpSession.setAttribute("mem_id", memberdto.getMem_id());
				
				
			}
		}
		return result;
	}
	*/
}
