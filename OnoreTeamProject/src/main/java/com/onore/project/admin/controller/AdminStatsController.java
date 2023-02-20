package com.onore.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/stats")
@Controller
public class AdminStatsController {
	
	@GetMapping("/category")
	public String categoryStats() {
		return "/admin/statistics/admin_category_sales";
	}
	
	@GetMapping("/daily")
	public String dailyStats() {
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
