package com.onore.project.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class MembersDTO {
	private String mem_id;
	private String mem_pw;
	private String mem_email;
	private String mem_phone;
	private String mem_name;
	private Integer mem_zip_code;
	private String mem_street_address; 
	private String mem_detail_address; 
	private String mem_gender;
	private Date mem_birth_date;
	private Date mem_register_date;
	private Integer mem_point;
	private Integer mem_status;
	private String mem_law1_check;
	private String mem_law2_check;
	private String mem_law3_check;
	private String mem_law4_check;
	private String mem_law5_check;
	private String mem_sms_check;
	private String mem_email_check;
	
	// 관리자 페이지 
	private String search_type;
	private String search_keyword;
	
    private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
	
	public String getCreationBirthDate() {
		   return dateFormat.format(mem_birth_date);		
	}
	
	public String getCreationRegistDate() {
		   return dateFormat.format(mem_register_date);		
	}
}
