package com.onore.project.qna.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.QnaAndProductsDTO;
import com.onore.project.dto.QnaDTO;
import com.onore.project.dto.QnaReplyDTO;
import com.onore.project.dto.ShopDTO;
import com.onore.project.mapper.QnaMapper;
import com.onore.project.qna.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaMapper qna_mapper;

	@Override
	public void qnaList(Model model) {
		model.addAttribute("qnas", qna_mapper.getQnaAndProductsAll());

	}

	@Override
	public void qnaWrite(Model model, QnaDTO qna) {
		model.addAttribute("qnas", qna_mapper.qnaWrite(qna));

	}

	@Override
	public void qnaReplyWrite(Model model, QnaReplyDTO reply) {
		model.addAttribute("reply", qna_mapper.insertReply(reply));

	}

	@Override
	public Integer qnaUpdateStatus(Integer qna_num) {

		return qna_mapper.updateStatus(qna_num);
	}

	@Override
	public void qnaView(Model model, int qna_num) {
		model.addAttribute("views", qna_mapper.getContents(qna_num));

	}

	@Override
	public void qnaReply(Model model, int qna_num) {

		model.addAttribute("replys", qna_mapper.getReply(qna_num));
	}


	@Override
	public QnaDTO qnaModifyForm(Integer qna_num) {

		return qna_mapper.qnaModifyForm(qna_num);
	}

	@Override
	public Integer qnaModifyComple(QnaDTO qna) {

		return qna_mapper.qnaModifyComple(qna);
	}

	@Override
	public Integer qnaDelete(Integer qna_num) {

		return qna_mapper.qnaDelete(qna_num);
	}

	@Override
	public List<ShopDTO> getProductName(String product_name) {

		return qna_mapper.getProductName(product_name);
	}

	@Override
	public void fileUpload(QnaDTO qna, List<MultipartFile> file) throws IllegalStateException, IOException {
		//String imgPath = "C:\\Users\\K\\git\\teamproject-shoppingmall\\OnoreTeamProject\\src\\main\\webapp\\resources\\qna\\images\\";
		
		// 서버 경로
		String imgPath = "/opt/tomcat/apache-tomcat-9.0.73/webapps/OnoreTeamProject/resources/qna/images/";
		UUID uuid = UUID.randomUUID();
		String[] fileName = new String[3];

		for (int i = 0; i < file.size(); i++) {
			fileName[i] = uuid + "_" + file.get(i).getOriginalFilename();
			File saveFile = new File(imgPath, fileName[i]);

			if (i == 0 && !file.get(i).isEmpty()) {
				file.get(i).transferTo(saveFile);
				qna.setQna_img_1(fileName[i]);
				qna.setQna_img_path(imgPath);

			} else if (i == 1 && !file.get(i).isEmpty()) {
				file.get(i).transferTo(saveFile);
				qna.setQna_img_2(fileName[i]);
				qna.setQna_img_path(imgPath);

			} else if (i == 2 && !file.get(i).isEmpty()) {
				file.get(i).transferTo(saveFile);
				qna.setQna_img_3(fileName[i]);
				qna.setQna_img_path(imgPath);
			}
		}
	}

	@Override
	public void page(HttpServletRequest req) {
		String pageStr = req.getParameter("page");

		List<QnaAndProductsDTO> pages = qna_mapper.getQnaAndProductsAll();

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