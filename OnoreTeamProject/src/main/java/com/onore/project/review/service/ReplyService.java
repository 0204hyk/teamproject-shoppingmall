package com.onore.project.review.service;

import java.util.List;

import com.onore.project.review.dto.CommentDTO;

public interface ReplyService {
	
	List<CommentDTO> getReply(Integer reivew_num);
	
	Integer insertReply(CommentDTO com);
	
	Integer replyModify(CommentDTO com);
	
	Integer replyDelete(Integer comment_num);
}
