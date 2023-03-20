package com.onore.project.dto;

import java.util.Date;

import lombok.Data;


@Data
public class ShopDTO {
	   private Integer product_num;
	   private Integer category_num;
	   private String product_name;
	   private Integer product_price;
	   private String product_info;
	   private String product_detail;
	   private String product_thumbnail_1;
	   private String product_thumbnail_2;
	   private String product_thumbnail_3;
	   private Date product_date;
}
