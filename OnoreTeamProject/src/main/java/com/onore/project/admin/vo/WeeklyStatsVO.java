package com.onore.project.admin.vo;

import lombok.Getter;

@Getter
public class WeeklyStatsVO {
	
	private String day;
	private Integer daily_sales;
	private Integer register_cnt;
	private Integer qna_cnt;
	private Integer review_cnt;

}
