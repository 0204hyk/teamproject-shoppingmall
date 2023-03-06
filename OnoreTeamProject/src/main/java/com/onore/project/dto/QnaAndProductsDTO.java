package com.onore.project.dto;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QnaAndProductsDTO {

	private Integer qna_num;
	private Integer product_num;
	private String mem_id;
	private String qna_title;
	private String qna_content;
	private LocalDate qna_date;
	private String qna_category;
	private String qna_img_path; // 파일 경로
	private String qna_img_1; // 파일 이름
	private String qna_img_2;
	private String qna_img_3;
	private Integer qna_status;
	private Integer category_num;
	private String product_name;
	private Integer product_price;
	private String product_info;
	private String product_path;
	private String product_thumbnail;
	private Integer product_views;
	private Integer product_likes;
	
	
}