package com.onore.project.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.NoticeDTO;
import com.onore.project.mapper.NoticeMapper;
import com.onore.project.notice.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper notice_mapper;
	
	@Override
	public List<NoticeDTO> getAllNotice(NoticeDTO notice) {
		
		return notice_mapper.getAllNotice(notice);
	}

	@Override
	public NoticeDTO getNotice(Integer notice_num) {
		
		return notice_mapper.getNotice(notice_num);
	}

}
