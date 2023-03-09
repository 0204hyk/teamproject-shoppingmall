package com.onore.project.qna.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.QnaAndProductsDTO;
import com.onore.project.dto.QnaDTO;

public interface QnaService {

	void page(HttpServletRequest req);

	void qnaList(Model model);

	void qnaAll(Model model);
	
	void qnaWrite(Model model, QnaDTO qna);

	void qnaView(Model model, int qna_num);
		
	void qnaReply(Model model, int qna_num);
	
	QnaDTO qnaModifyForm(Integer qna_num);
	
	Integer qnaModifyComple(QnaDTO qna);
	
	Integer qnaDelete(Integer qna_num);
	
	List<ProductsDTO> getProductName(String product_name);
	
	
	void fileUpload(QnaDTO qna, List<MultipartFile> file) throws IllegalStateException, IOException;
}
