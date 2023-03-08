package com.onore.project.member.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.onore.project.member.dto.MemberDTO;

public interface MemberMapper {
	
	public List<MemberDTO> getAll();
	
	// 회원가입
	Integer member_join(MemberDTO memberdto) throws Exception;
	
	// 로그인
	MemberDTO signIn(MemberDTO dto) throws Exception;
	
	// 아이디 중복체크
	int idCheck(String mem_id) throws Exception;
	
	// 아이디 찾기
	String find_id(@Param("mem_name") String name, @Param("mem_email") String email);
	
	// 비밀번호 찾기
	//String find_pw(@Param("mem_id") String id, @Param("mem_email") String email);
	public MemberDTO searchPwd(MemberDTO dto);
	
	// 회원정보 불러오기
	 MemberDTO getMember(String memberId) throws Exception;
	 
	 // 회원정보 수정하기
	 Integer memberInfoModify(MemberDTO memberdto) throws Exception;
	 
	 // 비밀번호 수정하기
	 Integer memberPwModify(MemberDTO memberdto) throws Exception;
	 
	 // 회원탈퇴 하기
	 Integer memberDeleteDo(MemberDTO memberdto) throws Exception;

	
	 
}

