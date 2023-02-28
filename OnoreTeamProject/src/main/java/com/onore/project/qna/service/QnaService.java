package com.onore.project.qna.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.qna.dto.Qna;

public interface QnaService {

	void Page(HttpServletRequest req);

	void QnaList(Model model);

	void QnaWrite(Model model, Qna qna);

	void QnaView(Model model, int qna_num);

	void fileUpload(Qna qna, List<MultipartFile> file) throws IllegalStateException, IOException;
}
