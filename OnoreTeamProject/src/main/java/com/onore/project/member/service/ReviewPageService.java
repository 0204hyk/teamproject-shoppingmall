package com.onore.project.member.service;

import javax.servlet.http.HttpServletRequest;

public interface ReviewPageService {
	
	void service(HttpServletRequest req, String mem_id);
}
