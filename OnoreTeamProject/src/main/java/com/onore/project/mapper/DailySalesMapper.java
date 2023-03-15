package com.onore.project.mapper;

import java.util.List;

import com.onore.project.admin.vo.DailySalesVO;
import com.onore.project.admin.vo.WeeklyStatsVO;

public interface DailySalesMapper {
	
	List<DailySalesVO> getSalesThisWeek();
	DailySalesVO getSalesThisWeekTotal();
	
	List<DailySalesVO> getSalesThisMonth();
	DailySalesVO getSalesThisMonthTotal();

}
