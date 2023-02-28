package com.onore.project.qna.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Qna {
	
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
	

	
}


