package com.onore.project.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.admin.service.AdminMemberService;
import com.onore.project.dto.MembersDTO;
import com.onore.project.mapper.AdminMembersMapper;

@Service
public class AdminMemberService_impl implements AdminMemberService {
	@Autowired
	AdminMembersMapper mapper;

	@Override
	public List<MembersDTO> readAllMembers(MembersDTO member) {
		return mapper.getAllMembers(member);
	}

	@Override
	public Integer memberDeleteService(String mem_id) {
		return mapper.deleteMember(mem_id);
	}
}
