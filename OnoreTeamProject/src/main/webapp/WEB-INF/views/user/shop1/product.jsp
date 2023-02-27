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
<link rel="stylesheet"href="/project/resources/shop1/css/product_detail.css?ver=4">
<script src="/project/resources/shop1/js/product_detail.js" defer></script>
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
					<select name="size" id="size">
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
					<select name="hiddenheel" id="heel">
						<option value="default" selected>선택하세요</option>
						<option value="plusheel">속굽추가 | 총 굽높이 5cm (EVENT)</option>
						<option value="noheel">추가안함 | 총 굽높이 4cm</option>
					</select><br>	
				SOLE <br>
					<select name="sole" id="sole">
						<option value="default" selected>선택하세요</option>
						<option value="clear">Clear Detail Sole</option>
						<option value="black">All Black Sole</option>
					</select><br>
				<hr>
				주문수량 1 개<br>
				총 상품금액 ${product.product_price }원<br>
				<hr>
				<input type="submit" value="주문하기">
				<input type="submit" value="장바구니">
				</form>
			</div>
		</div>
		<hr>
		<div class="mid">
		<div id="header">
			<nav class="nav">
				<a href="#mid"><span>제품상세</span></a>
				<a href="#review"><span>리뷰</span></a>
				<a href="#qna"><span>문의</span></a>
			</nav>
		</div>
			<div id="detail">
				<img src="/project/resources/shop1/images/doby/doby1.jpg">
				<img src="/project/resources/shop1/images/doby/doby2.jpg">
				<img src="/project/resources/shop1/images/doby/doby3.jpg">
				<img src="/project/resources/shop1/images/doby/doby4.jpg">
				<img src="/project/resources/shop1/images/doby/doby5.jpg">
			</div>
		</div>
		<hr>
		<div class="bottom">
			<div class="review">
			<h3>후기(리뷰게시판에 검색(해당상품)결과로 넘어가게하기)</h3>
			<hr>
				<table id="review-table">
					<c:forEach items="${reviews }" var="review">
						<tr>
							<th rowspan="2" id="review_img"><img src="${review.review_img_1 }"></th>
							<th style="width: 200px;">${review.mem_id }/${review.review_date }</th>
							<c:if test="${review.review_rating eq 5 }">
								<th class="star">
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
								</th>
							</c:if>
							<c:if test="${review.review_rating eq 4 }">
								<th class="star">
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-regular fa-star"></i>
								</th>
							</c:if>
							<c:if test="${review.review_rating eq 3 }">
								<th class="star">
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-regular fa-star"></i>
									<i class="fa-regular fa-star"></i>	
								</th>
							</c:if>
							<c:if test="${review.review_rating eq 2 }">
								<th class="star">
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-regular fa-star"></i>
									<i class="fa-regular fa-star"></i>
									<i class="fa-regular fa-star"></i>
								</th>
							</c:if>
							<c:if test="${review.review_rating eq 1 }">
								<th class="star">
									<i class="fa-solid fa-star"></i>
									<i class="fa-regular fa-star"></i>
									<i class="fa-regular fa-star"></i>
									<i class="fa-regular fa-star"></i>
									<i class="fa-regular fa-star"></i>
								</th>
							</c:if>
						</tr>
						<tr>
							<td colspan="2">${review.review_content }</td>
						</tr>
				</c:forEach>
			</table>
			</div>
			<div class="qna">
				<h3>Q & A(문의게시판 나중에 연동예정)</h3>
			<hr>
				<table id="qna-table">
					<c:forEach items="${reviews }" var="review">
						<tr>
							<th>번호</th>
							<th>제목</th>	
							<th>글쓴이</th>
							<th>등록일</th>
							<th>답변상태</th>
						</tr>
						<tr>
							<td>${review.review_num }</td>
							<td>${review.review_content }</td>
							<td>${review.mem_id }</td>
							<td>${review.review_date }</td>
							<td>${review.review_rating }</td>
						</tr>
				</c:forEach>
			</table>
			</div>
		</div>
			
	</div>
	<hr>
	
	<%@ include file="../bottom.jspf" %>

</body>
</html>