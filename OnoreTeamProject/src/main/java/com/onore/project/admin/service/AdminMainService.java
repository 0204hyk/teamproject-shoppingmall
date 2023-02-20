package com.onore.project.admin.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.onore.project.admin.vo.DailySalesVO;
import com.onore.project.admin.vo.WeeklyStatsVO;
import com.onore.project.dto.OrdersDTO;

public interface AdminMainService {
	
	String readDailySalesToChart();
	List<DailySalesVO> readDailySales();
	List<WeeklyStatsVO> readWeeklyStats();
	DailySalesVO readDailySalesTotal();
	WeeklyStatsVO readWeeklyStatsTotal();
	DailySalesVO readSalesThisMonthTotal();
	WeeklyStatsVO readStatsThisMonthTotal();
}
