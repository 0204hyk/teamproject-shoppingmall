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

import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Log4j2
@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaMapper qna_mapper;


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
	public String addWrite(Model model, Qna qna) {
		int row = qna_mapper.qnaWrite(qna);
		log.info(model);
		return "qna/qna_main";

	}

	@GetMapping("/test")
	public String uploadTest() {

		return "home";
	}

	@PostMapping("/upload_ok")
	public String upload(@RequestParam("file") MultipartFile file) {
		String fileRealName = file.getOriginalFilename();
		long size = file.getSize();

		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "/Users/kang/qna_images/";


		/*
			  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
			  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
			  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
			  고유한 랜덤 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);

		File saveFile = new File(uploadFolder + uniqueName + fileExtension);  
		try {
			file.transferTo(saveFile); 
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "home";
	}

}
