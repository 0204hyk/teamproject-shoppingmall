package com.onore.project.admin.vo;

import lombok.Getter;

@Getter
public class DailySalesVO {
	
	private String day;
	private Integer daily_sales;
	private Integer daily_sales_cnt;
	
	// �հ�
	private String month;
	private Integer daily_sales_total;
	private Integer sales_cnt_total;

}
