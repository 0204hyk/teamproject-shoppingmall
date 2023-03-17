package com.onore.project.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onore.project.admin.service.AdminMainService;
import com.onore.project.admin.vo.DailySalesVO;
import com.onore.project.admin.vo.WeeklyStatsVO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.dto.ReviewandProductDTO;
import com.onore.project.mapper.DailySalesMapper;
import com.onore.project.mapper.QnaMapper;
import com.onore.project.mapper.ReviewMapper;
import com.onore.project.mapper.WeeklyStatsMapper;

@Service
public class AdminMainService_impl implements AdminMainService {

	@Autowired
	DailySalesMapper dailySalesMapper;
	
	@Autowired
	WeeklyStatsMapper weeklyStatsMapper;
	
	@Autowired
	QnaMapper qnaMapper;
	
	@Autowired
	ReviewMapper reviewMapper;
	
	@Override
	public String readDailySalesToChart() {
		List<DailySalesVO> salesList = dailySalesMapper.getSalesThisWeek();
		ObjectMapper objMapper = new ObjectMapper();
		
		try {
			String jsonStr = objMapper.writeValueAsString(salesList);
			return jsonStr;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	@Override
	public List<DailySalesVO> readDailySales() {
		return dailySalesMapper.getSalesThisWeek();
	}

	@Override
	public List<WeeklyStatsVO> readWeeklyStats() {
		return weeklyStatsMapper.getWeeklyStats();
	}

	@Override
	public DailySalesVO readDailySalesTotal() {
		return dailySalesMapper.getSalesThisWeekTotal();
	}

	@Override
	public WeeklyStatsVO readWeeklyStatsTotal() {
		return weeklyStatsMapper.getWeeklyStatsTotal();
	}

	@Override
	public DailySalesVO readSalesThisMonthTotal() {
		return dailySalesMapper.getSalesThisMonthTotal();
	}

	@Override
	public WeeklyStatsVO readStatsThisMonthTotal() {
		return weeklyStatsMapper.getStatsMonthTotal();
	}

	@Override
	public List<QnaDTO> readRecentQna() {
		return qnaMapper.getRecentQna();
	}

	@Override
	public List<ReviewandProductDTO> readRecentReview() {
		return reviewMapper.getRecentReview();
	}
	
	
}
