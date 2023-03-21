package com.onore.project.review.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.dto.ReviewDTO;
import com.onore.project.dto.ReviewandProductDTO;
import com.onore.project.mapper.ReviewMapper;
import com.onore.project.review.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewMapper review_mapper;

	@Override
	public List<ReviewandProductDTO> getAll() {

		return review_mapper.getAll();
	}

	@Override
	public void insert(Model model, ReviewDTO rev) {

		model.addAttribute(review_mapper.insert(rev));
	}

	@Override
	public ReviewandProductDTO get(Integer review_num) {

		return review_mapper.get(review_num);
	}

	@Override
	public Integer modify(ReviewDTO rev) {

		return review_mapper.modify(rev);
	}

	@Override
	public Integer delete(Integer review_num) {

		return review_mapper.delete(review_num);
	}

	@Override
	public void fileUpload(ReviewDTO rev, List<MultipartFile> file) throws IllegalStateException, IOException {
		//String imgPath = "C:\\Users\\minbong\\git\\teamproject-shoppingmall\\OnoreTeamProject\\src\\main\\webapp\\resources\\review\\image";
		//String imgPath = "/Users/kang/git/teamproject-shoppingmall/OnoreTeamProject/src/main/webapp/resources/review/image/"; // 노트북
		//String imgPath = "C:\\Users\\K\\git\\teamproject-shoppingmall\\OnoreTeamProject\\src\\main\\webapp\\resources\\review\\image\\";
		
		// 서버 경로
		String imgPath = "/opt/tomcat/apache-tomcat-9.0.73/webapps/OnoreTeamProject/resources/review/image/";
		
		UUID uuid = UUID.randomUUID();
		String[] fileName = new String[3];

		for (int i = 0; i < file.size(); i++) {
			fileName[i] = uuid + "_" + file.get(i).getOriginalFilename();
			File saveFile = new File(imgPath, fileName[i]);

			if (i == 0 && !file.get(i).isEmpty()) {
				file.get(i).transferTo(saveFile);
				rev.setReview_img_1(fileName[i]);
				rev.setReview_img_path(imgPath);

			} else if (i == 1 && !file.get(i).isEmpty()) {
				file.get(i).transferTo(saveFile);
				rev.setReview_img_2(fileName[i]);
				rev.setReview_img_path(imgPath);

			} else if (i == 2 && !file.get(i).isEmpty()) {
				file.get(i).transferTo(saveFile);
				rev.setReview_img_3(fileName[i]);
				rev.setReview_img_path(imgPath);
			}
		}

	}
}
