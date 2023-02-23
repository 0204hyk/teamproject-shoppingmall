package com.onore.project.order.mapper;

import java.util.List;

import com.onore.project.order.dto.OrderDTO;
import com.onore.project.order.dto.OrderInfoDTO;

public interface OrderMapper {

	Integer insertOrder(OrderDTO info);
	
	Integer insertOrderInfo(OrderInfoDTO info);
	
	OrderDTO getOrder(String order_id);
	
	List<OrderInfoDTO> getOrderInfos(String order_id);
}
