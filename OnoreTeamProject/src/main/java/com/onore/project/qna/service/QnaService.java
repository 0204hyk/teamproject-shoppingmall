package com.onore.project.qna.service;

import java.io.IOException;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.qna.dto.Qna;

public interface QnaService {
	
	public void QnaList(Model model);
	
	public void QnaWrite(Model model, Qna qna);
	
	public void QnaView(Model model, int qna_num);
	
	public void fileUpload(Qna qna, List<MultipartFile> file) throws IllegalStateException, IOException;
}
