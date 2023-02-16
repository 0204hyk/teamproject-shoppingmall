package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.OrdersDTO;

public interface OrdersMapper {
	
	List<OrdersDTO> getDailySales();
	
}
