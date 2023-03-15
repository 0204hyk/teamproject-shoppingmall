package com.onore.project.mapper;

import java.util.List;
import com.onore.project.dto.CommentDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.QnaAndProductsDTO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.QnaReplyDTO;


public interface QnaMapper {

	List<QnaDTO> getAll();
	
	List<QnaAndProductsDTO> getQnaAndProductsAll();
	
	QnaDTO qnaModifyForm(Integer qna_num);
	
	Integer qnaWrite(QnaDTO qna);
	
	Integer insertReply(QnaReplyDTO qna_re);
	
	Integer updateStatus(Integer qna_num);
	
	Integer qnaModifyComple(QnaDTO qna);
	
	Integer qnaDelete(Integer qna_num);
	
	QnaReplyDTO getReply(Integer qna_num);
	

	// 제목 클릭 후 화면 출력
	//List<QnaDTO> getContents(Integer qna_num);
	List<QnaAndProductsDTO> getContents(Integer qna_num);

	
	List<ProductsDTO> getProductName(String product_name);
	
	// 관리자
	List<QnaDTO> getRecentQna();
	List<QnaAndProductsDTO> getSearchQnaList(QnaAndProductsDTO qna);
}
