package com.onore.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrdersDTO {
	private String order_id;
	private String mem_id;
	private String reciever_name;
	private Integer reciever_zip_code;
	private String reciever_street_address;
	private String reciever_detail_address;
	private String reciever_phone;
	private String reciever_req;
	private Date order_date;
	private Integer total_price;
	private Integer order_status;
	
}
