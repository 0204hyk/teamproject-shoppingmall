package com.onore.project.qna.mapper;

import java.util.List;

import com.onore.project.qna.dto.Qna;

public interface QnaMapper {
	
	List<Qna> getAll();
	
	Integer qnaWrite(Qna qna);
	
	
}
