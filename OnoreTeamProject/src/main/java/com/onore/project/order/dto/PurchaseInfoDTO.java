package com.onore.project.order.dto;

import lombok.Data;

@Data
public class PurchaseInfoDTO {

	private Integer pay_num;
	private String pay_id;
	private Integer order_num;
	private Integer pay_price;
	private String pay_method;
	private Integer pay_status;
	private Integer refund_req;
	private Integer refund_status;
}
