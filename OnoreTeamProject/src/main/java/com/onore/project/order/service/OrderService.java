package com.onore.project.order.service;

import java.util.List;

import com.onore.project.order.dto.PurchaseInfoDTO;
import com.onore.project.order.dto.OrderDTO;
import com.onore.project.order.dto.OrderInfoDTO;

public interface OrderService {

	Integer insertOrder(OrderDTO order);
	
	Integer insertOrderInfos(OrderDTO order, List<String> product_name, List<String> order_info_size,
			List<String> order_info_option, List<String> order_info_qty, List<String> order_info_price);
	
	Integer insertPurchaseInfo(PurchaseInfoDTO purchase);
	
	OrderDTO getOrder(Integer order_id);
	
	List<OrderDTO> getAllOrders();
	
	PurchaseInfoDTO getPurchaseInfo(Integer order_num);
	
	List<OrderInfoDTO> getOrderInfos(Integer order_id);
	
	Integer updateReceiver(OrderDTO order);
}
