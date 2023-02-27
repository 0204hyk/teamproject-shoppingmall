package com.onore.project.dto;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import lombok.Data;

@Data
public class ReviewDTO {

	private Integer review_num;
	private Integer product_num;
	private String mem_id;
	private String review_content;
	private LocalDate review_date;
	private Integer review_rating;
	private String review_img_1;
	private String review_img_2;
	private String review_img_3;

//	public void setDate() {
//		SimpleDateFormat dayformat = new SimpleDateFormat("yyyy-MM-dd");
//		
//		this.review_date = dayformat.format(review_date);
//	}
}
