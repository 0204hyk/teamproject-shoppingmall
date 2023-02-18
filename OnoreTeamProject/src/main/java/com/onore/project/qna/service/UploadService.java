package com.onore.project.qna.service;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.onore.project.mapper.QnaMapper;
import com.onore.project.qna.dto.Qna;


@Service
public class UploadService {
	
//	@Autowired
//	QnaMapper mapper;
	
//	public void write(Qna qna, MultipartHttpServletRequest request) throws Exception {
//		
//		MultipartFile uploadFile = request.getFile("file");
//		String name = request.getParameter("name");
//		String imgPath = "C:\\Users\\K\\git\\teamproject-shoppingmall\\OnoreTeamProject\\src\\main\\webapp\\resources\\qna\\images\\";
//		UUID uuid = UUID.randomUUID();
//		String fileName = uuid + uploadFile.getOriginalFilename();
//		
//		if (!uploadFile.isEmpty()) {
//			File file = new File(imgPath, fileName);
//			uploadFile.transferTo(file);
//			qna.setQna_img_1(fileName);
//			qna.setQna_img_2(fileName);
//			qna.setQna_img_3(fileName);
//			qna.setQna_img_path(fileName);
//		}
//	}
	
	public void write(Qna qna, List<MultipartFile> file) throws Exception {
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

		//mapper.qnaWrite(qna); 서비스에서 insert도 가능.
		
	}
}
