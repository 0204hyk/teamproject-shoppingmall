package com.onore.project.review.service;

import java.util.List;

import com.onore.project.dto.CommentDTO;
import com.onore.project.dto.ReviewDTO;

public interface ReplyService {
	
	List<CommentDTO> getReply(Integer reivew_num);
	
	Integer insertReply(CommentDTO com);
	
	Integer replyModify(CommentDTO com);
	
	Integer replyDelete(Integer comment_num);
	
	Integer cntReply(Integer review_num);
}
