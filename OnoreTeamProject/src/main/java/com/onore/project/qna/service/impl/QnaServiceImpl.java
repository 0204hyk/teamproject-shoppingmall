package com.onore.project.qna.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
		//String imgPath = "C:\\Users\\K\\git\\teamproject-shoppingmall\\OnoreTeamProject\\src\\main\\webapp\\resources\\qna\\images\\";
		String imgPath = "/Users/kang/git/teamproject-shoppingmall/OnoreTeamProject/src/main/webapp/resources/qna/images/"; // 노트북
		UUID uuid = UUID.randomUUID();
		String fileName1 = uuid + "_" + file.get(0).getOriginalFilename();
		String fileName2 = uuid + "_" + file.get(1).getOriginalFilename();
		String fileName3 = uuid + "_" + file.get(2).getOriginalFilename();
		
		File saveFile1 = new File(imgPath, fileName1);
		File saveFile2 = new File(imgPath, fileName2);
		File saveFile3 = new File(imgPath, fileName3);

		if (!file.get(0).isEmpty()) {
			file.get(0).transferTo(saveFile1);
			qna.setQna_img_1(fileName1);
			qna.setQna_img_path(imgPath);

		} 
		
		if (!file.get(1).isEmpty()) {
			file.get(1).transferTo(saveFile2);
			qna.setQna_img_2(fileName2);
			qna.setQna_img_path(imgPath);

		}
		
		if (!file.get(2).isEmpty()) {
			file.get(2).transferTo(saveFile3);
			qna.setQna_img_3(fileName3);
			qna.setQna_img_path(imgPath);
			
		}
		
	}

	@Override
	public void Page(HttpServletRequest req) {
		String pageStr = req.getParameter("page");

		List<Qna> pages = qna_mapper.getAll();

		int page;
		if (pageStr == null) {
			page = 1;
		} else {
			page= Integer.parseInt(pageStr);
		}

		int page_size = 10;
		int board_size = pages.size();
		int start_index = (page - 1) * page_size;
		int end_index = page * page_size;
		end_index = end_index > board_size ? board_size : end_index;

		System.out.printf("현재 페이지는 %d페이지고, 시작 인덱스는 %d, 마지막 인덱스는 %d 입니다.\n",
				page, start_index, end_index);


		int max_page = board_size % page_size == 0 ? 
				board_size / page_size : board_size / page_size + 1;

		int pagination_size = 5;
		int pagination_start = (page / pagination_size) * pagination_size + 1;
		pagination_start = page % pagination_size == 0 ?
				page - 4 : pagination_start; 
		int pagination_end = (page/ pagination_size + 1) * pagination_size;
		if (page % pagination_size == 0) {
			pagination_end= pagination_end - pagination_size;
		} else {
			pagination_end = pagination_end > max_page ? 
					max_page : pagination_end;
		}

		int next_page = pagination_end + 1;
		int previous_page = pagination_start - 1;



		System.out.printf("현재 페이지는 %d페이지고, 페이지네이션 시작은 %d, 마지막 숫자는 %d 입니다.",
				page, pagination_start, pagination_end);

		req.setAttribute("qnas", pages.subList(start_index, end_index));
		req.setAttribute("pagination_start", pagination_start);
		req.setAttribute("pagination_end", pagination_end);
		req.setAttribute("next_page", next_page);
		req.setAttribute("previous_page", previous_page);


	}
}
