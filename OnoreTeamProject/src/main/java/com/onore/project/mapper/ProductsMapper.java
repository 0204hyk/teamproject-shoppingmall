package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.ProductsDTO;

public interface ProductsMapper {
	Integer insertProduct(ProductsDTO product);
	List<ProductsDTO> getAllProduct();
	ProductsDTO getProduct(Integer product_num);
	Integer updateProduct(ProductsDTO product);
	Integer deleteProduct(Integer product_num);
	List<ProductsDTO> getSearchProduct(ProductsDTO product);
}
