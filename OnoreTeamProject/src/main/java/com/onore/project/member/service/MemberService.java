package com.onore.project.member.service;

import java.util.List;

import com.onore.project.member.dto.CouponDTO;
import com.onore.project.member.dto.MembersDTO;

public interface MemberService {

	MembersDTO getMemberInfo(String mem_id);
	
	List<CouponDTO> getCoupons(String mem_id);
}
