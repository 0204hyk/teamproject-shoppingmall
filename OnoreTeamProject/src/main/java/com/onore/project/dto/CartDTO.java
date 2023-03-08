package com.onore.project.dto;

import lombok.Data;

@Data
public class CartDTO {
	
	private Integer cart_num;
	private Integer product_num;
	private String mem_id;
	private Integer cart_product_qty;
	private String cart_product_option;
}
