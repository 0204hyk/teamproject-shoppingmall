package com.onore.project.mapper;

import java.util.List;

import com.onore.project.qna.dto.Qna;

public interface QnaMapper {

	List<Qna> getAll();

	Integer qnaWrite(Qna qna);

	// 제목 클릭 후 화면 출력
	List<Qna> getContents(Integer qna_num);
}
