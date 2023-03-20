<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문이 완료되었습니다.</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
	<h1>주문이 완료되었습니다.</h1>
	
	<div>3초 뒤 주문 결과가 출력됩니다.</div>
	<form id="purchase_form" action="/project/order/complete" method="GET">
		<input type="hidden" id="order_id" name="order_id" value="${order.order_id}"/>
		<input type="hidden" id="order_num" name="order_num" value="${order.order_num}"/>
	</form>
		<input type="hidden" id="pay_price" name="pay_price" value="${order.pay_price}"/>
		<input type="hidden" id="pay_method" name="pay_method" value="${order.pay_method}"/>
		<input type="hidden" id="payment_key" name="payment_key" value="${payment_key}"/>
		<input type="hidden" id="amount" name="amount" value="${amount}"/>
		
	<script>
		setTimeout(() => {
			purchase_submit();
		}, 3000);
		
		console.log("${order.order_id}");
		console.log("${order.order_num}");
	</script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/resources/order/js/order_result.js"></script>
</body>
</html>