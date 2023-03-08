package com.onore.project.member.service;

import java.util.List;

import com.onore.project.dto.CouponDTO;
import com.onore.project.dto.MembersDTO;

public interface MemberService {

	Integer updateMemberAddress(MembersDTO member);
	
	MembersDTO getMemberInfo(String mem_id);
	
	List<CouponDTO> getCoupons(String mem_id);
}
