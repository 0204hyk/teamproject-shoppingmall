package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.dto.NoticeDTO;

public interface AdminNoticeService {
	
	Integer noticeWriteService(NoticeDTO notice);
	List<NoticeDTO> readAllNotice(NoticeDTO notice);
	NoticeDTO readNotice(Integer notice_num);
	Integer noticeModifyService(NoticeDTO notice);
	Integer noticeDeleteService(Integer notice_num);
}
