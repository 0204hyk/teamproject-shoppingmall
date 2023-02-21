package com.onore.project.member.mapper;

import java.util.List;
import com.onore.project.member.dto.MemberDTO;

public interface MemberMapper {
	
	public List<MemberDTO> getAll();
	
	// 회원가입
	Integer member_join(MemberDTO memberdto) throws Exception;

	/*
	// 로그인 실패한 부분
	MemberDTO mem_login_service(String mem_id) throws Exception;
	*/
	
}
