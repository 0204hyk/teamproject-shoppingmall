package com.onore.project.member.controller;


import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.onore.project.member.mapper.MemberMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	MemberMapper mapper;
	
	// 메인 페이지
	@GetMapping("/")
		public String main() {
		
		return "user/main/onore";
	}

}
