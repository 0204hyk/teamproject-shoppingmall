package com.onore.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.onore.project.dto.CommentDTO;
import com.onore.project.dto.ReviewDTO;

public interface ReviewMapper {
	
	// 글
	
	List<ReviewDTO> getAll();
	
	Integer insert(ReviewDTO rev);
	
	ReviewDTO get(Integer review_num);
	
	Integer modify(ReviewDTO rev);
	
	Integer delete(Integer review_num); 
	
	// 댓글
	
	List<CommentDTO> getReplyAll(Integer review_num);
	
	Integer insertReply(CommentDTO com);
	
	Integer replyModify(CommentDTO com);
	
	Integer replyDelete(Integer comment_num);
}
