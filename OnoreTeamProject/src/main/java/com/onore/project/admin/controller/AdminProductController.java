package com.onore.project.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.onore.project.admin.service.AdminProductService;
import com.onore.project.admin.service.ProductImageUploadService;
import com.onore.project.dto.ProductsDTO;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/admin/product")
@Controller
public class AdminProductController {

	@Autowired
	AdminProductService service;

	@Autowired
	ProductImageUploadService uploadService;

	@GetMapping("/regist")
	public String productRegistForm(HttpServletRequest request) {
		request.setAttribute("categories", service.readCaregoriesList());
		return "/admin/product/admin_product_regist";
	}

	@PostMapping("/regist")
	public String productRegist(HttpServletRequest request, @RequestParam(value = "product_thumbnail_1", required = false) MultipartFile product_thumbnail_1,
			@RequestParam(value = "product_thumbnail_2", required = false) MultipartFile product_thumbnail_2,
			@RequestParam(value = "product_thumbnail_3", required = false) MultipartFile product_thumbnail_3) throws IOException {

		String category_num = request.getParameter("category_num");
		String product_name = request.getParameter("product_name");
		String product_price = request.getParameter("product_price");
		String product_info = request.getParameter("product_info");
		String product_detail = request.getParameter("product_detail");

		if (!category_num.equals("0") && !product_name.equals("") && !product_price.equals("")
				&& !product_info.equals("") && !product_detail.equals("")) {
			ProductsDTO product = new ProductsDTO();
			product.setCategory_num(Integer.parseInt(category_num));
			product.setProduct_name(product_name);
			product.setProduct_price(Integer.parseInt(product_price.replace(",", "")));
			product.setProduct_info(product_info);
			product.setProduct_detail(product_detail);
			product.setProduct_thumbnail_1(uploadService.uploadFile(request, product_thumbnail_1));
			product.setProduct_thumbnail_2(uploadService.uploadFile(request, product_thumbnail_2));
			product.setProduct_thumbnail_3(uploadService.uploadFile(request, product_thumbnail_3));
			System.out.println(service.productRegist(product));
		}

		return "redirect:/admin/product/list";
	}

	@GetMapping("/list")
	public String productList(HttpServletRequest request) {
		String pageStr = request.getParameter("page");

		List<ProductsDTO> productList = service.readAllProduct();

		int page;

		if (pageStr == null) {
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}

		int board_size = 5;
		int notice_size = productList.size();
		int start_index = (page - 1) * board_size;
		int end_index = page * board_size;
		end_index = end_index > notice_size ? notice_size : end_index;

		int max_page = notice_size % board_size == 0 ?
				notice_size / board_size : notice_size / board_size + 1;

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

		request.setAttribute("productList", productList.subList(start_index, end_index));
		request.setAttribute("pagination_start", pagination_start);
		request.setAttribute("pagination_end", pagination_end);
		request.setAttribute("prev", prevBtn);
		request.setAttribute("next", nextBtn);
		request.setAttribute("page", page);
		request.setAttribute("categories", service.readCaregoriesList());

		return "/admin/product/admin_product_list";
	}

	@GetMapping("/modify")
	public String productModifyForm(HttpServletRequest request) {
		request.setAttribute("categories", service.readCaregoriesList());
		request.setAttribute("product", service.readProduct(Integer.parseInt(request.getParameter("product_num"))));
		return "/admin/product/admin_product_modify";
	}

	@PostMapping("/modify")
	public String noticeModify(HttpServletRequest request, @RequestParam(value = "product_thumbnail_1", required = false) MultipartFile product_thumbnail_1,
			@RequestParam(value = "product_thumbnail_2", required = false) MultipartFile product_thumbnail_2,
			@RequestParam(value = "product_thumbnail_3", required = false) MultipartFile product_thumbnail_3) {

		String product_num = request.getParameter("product_num");
		String category_num = request.getParameter("category_num");
		String product_name = request.getParameter("product_name");
		String product_price = request.getParameter("product_price");
		String product_info = request.getParameter("product_info");
		String product_detail = request.getParameter("product_detail");

		if (!category_num.equals("0") && !product_name.equals("") && !product_price.equals("")
				&& !product_info.equals("") && !product_detail.equals("")) {
			ProductsDTO product = new ProductsDTO();
			product.setProduct_num(Integer.parseInt(product_num));
			product.setCategory_num(Integer.parseInt(category_num));
			product.setProduct_name(product_name);
			product.setProduct_price(Integer.parseInt(product_price.replace(",", "")));
			product.setProduct_info(product_info);
			product.setProduct_detail(product_detail);
			product.setProduct_thumbnail_1(uploadService.uploadFile(request, product_thumbnail_1));
			product.setProduct_thumbnail_2(uploadService.uploadFile(request, product_thumbnail_2));
			product.setProduct_thumbnail_3(uploadService.uploadFile(request, product_thumbnail_3));
			service.productModifyService(product);
		}
		return "redirect:/admin/notice/list";
	}

	@PostMapping("/delete")
	public String productDelete(@RequestParam(value = "row_check", required = false) String[] row_check) {
		if (row_check != null) {
			for (String product_num : row_check) {
				service.productDeleteService(Integer.parseInt(product_num));
			}
		}
		return "redirect:/admin/product/list";
	}

}
