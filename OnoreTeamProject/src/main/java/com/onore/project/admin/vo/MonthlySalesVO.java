package com.onore.project.admin.vo;

import lombok.Getter;

@Getter
public class MonthlySalesVO {
	
	private String month;
	private Integer monthly_sales;
	private Integer monthly_sales_cnt;
	
	// 합계
	private String year;
	private Integer monthly_sales_total;
	private Integer monthly_sales_cnt_total;
	
}
