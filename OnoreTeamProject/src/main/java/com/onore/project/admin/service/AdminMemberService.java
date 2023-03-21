package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.dto.MembersDTO;

public interface AdminMemberService {
	List<MembersDTO> readAllMembers(MembersDTO member);
	Integer memberDeleteService(String mem_id);
}
