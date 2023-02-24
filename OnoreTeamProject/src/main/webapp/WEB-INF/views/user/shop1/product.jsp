<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf" %>
<link rel="icon" href="/project/resources/review/image/파비콘.png">
<link rel="stylesheet"href="/project/resources/shop1/css/product_detail.css">
</head>
<body>

	<%@ include file="../top.jspf" %>

	<div class="main" style="padding-top: 127px;  width: auto; margin:50px; margin-top: 0px;">
	<hr>
		<div class="top">
			<div class="left">
				<img src="${product.product_thumbnail }" id="test">
			</div>
			<div class="right">
				<h3>${product.product_name }</h3>
				<h5>★★★★★</h5>
				<hr>
				${product.product_info }
				<hr>
				${product.product_price }원
				<br>
				<form action="/order" method="POST">
				SIZE<br>
					<select name="size">
						<option value="default" selected>선택하세요</option>
						<option value="240">240</option>
						<option value="245">250</option>
						<option value="250">250</option>
						<option value="255">255</option>
						<option value="260">260</option>
						<option value="265">265</option>
						<option value="270">270</option>
						<option value="275">275</option>
						<option value="280">280</option>
					</select><br>
				HIDDEN HEEL<br>
					<select name="hiddenheel">
						<option value="default" selected>선택하세요</option>
						<option value="plusheel">속굽추가 | 총 굽높이 5cm (EVENT)</option>
						<option value="noheel">추가안함 | 총 굽높이 4cm</option>
					</select><br>	
				SOLE <br>
					<select name="sole">
						<option value="default" selected>선택하세요</option>
						<option value="clear">Clear Detail Sole</option>
						<option value="black">All Black Sole</option>
					</select><br>
				<hr>
				주문수량 0 개<br>
				총 상품금액 269,0000원<br>
				<hr>
				<input type="submit" value="주문하기">
				<button> 장바구니 담기</button>
				</form>
			</div>
		</div>
		<hr>
		<div class="">
		
		</div>
			
	</div>
	<hr>
	
	<%@ include file="../bottom.jspf" %>

</body>
</html>