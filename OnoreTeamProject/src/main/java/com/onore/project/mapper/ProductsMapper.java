package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.ProductsDTO;

public interface ProductsMapper {
	Integer insertProduct(ProductsDTO product);
	List<ProductsDTO> getAllProduct();
}
