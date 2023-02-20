package com.onore.project.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.admin.service.AdminStatsService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/stats")
@Controller
public class AdminStatsController {
	
	@Autowired
	AdminStatsService service;
	
	@GetMapping("/category")
	public String categoryStats() {
		return "/admin/statistics/admin_category_sales";
	}
	
	@GetMapping("/daily")
	public String dailyStats(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("dailySalesToChart", service.readDailySalesToChart());
		request.setAttribute("dailySales", service.readDailySales());
		request.setAttribute("dailySalesTotal", service.readDailySalesTotal());
		return "/admin/statistics/admin_daily_sales";
	}
	
	@GetMapping("/monthly")
	public String monthlyStats() {
		return "/admin/statistics/admin_monthly_sales";
	}
	
	@GetMapping("/annual")
	public String annualStats() {
		return "/admin/statistics/admin_annual_sales";
	}
	
}
