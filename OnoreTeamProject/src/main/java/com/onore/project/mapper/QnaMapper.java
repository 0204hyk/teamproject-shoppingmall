package com.onore.project.mapper;

import java.util.List;

import com.onore.project.qna.dto.QnaDTO;

public interface QnaMapper {

	List<QnaDTO> getAll();

	Integer qnaWrite(QnaDTO qna);

	// 제목 클릭 후 화면 출력
	List<QnaDTO> getContents(Integer qna_num);
}
