package com.onore.project.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.CouponDTO;
import com.onore.project.dto.MembersDTO;
import com.onore.project.mapper.MemberMapper;
import com.onore.project.member.service.MemberService;

@Service
public class MemberService_Impl implements MemberService {

	@Autowired
	MemberMapper member_mapper;
	
	@Override
	public Integer updateMemberAddress(MembersDTO member) {
		
		return member_mapper.updateMemberAddress(member);
	}
	
	@Override
	public MembersDTO getMemberInfo(String mem_id) {
		
		return member_mapper.getMemberInfo(mem_id);
	}
	
	@Override
	public List<CouponDTO> getCoupons(String mem_id) {
		
		return member_mapper.getCoupons(mem_id);
	}
}
