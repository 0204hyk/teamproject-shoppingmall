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
	
//	@Autowired
//	QnaMapper mapper;
	
	public void write(Qna qna, MultipartFile file1, MultipartFile file2,
		MultipartFile file3) throws Exception {
		String imgPath = "/Users/kang/git/teamproject-shoppingmall/OnoreTeamProject/src/main/webapp/resources/qna/images/";
		UUID uuid = UUID.randomUUID();
		
		String fileName1 = uuid + "_" + file1.getOriginalFilename();
		String fileName2 = uuid + "_" + file2.getOriginalFilename();
		String fileName3 = uuid + "_" + file3.getOriginalFilename();
		
		File saveFile = new File(imgPath, fileName1);
		File saveFile2 = new File(imgPath, fileName2);
		File saveFile3 = new File(imgPath, fileName3);
		
		file1.transferTo(saveFile);
		file2.transferTo(saveFile2);
		file3.transferTo(saveFile3);
		
		qna.setQna_img_1(fileName1);
		qna.setQna_img_2(fileName2);
		qna.setQna_img_3(fileName3);
		qna.setQna_img_path(fileName1);
		qna.setQna_img_path(fileName2);
		qna.setQna_img_path(fileName3);
		//mapper.qnaWrite(qna);
		
	}
}
