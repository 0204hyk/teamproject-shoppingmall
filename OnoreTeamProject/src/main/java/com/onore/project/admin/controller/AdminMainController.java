package com.onore.project.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onore.project.admin.service.AdminMainService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin")
@Controller
public class AdminMainController {

	@Autowired
	AdminMainService service;
	
	@GetMapping("/main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("weeklyStats", service.readWeeklyStats());
		request.setAttribute("dailySales", service.readDailySales());
		return "/admin/admin_index";
	}
	
}
