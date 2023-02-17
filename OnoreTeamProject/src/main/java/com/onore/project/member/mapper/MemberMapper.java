package com.onore.project.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.onore.project.member.dto.Member;

public interface MemberMapper {
	
	List<Member> getAll();
	
	Integer memJoin(Member memberdto);
	
	// Object get(String mem_id);
	
	
}
