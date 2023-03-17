package com.onore.project.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onore.project.admin.service.AdminStatsService;
import com.onore.project.admin.vo.AnnualSalesVO;
import com.onore.project.admin.vo.DailySalesVO;
import com.onore.project.admin.vo.MonthlySalesVO;
import com.onore.project.mapper.AnnualSalesMapper;
import com.onore.project.mapper.DailySalesMapper;
import com.onore.project.mapper.MonthlySalesMapper;

@Service
public class AdminStatsService_impl implements AdminStatsService{
	
	@Autowired
	DailySalesMapper dailySalesMapper;
	
	@Autowired
	MonthlySalesMapper monthlySalesMapper;
	
	@Autowired
	AnnualSalesMapper annualSalesMapper;
	
	@Override
	public String readDailySalesToChart() {
		List<DailySalesVO> salesList = dailySalesMapper.getSalesThisMonth();
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
		return dailySalesMapper.getSalesThisMonth();
	}

	@Override
	public DailySalesVO readDailySalesTotal() {
		return dailySalesMapper.getSalesThisMonthTotal();
	}

	@Override
	public String readMonthlySalesToChart() {
		List<MonthlySalesVO> salesList = monthlySalesMapper.getMonthlySales();
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
	public List<MonthlySalesVO> readMonthlySales() {
		return monthlySalesMapper.getMonthlySales();
	}

	@Override
	public MonthlySalesVO readMonthlySalesTotal() {
		return monthlySalesMapper.getMonthlySalesTotal();
	}

	@Override
	public String readAnnualSalesToChart() {
		List<AnnualSalesVO> salesList = annualSalesMapper.getAnnualSales();
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
	public List<AnnualSalesVO> readAnnualSales() {
		return annualSalesMapper.getAnnualSales();
	}

	@Override
	public AnnualSalesVO readAnnualSalesTotal() {
		return annualSalesMapper.getAnnualSalesTotal();
	}

}
