package com.onore.project.dto;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class QnaReplyDTO {
	
	private Integer reply_num;
	private Integer qna_num;
	private String reply_content;
	private LocalDate reply_date;
}