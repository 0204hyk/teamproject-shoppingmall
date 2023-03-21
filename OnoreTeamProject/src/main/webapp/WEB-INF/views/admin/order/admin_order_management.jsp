<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>주문 목록</title>
</head>
<body>
	
	<div class="order-content shadow">
		<div class="order-title">
			<h1>주문 목록</h1>
			<select name="search_type" class="form-select search-type" style="width: 120px; margin-left: 100px;">
				<c:choose>
					<c:when test="${search_type eq 'id'}">
						<option value="id" selected>주문번호</option>
						<option value="name">주문자</option>	
					</c:when>
					<c:when test="${search_type eq 'name'}">
						<option value="id">주문번호</option>
						<option value="name" selected>주문자</option>	
					</c:when>
					<c:otherwise>
						<option value="id">주문번호</option>
						<option value="name">주문자</option>	
					</c:otherwise>
				</c:choose>
			</select>
			<input type="text" class="form-control search-box" name="search_keyword" placeholder="검색어를 입력해주세요." value="${search_keyword}"/>
			<button type="submit" id="search-btn" style="color: gray;"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
		<form id="order-list-form" name="order-list-form" method="POST">
			<div class="container">
				<table id="order-list" class="order-board table table-hover">
					<thead class="table-secondary">
						<tr>
							<th>NO</th>
							<th>주문상태</th>
							<th>주문번호</th>
							<th>상품명</th>
							<th>주문자</th>
							<th>수령인</th>
							<th>주문금액</th>
							<th>주문일자</th>
							<th>처 리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="order">
							<tr style="vertical-align: middle; height: 60px;">
								<td style="width: 70px;">${order.order_num}</td>
								<c:choose>
									<c:when test="${order.order_status eq 0}">
										<td style="width: 200px;">정상</td>
									</c:when>
									<c:when test="${order.order_status eq 1}">
										<td style="width: 200px; color: red;">취소/환불 요청</td>
									</c:when>
									<c:when test="${order.order_status eq 2}">
										<td style="width: 200px; color: blue;">취소/환불 완료</td>
									</c:when>
								</c:choose>
								<c:set var="order_number" value="${order.order_id}"/>
								<td><a href="#">${fn:substring(order_number,6,23)}</a></td>
								<td style="width: 230px;">${order.order_name}</td>
								<td style="width: 100px;">${order.orderer_name}</td>
								<td style="width: 100px;">${order.receiver_name}</td>
								<td style="width: 130px;"><fmt:formatNumber value="${order.pay_price}" pattern="#,###"/> 원</td>
								<td style="width: 120px;">${order.creationDateTime}</td>
								<c:choose>
									<c:when test="${order.order_status eq 1}">
										<td style="width: 120px;">
											<input type="button" id="refund-btn" value="취소/환불"/>
										</td>
									</c:when>
									<c:otherwise>
										<td style="width: 120px;">-</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right;">
					<ul class="pagination justify-content-center" style="margin-bottom: 0px;">
						<c:if test="${prev == true}">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/order/list?page=${pagination_start - 1}&search_type=${search_type}&search_keyword=${search_keyword}')">«</a>
							</li>												
						</c:if>
						
						<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
							<c:if test="${page == i}">
						    	<li class="page-item active">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/order/list?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
							<c:if test="${page != i}">
						    	<li class="page-item">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/order/list?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
						</c:forEach>
						
					    <c:if test="${next == true }">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/order/list?page=${pagination_end + 1}&search_type=${search_type}&search_keyword=${search_keyword}')">»</a>
							</li>				    					    
					    </c:if>
					</ul>
				</div>
			</div>
		</form>
	</div>
	
	<script src="<%=request.getContextPath()%>/resources/admin/js/order_list.js"></script>
	
</body>
</html>