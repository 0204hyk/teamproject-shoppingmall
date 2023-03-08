<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%@ include file="../header.jspf" %>
<link rel="icon" href="/project/resources/shop/image/파비콘.png">
</head>
<body>
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
					<th scope="col"><input type="checkbox" value="product_all"/></th>
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
				<c:forEach begin="0" end="${cart_list.size() - 1}" var="i">
					<tr class="cart_body">
						<td><input type="checkbox" value="${cart_product_list.get(i).product_num}" checked/></td>
						<td><img src="${cart_product_list.get(i).product_thumbnail_1}"
										alt="${cart_product_list.get(i).product_name}"/></td>
						<td style="text-align: left; padding-left: 25px;">
							<div class="product_name">${cart_product_list.get(i).product_name}</div>
							<div class="product_options">${cart_list.get(i).cart_product_option}</div>
						</td>
						<td>${cart_product_list.get(i).product_price}</td>
						<td>
							<input type="number" value="${cart_list.get(i).cart_product_qty}" min="0" max="99"
																style="width: 30px; text-align: center;"/> <br>
							<button>변경</button>
						</td>
						<td>최대<br>${cart_product_list.get(i).product_price / 100 * 3 + 1000}원</td>
						<td>무료</td>
						<td>${cart_list.get(i).cart_product_qty * cart_product_list.get(i).product_price}원</td>
						<td>
							<button class="order_single_btn">주문하기</button>
							<button class="delete_single_btn">삭제하기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9">
						<b>상품 구매 금액: ${cart_list.get(i).cart_product_qty * cart_product_list.get(i).product_price}원 + 
							배송비 무료 = 총 ${cart_list.get(i).cart_product_qty * cart_product_list.get(i).product_price}원</b>
					</td>
				</tr>
				<tr>
					<td class="sub-button_container" colspan="9">
						<button class="delete_all_btn">장바구니 비우기</button>
						<button class="delete_selected_btn">선택상품 삭제</button>
					</td>
				</tr>
			</tfoot>
		</table>
		<div class="order-button_container">
			<button onclick="" class="order_selected_btn">선택 상품 주문</button>
			<button onclick="" class="order_all_btn">전체 상품 주문</button>
		</div>
	</div>
</div>

<%@ include file="../bottom.jspf" %>

</body>
</html>