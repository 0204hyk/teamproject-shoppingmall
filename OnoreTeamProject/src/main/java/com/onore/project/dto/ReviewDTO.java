package com.onore.project.dto;


import java.time.LocalDate;
import lombok.Data;

@Data
public class ReviewDTO {

	private Integer review_num;
	private Integer product_num;
	private String mem_id;
	private String review_content;
	private LocalDate review_date;
	private Integer review_rating;
	private String review_img_path;
	private String review_img_1;
	private String review_img_2;
	private String review_img_3;
	private Integer review_good;
	private Integer review_bad;

	
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
