package com.onore.project.admin.service;

import java.util.List;

import com.onore.project.dto.OrderDTO;

public interface AdminOrderService {
	List<OrderDTO> readAllOrders(OrderDTO order);
	Integer refundOrder(OrderDTO order);
}
