package com.onore.project.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.onore.project.member.dto.Member;

public interface MemberMapper {
	
	List<Member> getAll();
	
	Integer memJoin(Member memberdto);
	
	@Select("SELECT * FROM members")
	public List<Member> getList();
	
	@Select("SELECT * FROM members WHERE mem_id=#{id}")
	Member get(Integer mem_id);
	
	@Insert("INSERT INTO member VALUES(#{mem_id}, #{mem_pw}, "
			+ "#{mem_email}, #{mem_phone}, #{mem_name},"
			+ "#{mem_zip_code}, #{mem_street_address},"
			+ "#{mem_detail_address}, #{mem_gender}, #{mem_birth_date},"
			+ "sysdate, 3000, #{mem_sms}")
	Integer add(Member member);

	
}
