package com.onore.project.admin.service.impl;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onore.project.admin.service.AdminMainService;
import com.onore.project.dto.OrdersDTO;
import com.onore.project.mapper.OrdersMapper;

@Service
public class AdminMainService_impl implements AdminMainService {

	@Autowired
	OrdersMapper ordersMapper;
	
	@Override
	public String readDailySales() {
		List<OrdersDTO> orderList = ordersMapper.getDailySales();
		ObjectMapper objMapper = new ObjectMapper();
		
		try {
			String jsonStr = objMapper.writeValueAsString(orderList);
			System.out.println("json타입: " + jsonStr);
			return jsonStr;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	
	
}
