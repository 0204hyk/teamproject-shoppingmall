package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.admin.vo.AnnualSalesVO;
import com.onore.project.admin.vo.DailySalesVO;
import com.onore.project.admin.vo.MonthlySalesVO;

public interface AdminStatsService {
	
	String readDailySalesToChart();
	List<DailySalesVO> readDailySales();
	DailySalesVO readDailySalesTotal();
	
	String readMonthlySalesToChart();
	List<MonthlySalesVO> readMonthlySales();
	MonthlySalesVO readMonthlySalesTotal();
	
	String readAnnualSalesToChart();
	List<AnnualSalesVO> readAnnualSales();
	AnnualSalesVO readAnnualSalesTotal();
}
