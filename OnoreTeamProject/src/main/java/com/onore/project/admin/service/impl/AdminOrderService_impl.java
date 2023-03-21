package com.onore.project.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.admin.service.AdminOrderService;
import com.onore.project.dto.OrderDTO;
import com.onore.project.mapper.OrderMapper;

@Service
public class AdminOrderService_impl implements AdminOrderService{

	@Autowired
	OrderMapper mapper;
	
	@Override
	public List<OrderDTO> readAllOrders(OrderDTO order) {
		return mapper.getSearchOrders(order);
	}

	@Override
	public Integer refundOrder(OrderDTO order) {
		return mapper.updateRefundOrder(order);
	}

}
