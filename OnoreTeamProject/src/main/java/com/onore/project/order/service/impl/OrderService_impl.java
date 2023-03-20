package com.onore.project.order.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.dto.PurchaseInfoDTO;
import com.onore.project.dto.OrderDTO;
import com.onore.project.dto.OrderInfoDTO;
import com.onore.project.dto.ProductsDTO;
import com.onore.project.mapper.OrderMapper;
import com.onore.project.order.service.OrderService;

@Service
public class OrderService_impl implements OrderService {

	@Autowired
	OrderMapper order_mapper;
	
	@Override
	public Integer insertOrder(OrderDTO order) {
		
		Integer row = order_mapper.insertOrder(order);
			
		return row;
	}
	
	@Override
	public Integer insertOrderInfos(OrderDTO order, ProductsDTO product, String product_name, String order_info_option,
									String order_info_qty, String order_info_price) {
		
		
		OrderInfoDTO info = new OrderInfoDTO();
		Integer row = 0;
		System.out.println(product);
		info.setOrder_num(order.getOrder_num());
		info.setProduct_num(product.getProduct_num());
		info.setProduct_name(product_name);
		info.setOrder_info_qty(Integer.parseInt(order_info_qty));
		info.setOrder_info_option(order_info_option);
		info.setOrder_info_price(Integer.parseInt(order_info_price));
		row = order_mapper.insertOrderInfo(info);
		
		return row;
	}
	
	@Override
	public Integer insertPurchaseInfo(PurchaseInfoDTO purchase) {
		
		Integer row = order_mapper.insertPurchaseInfo(purchase);
		
		return row;
	}
	
	@Override
	public OrderDTO getOrder(Integer order_num) {
		
		OrderDTO order = order_mapper.getOrder(order_num);
		
		return order;
	}
	
	@Override
	public List<OrderDTO> getAllOrders() {
		
		List<OrderDTO> my_orders = order_mapper.getAllOrders();
		
		return my_orders;
	}
	
	@Override
	public List<OrderInfoDTO> getOrderInfos(Integer order_num) {
		
		List<OrderInfoDTO> order_infos = order_mapper.getOrderInfos(order_num);
		
		return order_infos;
	}
	
	@Override
	public PurchaseInfoDTO getPurchaseInfo(Integer order_num) {
		
		PurchaseInfoDTO purchase_info = order_mapper.getPurchaseInfo(order_num);
		
		return purchase_info;
	}
	
	@Override
	public Integer updateReceiver(OrderDTO order) {
		
		Integer row = order_mapper.updateReceiver(order);
		
		return row;
	}
	
	@Override
	public Integer updateOrderStatus(Integer order_num) {
		
		Integer row = order_mapper.updateOrderStatus(order_num);
		
		return row;
	}
	
	@Override
	public Integer deleteOrder(Integer order_num) {
		
		return order_mapper.deleteOrder(order_num);
	}
	
	@Override
	public Integer deleteOrderInfos(Integer order_num) {
		
		return order_mapper.deleteOrderInfos(order_num);
	}
	
	@Override
	public Integer deletePayInfos(Integer order_num) {
		// TODO Auto-generated method stub
		return order_mapper.deletePayInfos(order_num);
	}
}
