package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.admin.vo.DailySalesVO;
import com.onore.project.admin.vo.WeeklyStatsVO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.ReviewDTO;
import com.onore.project.dto.ReviewandProductDTO;

public interface AdminMainService {
	
	String readDailySalesToChart();
	List<DailySalesVO> readDailySales();
	List<WeeklyStatsVO> readWeeklyStats();
	DailySalesVO readDailySalesTotal();
	WeeklyStatsVO readWeeklyStatsTotal();
	DailySalesVO readSalesThisMonthTotal();
	WeeklyStatsVO readStatsThisMonthTotal();
	List<QnaDTO> readRecentQna();
	List<ReviewandProductDTO> readRecentReview();
}
