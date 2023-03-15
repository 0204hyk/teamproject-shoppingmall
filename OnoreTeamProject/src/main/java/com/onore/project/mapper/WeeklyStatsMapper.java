package com.onore.project.mapper;

import java.util.List;

import com.onore.project.admin.vo.WeeklyStatsVO;

public interface WeeklyStatsMapper {
	
	List<WeeklyStatsVO> getWeeklyStats();
	WeeklyStatsVO getWeeklyStatsTotal();
	WeeklyStatsVO getStatsMonthTotal();
}
