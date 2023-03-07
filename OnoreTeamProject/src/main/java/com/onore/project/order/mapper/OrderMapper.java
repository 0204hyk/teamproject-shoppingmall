package com.onore.project.order.mapper;

import java.util.List;

import com.onore.project.order.dto.PurchaseInfoDTO;
import com.onore.project.order.dto.OrderDTO;
import com.onore.project.order.dto.OrderInfoDTO;

public interface OrderMapper {

	Integer insertOrder(OrderDTO order);
	
	Integer insertOrderInfo(OrderInfoDTO info);
	
	Integer insertPurchaseInfo(PurchaseInfoDTO info);
	
	OrderDTO getOrder(Integer order_num);
	
	List<OrderDTO> getAllOrders();
	
	List<OrderInfoDTO> getOrderInfos(Integer order_num);
	
	PurchaseInfoDTO getPurchaseInfo(Integer order_num);
	
	Integer updateReceiver(OrderDTO order);
}
