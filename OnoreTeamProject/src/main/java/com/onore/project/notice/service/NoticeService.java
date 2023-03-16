package com.onore.project.notice.service;

import java.util.List;

import com.onore.project.dto.NoticeDTO;

public interface NoticeService {
	
	List<NoticeDTO> getAllNotice(NoticeDTO notice);
	
	NoticeDTO getNotice(Integer notice_num);
}
