package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.admin.vo.DailySalesVO;

public interface AdminStatsService {
	
	String readDailySalesToChart();
	List<DailySalesVO> readDailySales();
	DailySalesVO readDailySalesTotal();
}
