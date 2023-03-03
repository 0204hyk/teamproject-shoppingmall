package com.onore.project.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ReviewandProductDTO {
	
	private Integer review_num;
	private Integer product_num;
	private String mem_id;
	private String review_content;
	private LocalDate review_date;
	private Integer review_rating;
	private String review_img_1;
	private String review_img_2;
	private String review_img_3;
	
	private Integer category_num;
	private String product_name;
	private Integer product_price;
	private String product_info;
	private String product_thumbnail; //사진경로 
	private Integer product_views;
	private Integer product_likes;
	

	// id마스킹처리 ex) ${review.maskingName}
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
