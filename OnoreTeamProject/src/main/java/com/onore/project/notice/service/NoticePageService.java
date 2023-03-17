package com.onore.project.notice.service;

import javax.servlet.http.HttpServletRequest;

import com.onore.project.dto.NoticeDTO;

public interface NoticePageService {
	
	void service(HttpServletRequest req, NoticeDTO notice);
}
