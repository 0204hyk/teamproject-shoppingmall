package com.onore.project.qna.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.mapper.QnaMapper;
import com.onore.project.qna.dto.Qna;
import com.onore.project.qna.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	QnaMapper qna_mapper;
	
	@Override
	public void QnaList(Model model) {
		model.addAttribute("qnas", qna_mapper.getAll());
	}
	
	@Override
	public void QnaWrite(Model model, Qna qna) {
		model.addAttribute("qnas", qna_mapper.qnaWrite(qna));
		
	}
	
	@Override
	public void QnaView(Model model, int qna_num) {
		model.addAttribute("views", qna_mapper.getContents(qna_num));
		
	}
	
	@Override
	public void fileUpload(Qna qna, List<MultipartFile> file) throws IllegalStateException, IOException {
		String imgPath = "C:\\Users\\K\\git\\teamproject-shoppingmall\\OnoreTeamProject\\src\\main\\webapp\\resources\\qna\\images\\";
		// String imgPath = "/Users/kang/git/teamproject-shoppingmall/OnoreTeamProject/src/main/webapp/resources/qna/images/"; // 노트북
		UUID uuid = UUID.randomUUID();
		
		String fileName1 = uuid + "_" + file.get(0).getOriginalFilename();
		String fileName2 = uuid + "_" + file.get(1).getOriginalFilename();
		String fileName3 = uuid + "_" + file.get(2).getOriginalFilename();
		
		File saveFile = new File(imgPath, fileName1);
		File saveFile2 = new File(imgPath, fileName2);
		File saveFile3 = new File(imgPath, fileName3);
		
		file.get(0).transferTo(saveFile);
		file.get(1).transferTo(saveFile2);
		file.get(2).transferTo(saveFile3);

		qna.setQna_img_1(fileName1);
		qna.setQna_img_2(fileName2);
		qna.setQna_img_3(fileName3);
		qna.setQna_img_path(imgPath);
		
	}

}
