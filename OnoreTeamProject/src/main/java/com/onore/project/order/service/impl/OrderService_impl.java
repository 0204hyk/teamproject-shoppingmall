package com.onore.project.order.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onore.project.order.dto.OrderDTO;
import com.onore.project.order.dto.OrderInfoDTO;
import com.onore.project.order.mapper.OrderMapper;
import com.onore.project.order.service.OrderService;

@Service
public class OrderService_impl implements OrderService {

	@Autowired
	OrderMapper order_mapper;
	
	@Override
	public Integer insertOrder(OrderDTO order, List<String> product_name, List<String> order_info_size,
						List<String> order_info_option, List<String> order_info_qty, List<String> order_info_price) {
		
		Integer row = order_mapper.insertOrder(order);
		
		List<OrderInfoDTO> infos = new ArrayList<>();
		
		OrderInfoDTO info = new OrderInfoDTO();
		Integer qty = product_name.size();
		for (int i = 0; i < qty; i++) {
			// order_info_id 만들기
			LocalDateTime today = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddkkmmssSSS");
			info.setOrder_info_id("info_" + formatter.format(today));
			
			info.setOrder_id(order.getOrder_id());
			info.setProduct_id("product_" + formatter.format(today));
			info.setProduct_name(product_name.get(i));
			info.setOrder_info_qty(Integer.parseInt(order_info_qty.get(i)));
			info.setOrder_info_size(Integer.parseInt(order_info_size.get(i)));
			info.setOrder_info_option(order_info_option.get(i));
			info.setOrder_info_price(Integer.parseInt(order_info_price.get(i)));
			order_mapper.insertOrderInfo(info);
			infos.add(info);
		}		
		return row;
	}
	
	@Override
	public OrderDTO getOrder(String order_id) {
		
		OrderDTO order = order_mapper.getOrder(order_id);
		
		return order;
	}
	
	@Override
	public List<OrderInfoDTO> getOrderInfos(String order_id) {
		
		List<OrderInfoDTO> order_infos = order_mapper.getOrderInfos(order_id);
		
		return order_infos;
	}
	
	
	
}
