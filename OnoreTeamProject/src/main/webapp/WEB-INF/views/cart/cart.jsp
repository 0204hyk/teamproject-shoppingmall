<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%@ include file="../static/header.jspf" %>
<link rel="icon" href="/project/resources/static/images/파비콘.png">
<style type="text/css">
	
	.container {
		margin: 50px;
		margin-top: 0;
		padding-top: 127px;
		width: auto;
	}
	
	.header_container {
		width: 100%;
		padding: 20px 0;
		text-align: center;
	}
	
	.cart_container {
		width: 100%;
		text-align: center;
	}
	
	.cart {
		margin: auto;
	}
	
	.product_name {
		font-size: 20px;
		font-weight: bolder;
	}
	
	table thead .cart_header_outline th {
		padding: 0;
	    border-top: 2px solid black;
	   /*  border-bottom: 2px solid black; */
	}
	
	table thead .cart_header th {
		padding: 12px 0 11px;
	    vertical-align: middle;
	}
	
	table tbody .cart_body td {
		padding: 15px 0;
		line-height: 35px;
	}
	
	table tfoot tr:first-child td {
		padding: 20px 0;
		border-top: 2px solid black;
   		border-bottom: 2px solid black;
	}
	
	button {
		background-color: white;
		color: rgb(120,120,120);
		border-color: rgb(200,200,200);
		border-radius: 5%;
		cursor: pointer;
	}
	
	.sub-button_container {
		width: 100%;
		text-align: right;
		padding: 10px;
	}
	
	.order_single_btn {
		background-color: rgb(100,100,100);
		color: white;
	}
	
	.order-button_container {
		padding: 50px 0;
	}
	
	.order-button_container button {
		width: 150px;
		height: 50px;
		border-color: black;
		border-radius: 0%;
	}
		
	.order_selected_btn {
		background-color: white;
		color: black;
	}
	
	.order_all_btn {
		background-color: black;
		color: white;
	}
	
</style>
</head>
<body>
<%@ include file="../static/top.jspf" %>
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
				<tr class="cart_body">
					<td><input type="checkbox" value="product_001" checked/></td>
					<td><img src="" alt="DODY"/></td>
					<td style="text-align: left; padding-left: 25px;">
						<div class="product_name">DODY</div>
						<div class="product_options">size: 275 / option: </div>
					</td>
					<td>40,900원</td>
					<td>
						<input type="number" min="0" max="99" style="width: 30px; text-align: center;"/> <br>
						<button>변경</button>
					</td>
					<td>최대<br>2,227원</td>
					<td>무료</td>
					<td>40,900원</td>
					<td>
						<button class="order_single_btn">주문하기</button>
						<button class="delete_single_btn">삭제하기</button>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9">
						<b>상품 구매 금액: 40,900원 + 배송비 무료 = 총 40,900원</b>
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

<%@ include file="../static/bottom.jspf" %>

</body>
</html>