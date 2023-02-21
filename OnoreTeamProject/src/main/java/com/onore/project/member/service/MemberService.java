package com.onore.project.member.service;

import java.util.List;
import com.onore.project.member.dto.MemberDTO;

public interface MemberService {
	
	public List<MemberDTO> getAll();
	
	// 회원가입
	public Integer member_join(MemberDTO memberdto) throws Exception;
	
	/*
	// 로그인 실패 부분
	// 로그인 하기
	public Integer mem_login_service(MemberDTO memberdto, HttpSession httpSession, String mem_check,
			HttpServletResponse response) throws Exception;
	*/

}
