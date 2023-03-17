package com.onore.project.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.onore.project.dto.QnaDTO;

public interface MyPagePaginationService {
	
	
	void qnaPage(HttpServletRequest req, String mem_id);

}
