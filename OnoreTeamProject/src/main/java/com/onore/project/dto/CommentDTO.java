package com.onore.project.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class CommentDTO {
	
	private Integer comment_num;
	private Integer review_num;
    private String mem_id;
    private String comment_content;
    private LocalDate comment_date;
}
