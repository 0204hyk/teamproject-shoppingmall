package com.onore.project.dto;

import lombok.Data;

@Data
public class CouponDTO {

	Integer coupon_num;
	String coupon_name;
	String mem_id;
	Double coupon_discount;
}
