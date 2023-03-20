package com.onore.project.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onore.project.admin.service.AdminBoardService;
import com.onore.project.dto.QnaAndProductsDTO;
import com.onore.project.dto.ReviewandProductDTO;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/board")
@Controller
public class AdminBoardController {

	@Autowired
	AdminBoardService service;

	@GetMapping("/qna")
	public String qnaList(HttpServletRequest request, QnaAndProductsDTO qna) {
		String search_type = request.getParameter("search_type");
		String search_keyword = request.getParameter("search_keyword");

		qna.setSearch_type(search_type);
		qna.setSearch_keyword(search_keyword);

		List<QnaAndProductsDTO> qnaList = service.readAllQna(qna);

		String pageStr = request.getParameter("page");

		int page;

		if (pageStr == null) {
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}

		int board_size = 5;
		int qna_size = qnaList.size();
		int start_index = (page - 1) * board_size;
		int end_index = page * board_size;
		end_index = end_index > qna_size ? qna_size : end_index;
		
		int max_page = qna_size % board_size == 0 ?
				qna_size / board_size : qna_size / board_size + 1;
		
		int page_size = 10;
		int pagination_start;
		int pagination_end;

		if (page % 10 == 0) {
			pagination_end = (page / page_size) * page_size;
		} else {
			pagination_end = (page / page_size + 1) * page_size;
		}

		pagination_start = page % page_size == 0 ?
				page - 9 : (page / page_size) * page_size + 1;

		pagination_end = pagination_end > max_page ? max_page : pagination_end;

		boolean prevBtn = true;
		boolean nextBtn = true;

		if (pagination_start == 1) {
			prevBtn = false;
		}

		if (pagination_end == max_page) {
			nextBtn = false;
		}

		request.setAttribute("qnaList", qnaList.subList(start_index, end_index));
		request.setAttribute("pagination_start", pagination_start);
		request.setAttribute("pagination_end", pagination_end);
		request.setAttribute("prev", prevBtn);
		request.setAttribute("next", nextBtn);
		request.setAttribute("page", page);
		request.setAttribute("search_type", search_type);
		request.setAttribute("search_keyword", search_keyword);

		return "/admin/board/admin_qna_management";
	}

	@PostMapping("/qna/delete")
	public String qnaDelete(@RequestParam(value = "row_check", required = false) String[] row_check) {
		if (row_check != null) {
			for (String qna_num : row_check) {
				service.qnaDeleteService(Integer.parseInt(qna_num));
			}
		}
		return "redirect:/admin/board/qna";
	}

	@GetMapping("/review")
	public String reviewList(HttpServletRequest request, ReviewandProductDTO review) {
		String search_type = request.getParameter("search_type");
		String search_keyword = request.getParameter("search_keyword");

		review.setSearch_type(search_type);
		review.setSearch_keyword(search_keyword);

		List<ReviewandProductDTO> reviewList = service.readAllReview(review);

		String pageStr = request.getParameter("page");

		int page;

		if (pageStr == null) {
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}

		int board_size = 5;
		int review_size = reviewList.size();
		int start_index = (page - 1) * board_size;
		int end_index = page * board_size;
		end_index = end_index > review_size ? review_size : end_index;
		
		int max_page = review_size % board_size == 0 ?
				review_size / board_size : review_size / board_size + 1;
		
		int page_size = 10;
		int pagination_start;
		int pagination_end;

		if (page % 10 == 0) {
			pagination_end = (page / page_size) * page_size;
		} else {
			pagination_end = (page / page_size + 1) * page_size;
		}

		pagination_start = page % page_size == 0 ?
				page - 9 : (page / page_size) * page_size + 1;

		pagination_end = pagination_end > max_page ? max_page : pagination_end;

		boolean prevBtn = true;
		boolean nextBtn = true;

		if (pagination_start == 1) {
			prevBtn = false;
		}

		if (pagination_end == max_page) {
			nextBtn = false;
		}

		request.setAttribute("reviewList", reviewList.subList(start_index, end_index));
		request.setAttribute("pagination_start", pagination_start);
		request.setAttribute("pagination_end", pagination_end);
		request.setAttribute("prev", prevBtn);
		request.setAttribute("next", nextBtn);
		request.setAttribute("page", page);
		request.setAttribute("search_type", search_type);
		request.setAttribute("search_keyword", search_keyword);

		return "/admin/board/admin_review_management";
	}

	@PostMapping("/review/delete")
	public String reviewDelete(@RequestParam(value = "row_check", required = false) String[] row_check) {
		if (row_check != null) {
			for (String review_num : row_check) {
				service.reviewDeleteService(Integer.parseInt(review_num));
			}
		}
		return "redirect:/admin/board/review";
	}

}
