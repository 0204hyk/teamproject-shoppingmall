package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.dto.CategoriesDTO;
import com.onore.project.dto.ProductsDTO;

public interface AdminProductService {
	List<CategoriesDTO> readCaregoriesList();
	Integer productRegist(ProductsDTO product);
	List<ProductsDTO> readAllProduct();
}
