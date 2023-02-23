package com.onore.project.order.dto;

import lombok.Data;
import lombok.NonNull;

@Data
public class OrderDTO {

	private String order_id;
	private String order_name;
	private String orderer_name;
	private String orderer_phone;
	private String orderer_email;
	private String receiver_name;
	private String receiver_zip_code;
	private String receiver_address;
	private String receiver_detail_address;
	private Integer receiver_phone;
	private String receiver_req;
	private String discount_coupon;
	private Integer discount_points;
	private Integer total_price;
	private Integer total_discount;
	private Integer pay_price;
	private String pay_method;
	private Integer order_status;
	private String order_date;
}
