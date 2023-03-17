package com.onore.project.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class ProductsDTO {
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
   
   private static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy.MM.dd");
   private static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	
   public String getCreationProductDate() {		
	   LocalDate creationDate = LocalDate.ofInstant(product_date.toInstant(), ZoneId.systemDefault());
	   LocalDate today = LocalDate.ofInstant(new Date().toInstant(), ZoneId.systemDefault());
	   return creationDate.isEqual(today) ? 
			   timeFormat.format(product_date) : dayFormat.format(product_date);		
   }

   private String search_type;
   private String search_keyword;
   
}