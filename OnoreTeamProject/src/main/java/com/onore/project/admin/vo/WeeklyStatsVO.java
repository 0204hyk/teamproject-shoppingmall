package com.onore.project.admin.vo;

import lombok.Getter;

@Getter
public class WeeklyStatsVO {
	
	// �Ϻ� ������
	private String day;
	private Integer register_cnt;
	private Integer qna_cnt;
	private Integer review_cnt;
	
	// �ְ� ���� ������
	private Integer register_cnt_total;
	private Integer qna_cnt_total;
	private Integer review_cnt_total;
}