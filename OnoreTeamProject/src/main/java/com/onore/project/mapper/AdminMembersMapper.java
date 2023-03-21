package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.MembersDTO;

public interface AdminMembersMapper {
	List<MembersDTO> getAllMembers(MembersDTO member);
	Integer deleteMember(String mem_id);
}
