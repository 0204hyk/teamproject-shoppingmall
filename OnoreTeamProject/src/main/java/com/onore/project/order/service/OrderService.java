package com.onore.project.order.service;

import java.util.List;

import com.onore.project.order.dto.OrderDTO;
import com.onore.project.order.dto.OrderInfoDTO;

public interface OrderService {

	Integer insertOrder(OrderDTO order, List<String> order_info_name, List<String> order_info_size,
				List<String> order_info_option, List<String> order_info_qty, List<String> order_info_price);
	
	OrderDTO getOrder(String order_id);
	
	List<OrderInfoDTO> getOrderInfos(String order_id);
}
