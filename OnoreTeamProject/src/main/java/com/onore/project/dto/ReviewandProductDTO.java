package com.onore.project.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import lombok.Data;

@Data
public class ReviewandProductDTO {

	private Integer review_num;
	private Integer product_num;
	private String mem_id;
	private String review_content;
	private Date review_date;
	private Integer review_rating;
	private String review_img_path;
	private String review_img_1;
	private String review_img_2;
	private String review_img_3;
	private Integer review_good;
	private Integer review_bad;

	private Integer category_num;
	private String product_name;
	private Integer product_price;
	private String product_info;
	private String product_thumbnail_1;
	private Integer product_views;
	private Integer product_likes;
	private String product_detail;
	private String product_thumbnail_2;
	private String product_thumbnail_3;


	// id마스킹처리 ex) ${review.maskingName}
	public String getmaskingName() {

		String firstName = mem_id.substring(0,1);
		String midName = mem_id.substring(1, mem_id.length() - 1);

		String masking = "";
		for(int i = 0; i < midName.length(); ++i) {
			masking += "*";
		}

		String lastName = mem_id.substring(mem_id.length() - 1, mem_id.length());

		String maskingName = firstName + masking + lastName;

		return maskingName;
	}

	private static SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy.MM.dd");
	private static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

    public String getCreationReviewDate() {
    	LocalDate creationDate = LocalDate.ofInstant(review_date.toInstant(), ZoneId.systemDefault());
	    LocalDate today = LocalDate.ofInstant(new Date().toInstant(), ZoneId.systemDefault());
	    return creationDate.isEqual(today) ?
		 	   timeFormat.format(review_date) : dayFormat.format(review_date);
    }

    // 관리자 페이지에서 사용
    private static SimpleDateFormat adminPageFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public String getAdminPageReviewDate() {
    	return adminPageFormat.format(review_date);
    }

    private String search_type;
    private String search_keyword;
}