package com.onore.project.qna.dto;

import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class Qna {
	
	Integer qna_num;
	Integer product_num;
	String mem_id;
	String qna_title;
	String qna_content;
	String qna_date;
	String qna_category;
	String qna_img_path;
	String qna_img_1;
	String qna_img_2;
	String qna_img_3;
	
	public void setRegDate(java.sql.Timestamp qna_date) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		this.qna_date = format.format(qna_date);
	}
	
}


