<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문이 완료되었습니다.</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/order/css/order_result.css"/>
</head>
<body>
	<div class="container">
		<div id="header" class="container-sm w-auto">
			<h2>
				<a style="cursor: pointer;" onclick="toHomePage();">ONORE</a>
			</h2>
		</div>

		<div class="blank"></div>

		<div id="order_result" class="container-sm w-auto">
			<p class="fs-1 fw-bold">주문이 완료되었습니다.</p>
			<br>
			<br>
			<br>
			<br>
			<p class="fs-3">3초 뒤 주문 결과가 출력됩니다.</p>
			<form id="purchase_form" action="/project/order/complete"
				method="GET">
				<input type="hidden" id="order_id" name="order_id"
					value="${order.order_id}" /> <input type="hidden" id="order_num"
					name="order_num" value="${order.order_num}" />
			</form>
			<input type="hidden" id="pay_price" name="pay_price"
				value="${order.pay_price}" /> <input type="hidden" id="pay_method"
				name="pay_method" value="${order.pay_method}" /> <input
				type="hidden" id="payment_key" name="payment_key"
				value="${payment_key}" /> <input type="hidden" id="amount"
				name="amount" value="${amount}" />
		</div>
	</div>
	<script>
		setTimeout(() => {
			purchase_submit();
		}, 3000);
		const contextPath = '<%=request.getContextPath()%>';
	</script>
	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script charset="utf-8"
		src="<%=request.getContextPath()%>/resources/order/js/order_result.js"></script>
</body>
</html>