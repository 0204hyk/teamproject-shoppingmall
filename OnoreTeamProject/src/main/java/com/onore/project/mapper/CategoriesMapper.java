package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.CategoriesDTO;

public interface CategoriesMapper {
	List<CategoriesDTO> getAllCategory();
	CategoriesDTO getCategory();
}
