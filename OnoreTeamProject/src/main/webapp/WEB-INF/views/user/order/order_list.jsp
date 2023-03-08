<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>

	<h3>주문 내역</h3>
	
	<c:forEach items="${orders}" var="order">
		<div>${order.order_id}</div>
		<div>${order.payment_key}</div>
		<input type="text" id="cancel_reason" name=""/>
	</c:forEach>

</body>
</html>