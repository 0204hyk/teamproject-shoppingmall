package com.onore.project.admin.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.onore.project.admin.vo.WeeklyStatsVO;
import com.onore.project.dto.OrdersDTO;

public interface AdminMainService {
	
	String readDailySales();
	List<WeeklyStatsVO> readWeeklyStats();
}
