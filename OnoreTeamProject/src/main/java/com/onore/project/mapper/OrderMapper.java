package com.onore.project.mapper;

import java.util.List;

import com.onore.project.dto.OrderDTO;
import com.onore.project.dto.OrderInfoDTO;
import com.onore.project.dto.PurchaseInfoDTO;

public interface OrderMapper {

	Integer insertOrder(OrderDTO order);

	Integer insertOrderInfo(OrderInfoDTO info);

	Integer insertPurchaseInfo(PurchaseInfoDTO info);

	OrderDTO getOrder(Integer order_num);

	List<OrderDTO> getAllOrders();

	List<OrderInfoDTO> getOrderInfos(Integer order_num);

	PurchaseInfoDTO getPurchaseInfo(Integer order_num);

	Integer updateReceiver(OrderDTO order);
	
	Integer deleteOrder(Integer order_num);
	
	Integer deleteOrderInfos(Integer order_num);
	
	Integer deletePayInfos(Integer order_num);
}
