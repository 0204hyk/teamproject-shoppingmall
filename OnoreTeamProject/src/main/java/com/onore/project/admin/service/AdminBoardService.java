package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.dto.QnaAndProductsDTO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.ReviewandProductDTO;

public interface AdminBoardService {
	List<QnaAndProductsDTO> readAllQna(QnaAndProductsDTO qna);
	Integer qnaDeleteService(Integer qna_num);
	List<ReviewandProductDTO> readAllReview(ReviewandProductDTO review);
	Integer reviewDeleteService(Integer review_num);
}
