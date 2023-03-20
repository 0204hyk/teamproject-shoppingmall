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
<link rel="icon" href="<%=request.getContextPath()%>/resources/review/image/파비콘.png">
<link rel="stylesheet"href="<%=request.getContextPath()%>/resources/shop/css/product_detail.css?ver=5">
<script src="<%=request.getContextPath()%>/resources/shop/js/product_detail.js?ver=1" defer></script>
</head>
<body>

	<%@ include file="../top.jspf" %>

	<div class="main" style="padding-top: 127px;  width: auto; margin:50px; margin-top: 0px;">
	<c:choose>
		<c:when test="${param.status eq 'added_to_cart'}">
			<dialog id="cart_dialog" open>
			  <p>장바구니에 추가 되었습니다.</p>
				<button onclick="location.href='<%=request.getContextPath()%>/shop/cart'">장바구니로 이동</button>
				<button onclick="close_dialog();">계속 쇼핑하기</button>
			</dialog>
		</c:when>
		<c:when test="${param.status eq 'failed_to_cart'}">
			<script>
				alert('실패');
			</script>
		</c:when>
	</c:choose>
	<hr>
			<div class="top">
				<div class="left">
					<img src="${product.product_thumbnail_1 }" id="test">
					<div id="thumbnail">
						<c:if test="${not empty product.product_thumbnail_2 }">
							<button id="tb_1"><img src="${product.product_thumbnail_1 }" ></button>
							<button id="tb_2"><img src="${product.product_thumbnail_2 }" ></button>
							<input type="hidden" value="${product.product_thumbnail_1 }" id="tbi_1">
							<input type="hidden" value="${product.product_thumbnail_2 }" id="tbi_2">
						</c:if>
						<c:if test="${not empty product.product_thumbnail_3 }">
							<button id="tb_3"><img src="${product.product_thumbnail_3 }"></button>
							<input type="hidden" value="${product.product_thumbnail_3 }" id="tbi_3">
						</c:if>
					</div>
				</div>
				<div class="right">
					<h1 id="product_name">${product.product_name }</h1>
					<c:choose>
						<c:when test="${not empty sessionScope.signIn.mem_id }">
								<c:if test="${wish eq sessionScope.signIn.mem_id}">		
									<button class="heart" id="wish" ><i class="fa-solid fa-heart fa-2x"></i></button>
									<button class="heart" id="nowish" style="display: none;"><i class="fa-regular fa-heart fa-2x"></i></button>	
								</c:if>
								<c:if test="${wish ne sessionScope.signIn.mem_id}">
									<button class="heart" id="wish" style="display: none;"><i class="fa-solid fa-heart fa-2x"></i></button>
									<button class="heart" id="nowish"><i class="fa-regular fa-heart fa-2x"></i></button>
								</c:if>
						</c:when>
						<c:otherwise>
							<button class="heart" id="wish" style="display: none;"><i class="fa-solid fa-heart fa-2x"></i></button>
							<button class="heart" id="nowish"><i class="fa-regular fa-heart fa-2x"></i></button>
						</c:otherwise>
					</c:choose>
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
					<hr>
					<div style="margin: 40px 0;">
					주문수량 <span id="cntinfo"></span> <br>
					총 주문금액 <span id="priceinfo"></span>
					</div>
					<hr>
					<input type="hidden" id="product_num" value="${product.product_num }" name="product_num">
					<input type="hidden" value="1" id="order_cnt" name="order_cnt">
					<input type="hidden" id="cart_product_price" name="cart_product_price"/>
					<input type="submit" value="주문하기" formaction="../order/order_directly" id="order" disabled>
					<input type="submit" value="장바구니" formaction="./insert_cart" id="cart" disabled>
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
				${product.product_detail }
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
							<c:choose>
								<c:when test="${not empty review.review_img_1}">
									<th rowspan="2" id="review_img"><img src="<%=request.getContextPath()%>/resources/review/image/${review.review_img_1 }"></th>
								</c:when>
								<c:otherwise>								
									<th rowspan="2" id="review_img"></th>
								</c:otherwise>
							</c:choose>
							<th class="id" style="width: 200px;">${review.maskingName }/${review.creationReviewDate }</th>
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
							<td class="qna_con">${qna.creationQnaDate }</td>
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