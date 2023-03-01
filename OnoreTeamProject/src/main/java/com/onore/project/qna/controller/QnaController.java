package com.onore.project.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.dto.QnaDTO;
import com.onore.project.qna.service.QnaService;

import lombok.extern.log4j.Log4j2;


@Log4j2
@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaService qnaService;

	@GetMapping("/main")
	public String qna(HttpServletRequest req) {

		qnaService.page(req);

		return "user/qna/qna_main";
	}


	@GetMapping("/qna_write")
	public String create() {

		return "user/qna/qna_write_form";
	}

	@PostMapping("/qna_addWrite")
	public String addWrite(List<MultipartFile> file, Model model, QnaDTO qna) throws Exception {

		qnaService.fileUpload(qna, file);
		qnaService.qnaWrite(model, qna);

		return "redirect:/qna/main";

	}

	@GetMapping("/view")
	public String clickView(Model model, int qna_num) {
		qnaService.qnaView(model, qna_num);

		return "user/qna/qna_view";
	}
	
	
	@GetMapping("/qna_modify")
	public String qnaModifyForm(Model model, Integer qna_num) {
		model.addAttribute("qna", qnaService.qnaModifyForm(qna_num));
		return "user/qna/qna_modify";
	}
	
	@PostMapping("/qna_modify")
	public String qnaModifyForm(Model model, QnaDTO qna) {
		
		qnaService.qnaModifyComple(qna);
		
		return "redirect:/qna/qna_view";
		
	}
	
	
	
	@GetMapping("/qnaDelete")
	public String qnaDelete(Model model, Integer qna_num) {
		qnaService.qnaDelete(qna_num);
		
		return "redirect:/qna/main";
		
	}
	

}
