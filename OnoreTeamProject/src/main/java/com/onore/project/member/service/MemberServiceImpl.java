package com.onore.project.member.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.onore.project.member.dto.MemberDTO;
import com.onore.project.member.mapper.MemberMapper;

@Service
@Qualifier("memberservice")
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper mapper;

	@Override
	public List<MemberDTO> getAll() {	
		return null;
	}

	// 회원가입
	@Override
	public Integer member_join(MemberDTO memberdto) throws Exception{
		return mapper.member_join(memberdto);
	}

	// 로그인
	@Override
	public MemberDTO signIn(MemberDTO dto) throws Exception {		
		return mapper.signIn(dto);
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String mem_id) throws Exception {
		return mapper.idCheck(mem_id);
	}

	// 아이디 찾기
	@Override
	public String find_id(String name, String email) {
		String result = "";
		try {
		 result= mapper.find_id(name, email);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result ;
	}


	// 비밀번호 찾기 -- 성공
	@Override
	public String find_pw(String id, String email) {
		String result = "";
		try {
		 result= mapper.find_pw(id, email);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result ;
	}

	
	// 회원정보 상세페이지
	@Override
	public MemberDTO getMember(String memberId) throws Exception {
		return mapper.getMember(memberId);
	}

	// 회원정보 수정하기
	@Override
	public MemberDTO memberInfoModify(MemberDTO memberdto) throws Exception {
		return mapper.memberInfoModify(memberdto);
	}

}
