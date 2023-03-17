package com.onore.project.review.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.CommentDTO;
import com.onore.project.mapper.ReviewMapper;
import com.onore.project.review.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReviewMapper review_mapper;

	@Override
	public List<CommentDTO> getReply(Integer reivew_num) {

		return review_mapper.getReplyAll(reivew_num);
	}

	@Override
	public Integer insertReply(CommentDTO com) {
		return review_mapper.insertReply(com);
	}

	@Override
	public Integer replyModify(CommentDTO com) {

		return review_mapper.replyModify(com);
	}

	@Override
	public Integer replyDelete(Integer comment_num) {

		return review_mapper.replyDelete(comment_num);
	}

	@Override
	public Integer cntReply(Integer review_num) {

		return review_mapper.cntReply(review_num);
	}
}
