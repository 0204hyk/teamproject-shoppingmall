package com.onore.project.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.ShopDTO;
import com.onore.project.qna.service.QnaService;

@RestController
public class QnaRestController {

	@Autowired
	QnaService qnaService;

	@GetMapping(value = {"restful/getProductName/{product_name}"}, produces = "application/json; charset=UTF-8")
	public List<ShopDTO> getProductName(@PathVariable("product_name") String product_name) {

		return qnaService.getProductName(product_name);
	}
}