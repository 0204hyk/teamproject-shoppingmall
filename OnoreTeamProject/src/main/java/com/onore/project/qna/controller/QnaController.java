package com.onore.project.qna.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.qna.dto.Qna;
import com.onore.project.qna.mapper.QnaMapper;
import com.onore.project.qna.service.UploadService;

import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Log4j2
@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaMapper qna_mapper;
	
	@Autowired
	UploadService uploadService;
	

	@GetMapping("/main")
	public String qna(Model model) {
		model.addAttribute("qnas", qna_mapper.getAll());
		return "qna/qna_main";
	}


	@GetMapping("/qna_write")
	public String create() {
		log.info("도달했다.");

		return "qna/qna_write_form";
	}

	@PostMapping("/qna_addWrite")
	public String addWrite(MultipartFile file, Model model, Qna qna) throws Exception {

		uploadService.write(qna, file);
		model.addAttribute("qnas", qna_mapper.qnaWrite(qna));
		
		return "redirect:/qna/main";

	}
	
	@GetMapping("/view")
	public String clickView(Model model, int qna_num) {
		model.addAttribute("views", qna_mapper.getContents(qna_num));
		
		return "qna/qna_view";
	}
	

}
