package com.onore.project.member.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@NoArgsConstructor
@RequiredArgsConstructor //-- 13 --
@AllArgsConstructor
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
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public Integer getMem_zip_code() {
		return mem_zip_code;
	}
	public void setMem_zip_code(Integer mem_zip_code) {
		this.mem_zip_code = mem_zip_code;
	}
	public String getMem_street_address() {
		return mem_street_address;
	}
	public void setMem_street_address(String mem_street_address) {
		this.mem_street_address = mem_street_address;
	}
	public String getMem_detail_address() {
		return mem_detail_address;
	}
	public void setMem_detail_address(String mem_detail_address) {
		this.mem_detail_address = mem_detail_address;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public Date getMem_birth_date() {
		return mem_birth_date;
	}
	public void setMem_birth_date(Date mem_birth_date) {
		this.mem_birth_date = mem_birth_date;
	}
	public Date getMem_register_date() {
		return mem_register_date;
	}
	public void setMem_register_date(Date mem_register_date) {
		this.mem_register_date = mem_register_date;
	}
	public Integer getMem_point() {
		return mem_point;
	}
	public void setMem_point(Integer mem_point) {
		this.mem_point = mem_point;
	}
	public Integer getMem_sms() {
		return mem_sms;
	}
	public void setMem_sms(Integer mem_sms) {
		this.mem_sms = mem_sms;
	}
}
