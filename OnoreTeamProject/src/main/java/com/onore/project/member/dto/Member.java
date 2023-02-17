package com.onore.project.member.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
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
	private Integer mem_sms;

}
