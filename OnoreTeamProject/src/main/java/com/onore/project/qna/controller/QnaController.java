package com.onore.project.qna.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/qna")
public class QnaController {
	
	
	@GetMapping("/main")
	public String qna() {
		log.info("메인에 도달");
		return "qna/qna_main";
	}
	
	@GetMapping("/qna_write")
	public String create() {
		log.info("도달했다.");
		
		return "qna/qna_write_form";
	}
	
	
	
}
