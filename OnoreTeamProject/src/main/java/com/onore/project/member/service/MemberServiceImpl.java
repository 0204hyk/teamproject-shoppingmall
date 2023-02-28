package com.onore.project.member.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
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
}
