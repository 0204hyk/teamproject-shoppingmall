package com.onore.project.order.service;

import java.util.List;

import com.onore.project.dto.OrderDTO;
import com.onore.project.dto.OrderInfoDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.dto.PurchaseInfoDTO;

public interface OrderService {

	Integer insertOrder(OrderDTO order);
	
	Integer insertOrderInfos(OrderDTO order, ProductsDTO product, String product_name, String order_info_option,
							String order_info_qty, String order_info_price);
	
	Integer insertPurchaseInfo(PurchaseInfoDTO purchase);
	
	OrderDTO getOrder(Integer order_num);
	
	List<OrderDTO> getAllOrders();
	
	PurchaseInfoDTO getPurchaseInfo(Integer order_num);
	
	List<OrderInfoDTO> getOrderInfos(Integer order_id);
	
	Integer updateReceiver(OrderDTO order);
}
