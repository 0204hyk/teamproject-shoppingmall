package com.onore.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private Integer review_num;
	private Integer product_num;
	private String mem_id;
	private String review_title;
	private String review_content;
	private Date review_date;
	private Integer review_rating;
	private String review_ima_1;
	private String review_ima_2;
	private String review_ima_3;
}
