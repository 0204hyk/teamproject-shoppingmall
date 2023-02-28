package com.onore.project.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.onore.project.member.dto.MemberDTO;

public interface MemberMapper {
	
	public List<MemberDTO> getAll();
	
	// 회원가입
	Integer member_join(MemberDTO memberdto) throws Exception;
	
	// 로그인
	MemberDTO signIn(MemberDTO dto) throws Exception;
	
	// 아이디 중복체크
	public int idCheck(String mem_id) throws Exception;
}

