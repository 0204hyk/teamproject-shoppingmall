package com.onore.project.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onore.project.admin.service.AdminMainService;
import com.onore.project.admin.vo.WeeklyStatsVO;
import com.onore.project.mapper.WeeklyStatsMapper;

@Service
public class AdminMainService_impl implements AdminMainService {

	@Autowired
	WeeklyStatsMapper weeklyStatsMapper;
	
	@Override
	public String readDailySales() {
		List<WeeklyStatsVO> orderList = weeklyStatsMapper.getWeeklyStats();
		ObjectMapper objMapper = new ObjectMapper();
		
		try {
			String jsonStr = objMapper.writeValueAsString(orderList);
			return jsonStr;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}		
	}

	@Override
	public List<WeeklyStatsVO> readWeeklyStats() {
		return weeklyStatsMapper.getWeeklyStats();
	}
	
	
	
}
