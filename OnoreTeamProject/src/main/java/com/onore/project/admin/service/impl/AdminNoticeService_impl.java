package com.onore.project.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.admin.service.AdminNoticeService;
import com.onore.project.dto.NoticeDTO;
import com.onore.project.mapper.NoticeMapper;

@Service
public class AdminNoticeService_impl implements AdminNoticeService {
	
	@Autowired
	NoticeMapper noticeMapper;

	@Override
	public Integer noticeWriteService(NoticeDTO notice) {
		return noticeMapper.insertNotice(notice);
	}

	@Override
	public List<NoticeDTO> readAllNotice(NoticeDTO notice) {
		return noticeMapper.getAllNotice(notice);
	}

	@Override
	public NoticeDTO readNotice(Integer notice_num) {
		return noticeMapper.getNotice(notice_num);
	}

	@Override
	public Integer noticeModifyService(NoticeDTO notice) {
		return noticeMapper.updateNotice(notice);
	}

	@Override
	public Integer noticeDeleteService(Integer notice_num) {
		return noticeMapper.deleteNotice(notice_num);
	}
	
}
