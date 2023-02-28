package com.onore.project.dto;

import lombok.Data;

@Data
public class ProductsDTO {
	private Integer product_num;
	private Integer category_num;
	private String product_name;
	private Integer product_price;
	private String product_info;
	private String product_thumbnail_1;
	private String product_thumbnail_2;
	private String product_thumbnail_3;
	private Integer product_views;
	private Integer product_likes;
	
}
