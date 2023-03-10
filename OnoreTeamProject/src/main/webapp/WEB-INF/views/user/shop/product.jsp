<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf" %>
<link rel="icon" href="/project/resources/review/image/파비콘.png">
<link rel="stylesheet"href="/project/resources/shop/css/product_detail.css?ver=5">
<script src="/project/resources/shop/js/product_detail.js?ver=1" defer></script>
</head>
<body>

	<%@ include file="../top.jspf" %>

	<div class="main" style="padding-top: 127px;  width: auto; margin:50px; margin-top: 0px;">
	<hr>
		<div class="top">
			<div class="left">
				<img src="${product.product_thumbnail_1 }" id="test">
			</div>
			<div class="right">
				<h1 id="product_name">${product.product_name }</h1>
				<button class="heart" id="nowish"><i class="fa-regular fa-heart fa-2x"></i></button>
				<button class="heart" id="wish" style="display: none;"><i class="fa-solid fa-heart fa-2x"></i></button>
				<span style="display: none;" id="mem_id">${sessionScope.signIn.mem_id }</span>
				<hr style="margin-top: 20px;">
				<div id="info"><br>${product.product_info }</div>
				<hr style="margin-top: 50px;" >
				<div id="price"  style="display: none;">${product.product_price }</div>
				 
				<div id="prices"><fmt:formatNumber value="${product.product_price }" pattern="#,###" /> 원</div>
				
				<form method="POST" id="form">
				
				<div class="option">SIZE</div>
					<select name="size" id="size">
						<option value="default" selected>선택하세요</option>
						<option value="240">240</option>
						<option value="245">245</option>
						<option value="250">250</option>
						<option value="255">255</option>
						<option value="260">260</option>
						<option value="265">265</option>
						<option value="270">270</option>
						<option value="275">275</option>
						<option value="280">280</option>
					</select>
					
				<div class="option">HIDDEN HEEL</div>
					<select name="heel" id="heel" disabled>
						<option value="default" selected>선택하세요</option>
						<option value="속굽추가 | 총 굽높이 5cm (EVENT)">속굽추가 | 총 굽높이 5cm (EVENT)</option>
						<option value="추가안함 | 총 굽높이 4cm">추가안함 | 총 굽높이 4cm</option>
					</select>
						
				<div class="option">SOLE</div>
					<select name="sole" id="sole" disabled>
						<option value="default" selected>선택하세요</option>
						<option value="Clear Detail Sole">Clear Detail Sole</option>
						<option value="All Black Sole">All Black Sole</option>
					</select>
					
				<br>
				
				<div class="option">수량</div>
				<div id="select" style="display: flex;">
        		<input type ="button" onclick='count("minus")' value="-" class="count" id="minus" disabled>
       			<div id='result'>1</div>
				<input type ="button" onclick='count("plus")' value="+" class="count" id="plus" disabled>
				</div>
				<br>
				<hr>
				<div style="margin-bottom: 30px;">
				주문수량 <span id="cntinfo"></span> <br>
				총 주문금액 <span id="priceinfo"></span>
				</div>
				<hr>
				<input type="hidden" value="${product.product_num }" name="product_num" id="product_num">
				<input type="hidden" value="" id="order_cnt" name="order_cnt">
				<input type="submit" value="주문하기" formaction="../order" id="order" disabled>
				<input type="submit" value="장바구니" formaction="./cart" id="cart" disabled>
				</form>
			</div>
		</div>
		<hr>
		<div class="mid">
		<div id="header">
			<nav class="nav">
				<a href="#mid" onclick="move(detail)"><span id="detailView">제품상세</span></a>
				<a href="#review" onclick="move(review)"><span id="reviewView">리뷰</span></a>
				<a href="#qna" onclick="move(qna)"><span id="qnaView">문의</span></a>
			</nav>
		</div>
			<div id="detail">
				<img src="/project/resources/shop/image/doby/doby1.jpg">
				<img src="/project/resources/shop/image/doby/doby2.jpg">
				<img src="/project/resources/shop/image/doby/doby3.jpg">
				<img src="/project/resources/shop/image/doby/doby4.jpg">
				<img src="/project/resources/shop/image/doby/doby5.jpg">
			</div>
		</div>
		<hr>
		<div class="bottom">
			<div class="review">
			<h3>후기</h3>
			<br>
			<hr>
				<table id="review-table">
					<c:forEach items="${reviews }" var="review">
						<tr>
							<th rowspan="2" id="review_img"><img src="${review.review_img_1 }"></th>
							<th class="id" style="width: 200px;">${review.maskingName }/${review.review_date }</th>
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
							<td class="contents" colspan="2">${review.review_content }</td>
						</tr>
				</c:forEach>
			</table>
			<button id="review">리뷰쓰기</button>
			</div>
			<div class="qna">
				<h3>Q & A</h3>
			<br>
				<table>
					<c:forEach items="${qnas }" var="qna">
						<tr>
							<th class="title">번호</th>
							<th class="title">제목</th>	
							<th class="title">글쓴이</th>
							<th class="title">등록일</th>
							<th class="title">답변상태</th>
						</tr>
						<tr>
							<td class="qna_con">${qna.qna_num }</td>
							<td class="qna_con" id="con">${qna.qna_title }</td>
							<td class="qna_con">${qna.maskingName }</td>
							<td class="qna_con">${qna.qna_date }</td>
							<td class="qna_con">
								<c:choose>
									<c:when test="${qna.qna_status eq 0 }">
										<span id="answer">답변 대기중</span>
									</c:when>
									<c:when test="${qna.qna_status eq 1 }">
										<span id="answer">답변 완료</span>
									</c:when>
									<c:otherwise>
										<span id="answer">${qna.qna_status }</span>
									</c:otherwise>
								</c:choose>
							</td>
						</tr> 
				</c:forEach>
			</table>
			<button id="qna">문의하기</button>
			</div>
		</div>
			<br>
	</div>
	<hr>
	
	<%@ include file="../bottom.jspf" %>

</body>
</html>