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
	private String product_thumbnail_1;
	private Integer product_views;
	private Integer product_likes;
	private String product_detail;
	private String product_thumbnail_2;
	private String product_thumbnail_3;
	
	public String getmaskingName() {

		String firstName = mem_id.substring(0,1);
		String midName = mem_id.substring(1, mem_id.length() - 1);

		String masking = "";
		for(int i = 0; i < midName.length(); ++i) {
			masking += "*";
		}

		String lastName = mem_id.substring(mem_id.length() - 1, mem_id.length());

		String maskingName = firstName + masking + lastName;

		return maskingName;
	}
}