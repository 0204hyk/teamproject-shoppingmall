<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문이 완료되었습니다.</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<h2>주문이 완료되었습니다.</h2>
	
	<div>
		주문번호 : ${orders.order_id} <br>
		배송지 : ${orders.receiver_address} ${orders.receiver_detail_address} <br>
		상품 정보 : ${orders.order_name} <br>
		자세한 상품 정보 :	<br>
		<c:forEach begin="0" end="${fn:length(order_infos)-1}" var="i">
			------------------ ${i+1} ------------------ <br>
			상품명 : ${order_infos.get(i).product_name} <br>
			상품코드 : ${order_infos.get(i).order_info_id} <br>
			상품가격 : ${order_infos.get(i).order_info_price}원 <br>
		</c:forEach>
		가격 : ${orders.pay_price}원 <br>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>