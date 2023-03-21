package com.onore.project.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {

	private Integer order_num;
	private String order_id;
	private String order_name;
	private String orderer_id;
	private String orderer_name;
	private String orderer_phone;
	private String orderer_email;
	private String receiver_name;
	private Integer receiver_zip_code;
	private String receiver_address;
	private String receiver_detail_address;
	private String receiver_phone;
	private String receiver_req;
	private String discount_coupon;
	private Integer discount_points;
	private Integer total_price;
	private Integer total_discount;
	private Integer pay_price;
	private String pay_method;
	private Integer order_status;
	private Date order_date;

	private static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy.MM.dd");
	private static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

	public String getCreationDateTime() {		
		LocalDate creationDate = LocalDate.ofInstant(order_date.toInstant(), ZoneId.systemDefault());
		LocalDate today = LocalDate.ofInstant(new Date().toInstant(), ZoneId.systemDefault());
		return creationDate.isEqual(today) ? 
				timeFormat.format(order_date) : dayFormat.format(order_date);		
	}
	
	// 관리자 페이지
	private String search_type;
	private String search_keyword;
}
