package com.onore.project.dto;

import lombok.Data;

@Data
public class OrderInfoDTO {

	private Integer order_info_num;
	private Integer order_num;
	private Integer product_num;
	private String product_name;
	private Integer order_info_qty;
	private String order_info_option;
	private Integer order_info_price;
	private String ob_date;
}
