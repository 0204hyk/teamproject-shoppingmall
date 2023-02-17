package com.onore.project.qna.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.onore.project.qna.mapper.QnaMapper;
import com.onore.project.qna.service.QnaListService;

@Service
public class QnaListServiceImpl implements QnaListService {
	
	@Autowired
	QnaMapper qna_mapper;
	
	@Override
	public void QnaList(Model model) {
		model.addAttribute("qnaList", qna_mapper.getAll());
	}

}
