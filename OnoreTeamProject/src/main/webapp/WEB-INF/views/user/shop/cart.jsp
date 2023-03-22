<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%@ include file="../header.jspf" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/shop/css/cart.css">
<link rel="icon" href="<%=request.getContextPath()%>/resources/main/image/fabicon.png">

</head>
<body>
<script src="<%=request.getContextPath() %>/resources/shop/js/cart.js" defer></script>

<%@ include file="../top.jspf" %>
<div class="container">
<hr>
	<div class="header_container">
		<h2>Shopping Cart</h2>
	</div>
	<div class="cart_container">
		<table class="cart">
			<colgroup>
				<col style="width:30px">
				<col style="width:120px">
				<col style="width:250px">
				<col style="width:100px">
				<col style="width:60px">
				<col style="width:100px">
				<col style="width:60px">
				<col style="width:100px">
				<col style="width:100px">
			</colgroup>
			<thead>
				<tr class="cart_header_outline"><th colspan="9"></th></tr>
				<tr class="cart_header">
					<th scope="col"><input type="checkbox" id="check_all" checked/></th>
					<th scope="col">이미지</th>
					<th scope="col">상품 정보</th>
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<th scope="col">적립금</th>
					<th scope="col">배송비</th>
					<th scope="col">합계</th>
					<th scope="col">선택</th>
				</tr>
				<tr class="cart_header_outline"><th colspan="9"></th></tr>
			</thead>
				<tbody>
					<c:choose>
						<c:when test="${cart_list eq null || cart_list.size() eq 0}">
							<tr class="cart_body">
								<td colspan="9">
									<b>장바구니가 비어있습니다.</b>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach begin="0" end="${cart_list.size() - 1}" var="i">
								<tr class="cart_body">
									<td><input type="checkbox" class="check" value="${cart_list.get(i).cart_num}" checked/></td>
									<td><img class="product_img" src="${cart_product_list.get(i).product_thumbnail_1}"
													alt="${cart_product_list.get(i).product_name}"/></td>
									<td style="text-align: left; padding-left: 25px;">
										<div class="product_name">${cart_product_list.get(i).product_name}</div>
										<div class="product_options">${cart_list.get(i).cart_product_option}</div>
									</td>
									<td><fmt:formatNumber value="${cart_product_list.get(i).product_price}" pattern="#,###" />원</td>
									<td>
										<form action="<%=request.getContextPath() %>/update_cart" method="POST">
											<input type="hidden" name="cart_num" value="${cart_list.get(i).cart_num}"/>
											<input type="hidden" name="product_price" value="${cart_product_list.get(i).product_price}"/>
											<input type="number" value="${cart_list.get(i).cart_product_qty}" min="1" max="99" 
													name="cart_product_qty" style="width: 30px; text-align: center;"/> <br>
											<input type="submit" value="변경"/>
										</form>
									</td>
									<td>최대<br><fmt:formatNumber value="${total_points.get(i)}" pattern="#,###" />원</td>
									<td>무료</td>
									<td>
										<span class="cart_product_price_txt">
											<fmt:formatNumber value="${cart_list.get(i).cart_product_price}" pattern="#,###" />
										</span>원
										<input type="hidden" class="cart_product_price" value="${cart_list.get(i).cart_product_price}"/>
									</td>
									<td>
										<form method="POST">
											<input type="hidden" name="selected_list" value="${cart_list.get(i).cart_num}"/>
											<input type="submit" class="order_single_btn" formaction="../order/from_cart" value="주문하기">
											<input type="submit" class="delete_single_btn" formaction="<%=request.getContextPath()%>/delete_selected_cart" value="삭제하기">
										</form>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			<tfoot>
				<tr>
					<td colspan="9">
						<b>상품 구매 금액: <span id="product_total_price"><fmt:formatNumber value="${total_price}" pattern="#,###" />원</span> + 
							배송비 무료 = 총 <span id="total_price"><fmt:formatNumber value="${total_price}" pattern="#,###" />원</span></b>
					</td>
				</tr>
				<tr>
					<td class="sub-button_container" colspan="9">
						<form id="delete_form">
							<input type="hidden" id="selected_list_1" name="selected_list" />
						</form>
						<button id="delete_selected_btn" class="delete_selected_btn">선택 상품 삭제</button>				
						<button id="delete_all_btn" class="delete_all_btn">장바구니 비우기</button>
					</td>
				</tr>
			</tfoot>
		</table>
		<div class="order-button_container">
			<form id="order_selected_form" style="display: inline;">
				<input type="hidden" id="selected_list_2" name="selected_list" />
			</form>
			<button id="order_selected_btn" class="order_selected_btn">선택 상품 주문</button>
			<form id="order_all_form" style="display: inline;">
				<input type="hidden" id="cart_num_list" name="selected_list" />
			</form>
			<button id="order_all_btn" class="order_all_btn">전체 상품 주문</button>
		</div>
	</div>
</div>

<script>
	if('${status}' == 'update_failed') {
		alert('수량 업데이트 실패');
	}
</script>

<%@ include file="../bottom.jspf" %>

</body>
</html>