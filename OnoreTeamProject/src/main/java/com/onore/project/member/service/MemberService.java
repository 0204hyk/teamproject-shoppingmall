package com.onore.project.member.service;

import java.util.List;

import com.onore.project.member.dto.MemberDTO;

public interface MemberService {
	
	public List<MemberDTO> getAll();
	
	// 회원가입
	Integer member_join(MemberDTO memberdto) throws Exception;
	
	// 로그인
	MemberDTO signIn(MemberDTO dto) throws Exception;
	
	// 아이디 중복체크
	int idCheck(String mem_id);
}
