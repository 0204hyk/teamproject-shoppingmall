package com.onore.project.mapper;

import java.util.List;

import com.onore.project.admin.vo.DailySalesVO;

public interface DailySalesMapper {

	List<DailySalesVO> getSalesThisWeek();
	DailySalesVO getSalesThisWeekTotal();

	List<DailySalesVO> getSalesThisMonth();
	DailySalesVO getSalesThisMonthTotal();

}
