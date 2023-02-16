package com.onore.project.qna.service;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.qna.dto.Qna;
import com.onore.project.qna.mapper.QnaMapper;


@Service
public class UploadService {
	
	@Autowired
	QnaMapper mapper;
	
	public void write(Qna qna, MultipartFile file) throws Exception {
		String imgPath = System.getProperty("user.home") + "//upload";
		UUID uuid = UUID.randomUUID();
		String fileName = uuid + "_" + file.getOriginalFilename();
		
		File saveFile = new File(imgPath, fileName);
		
		file.transferTo(saveFile);
		
		qna.setQna_img_1(fileName);
		
		qna.setQna_img_path("/files/" + fileName);
		
		mapper.qnaWrite(qna);
		
	}
}
