package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.dto.QnaAndProductsDTO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.ReviewandProductDTO;

public interface AdminBoardService {
	List<QnaAndProductsDTO> readAllQna();
	Integer qnaDeleteService(Integer qna_num);
	List<ReviewandProductDTO> readAllReview();
	Integer reviewDeleteService(Integer review_num);
}
