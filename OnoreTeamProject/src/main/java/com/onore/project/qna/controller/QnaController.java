package com.onore.project.qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.onore.project.mapper.QnaMapper;
import com.onore.project.qna.dto.Qna;
import com.onore.project.qna.service.QnaService;
import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Log4j2
@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaService qnaService;

	@GetMapping("/main")
	public String qna(Model model) {
		qnaService.QnaList(model);
		
		return "qna/qna_main";
	}


	@GetMapping("/qna_write")
	public String create() {
		
		return "qna/qna_write_form";
	}

	@PostMapping("/qna_addWrite")
	public String addWrite(List<MultipartFile> file, Model model, Qna qna) throws Exception {
		qnaService.fileUpload(qna, file);
		qnaService.QnaWrite(model, qna);
		
		return "redirect:/qna/main";

	}
	
	@GetMapping("/view")
	public String clickView(Model model, int qna_num) {
		qnaService.QnaView(model, qna_num);
		
		return "qna/qna_view";
	}
	
	
}
