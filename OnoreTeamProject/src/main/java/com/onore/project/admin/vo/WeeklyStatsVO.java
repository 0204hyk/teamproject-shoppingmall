package com.onore.project.admin.vo;

import lombok.Getter;

@Getter
public class WeeklyStatsVO {
	
	// 일별 데이터
	private String day;
	private Integer register_cnt;
	private Integer qna_cnt;
	private Integer review_cnt;
	
	// 주간 통합 데이터
	private Integer register_cnt_total;
	private Integer qna_cnt_total;
	private Integer review_cnt_total;
}
