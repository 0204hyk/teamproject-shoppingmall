package com.onore.project.dto;

import lombok.Data;

@Data
public class ProductDTO {
	
	private Integer product_num;
	private Integer category_num;
	private String product_name;
	private Integer product_price;
	private String product_info;
	private String product_thumbnail; //사진경로 
	private Integer product_views;
	private Integer product_likes;
	
	
}
