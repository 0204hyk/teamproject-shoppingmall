package com.onore.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.onore.project.dto.CommentDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.dto.ReviewandProductDTO;

public interface ReviewMapper {
	
	// 글
	List<ReviewandProductDTO> getAll();
	
	Integer insert(ReviewDTO rev);
	
	ReviewandProductDTO get(Integer review_num);
	
	Integer modify(ReviewDTO rev);
	
	Integer delete(Integer review_num); 
	
	// 댓글
	
	List<CommentDTO> getReplyAll(Integer review_num);
	
	Integer insertReply(CommentDTO com);
	
	Integer replyModify(CommentDTO com);
	
	Integer replyDelete(Integer comment_num);
	
	Integer cntReply(Integer review_num);
	
	// 관리자
	List<ReviewandProductDTO> getRecentReview();
	List<ReviewandProductDTO> getSearchReviewList(ReviewandProductDTO review);
}
