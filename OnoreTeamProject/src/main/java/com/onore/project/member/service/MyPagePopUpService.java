package com.onore.project.member.service;

import javax.servlet.http.HttpServletRequest;

public interface MyPagePopUpService {

	void qnaPopUpService(HttpServletRequest req, String mem_id);
	void reviewPopUpService(HttpServletRequest req, String mem_id);
	
}
