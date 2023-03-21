package com.onore.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/account")
@Controller
public class AdminAccountController {
	
	@GetMapping("/management")
	public String accountManagement() {
		return "/admin/account/admin_account_management";
	}
	
}
