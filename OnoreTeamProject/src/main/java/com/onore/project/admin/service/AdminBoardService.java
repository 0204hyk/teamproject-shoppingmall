package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.dto.QnaAndProductsDTO;
import com.onore.project.dto.ReviewandProductDTO;

public interface AdminBoardService {
	List<QnaAndProductsDTO> readAllQna();
	List<ReviewandProductDTO> readAllReview();
}
