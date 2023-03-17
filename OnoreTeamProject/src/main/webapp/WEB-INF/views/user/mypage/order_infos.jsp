<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>주문 상세</title>
</head>
<body>
	<table>
		<c:forEach begin="0" end="${order_infos.size()-1}" var="i">
			<tr>
				<td rowspan="3">
					<div class="img-container">
						<img src="${products.get(i).product_thumbnail_1}">
					</div>
				</td>
				<td>
					<p id="product_name" class="fs-2 fw-semibold">
						${order_infos.get(i).product_name}
					</p>
					<input type="hidden" name="product_name" value="${order_infos.get(i).product_name}"/>
				</td>
			</tr>
			<tr>
				<td>
					<p id="order_info_option" class="fs-6 text-black-50">
						option: ${order_infos.get(i).order_info_option}
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<p id="order_info_price" class="fs-5 fw-semibold">
						${order_infos.get(i).order_info_qty}개 / <fmt:formatNumber value="${order_infos.get(i).order_info_price}" pattern="#,###" />원
					</p>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>