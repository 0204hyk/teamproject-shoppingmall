package com.onore.project.notice.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.NoticeDTO;
import com.onore.project.mapper.NoticeMapper;
import com.onore.project.notice.service.NoticePageService;

@Service
public class NoticePageServiceImpl implements NoticePageService {

	@Autowired
	NoticeMapper notice_mapper;

	@Override
	public void service(HttpServletRequest req, NoticeDTO notice) {

		String pageStr = req.getParameter("page");

		List<NoticeDTO> notices = notice_mapper.getAllNotice(notice);

		int page;
		if (pageStr == null) {
			page = 1;
		} else {
			page= Integer.parseInt(pageStr);
		}

		int page_size = 10;
		int board_size = notices.size();
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

		req.setAttribute("notices", notices.subList(start_index, end_index));
		req.setAttribute("pagination_start", pagination_start);
		req.setAttribute("pagination_end", pagination_end);
		req.setAttribute("next_page", next_page);
		req.setAttribute("previous_page", previous_page);
	}
}

