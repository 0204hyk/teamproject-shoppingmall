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
<link rel="stylesheet"href="/project/resources/shop1/css/product_detail.css?ver=5">
<script src="/project/resources/shop1/js/product_detail.js?ver=1" defer></script>
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
				<h1 id="product_name">${product.product_name }</h1>
				<button class="heart"><i class="fa-regular fa-heart fa-2x"></i></button>
				<hr style="margin-top: 20px;">
				<div id="info"><br>${product.product_info }</div>
				<hr style="margin-top: 50px;" >
				<div id="price">${product.product_price }원</div>
				
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
					
				
				<div id="select" style="display: grid;"></div>
				<div id="cnt" style="display:none;">
        		<input type ="button" onclick='count("minus")' value="-" class="count">
       			<div id='result'>1</div>
				<input type ="button" onclick='count("plus")' value="+" class="count">
        		</div>
				<hr>
				<div style="margin: 40px 0;">
				주문수량 <span id="cntinfo"></span> <br>
				총 주문금액 <span id="priceinfo"></span>
				</div>
				<hr>
				<input type="submit" value="주문하기" formaction="../order" id="order">
				<input type="submit" value="장바구니" formaction="./cart" id="cart">
				</form>
			</div>
		</div>
		<hr>
		<div class="mid">
		<div id="header">
			<nav class="nav">
				<a href="#mid"><span id="detailView">제품상세</span></a>
				<a href="#review"><span id="reviewView">리뷰</span></a>
				<a href="#qna"><span id="qnaView">문의</span></a>
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
			</div>
			<div class="qna">
				<h3>Q & A(문의게시판 나중에 연동예정)</h3>
			<br>
				<table>
					<c:forEach items="${reviews }" var="review">
						<tr>
							<th class="title">번호</th>
							<th class="title">제목</th>	
							<th class="title">글쓴이</th>
							<th class="title">등록일</th>
							<th class="title">답변상태</th>
						</tr>
						<tr>
							<td class="qna_con">${review.review_num }</td>
							<td class="qna_con" id="con">문의제목</td>
							<td class="qna_con">${review.mem_id }</td>
							<td class="qna_con">${review.review_date }</td>
							<td class="qna_con"><span id="answer">답변완료</span></td>
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