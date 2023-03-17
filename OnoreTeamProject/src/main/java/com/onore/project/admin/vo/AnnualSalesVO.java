package com.onore.project.admin.vo;

import lombok.Getter;

@Getter
public class AnnualSalesVO {
	
	private String year;
	private Integer annual_sales;
	private Integer annual_sales_cnt;
	
	// 합계
	private String ten_years;
	private Integer annual_sales_total;
	private Integer annual_sales_cnt_total;
	
}
