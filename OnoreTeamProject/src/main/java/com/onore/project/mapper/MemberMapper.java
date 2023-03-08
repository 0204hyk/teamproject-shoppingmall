package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.CouponDTO;
import com.onore.project.dto.MembersDTO;

public interface MemberMapper {

	Integer updateMemberAddress(MembersDTO member);
	
	MembersDTO getMemberInfo(String mem_id);
	
	List<CouponDTO> getCoupons(String mem_id);
}
