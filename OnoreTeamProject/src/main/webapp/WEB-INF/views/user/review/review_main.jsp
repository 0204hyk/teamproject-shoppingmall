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
</head>
<body>

	<%@ include file="../top.jspf" %>

	
	<div class="main" style="padding-top: 127px;  width: auto; height: 800px; margin:50px; margin-top: 0px;">
	<hr>
		<div class="board" style="padding: 60px;">
			<table border-bottom="1px">
				<th id="num">번호</th>
				<th id="prduct">상품이름</th>
				<th id="title">제목</th>
				<th id="writer">글쓴이</th>
				<th id="date">등록일</th>
				<th id="rating">평점</th>
				
				<c:forEach items="${reviews }" var="review">
				<tr>
					<td>${review.review_num }</td>
					<td id="prduct_name">${review.product_num }</td>
					<td id="review_content">${review.review_content }</td>
					<td id="mem_id">${review.mem_id }</td>
					<td>${review.review_date }</td>
					<c:if test="${review.review_rating eq 5 }">
						<td>★★★★★</td>
					</c:if>
					<c:if test="${review.review_rating eq 4 }">
						<td>★★★★☆</td>
					</c:if>
					<c:if test="${review.review_rating eq 3 }">
						<td>★★★☆☆</td>
					</c:if>
					<c:if test="${review.review_rating eq 2 }">
						<td>★★☆☆☆</td>
					</c:if>
					<c:if test="${review.review_rating eq 1 }">
						<td>★☆☆☆☆</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			
			<button onclick="location.href='./write'">글쓰기</button>
			
		</div>
	</div>
	
	<hr>
	
	<%@ include file="../bottom.jspf" %>

</body>
</html>