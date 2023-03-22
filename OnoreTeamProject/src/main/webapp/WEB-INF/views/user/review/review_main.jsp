<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf" %>
<link rel="icon" href="<%=request.getContextPath() %>/resources/review/image/파비콘.png">
<link rel="stylesheet"href="<%=request.getContextPath() %>/resources/review/css/review_list.css?ver=1">
</head>
<body>

	<%@ include file="../top.jspf" %>

	
	<div class="main" style="padding-top: 127px; min-height:600px; width: auto;  margin:50px; margin-top: 0px;">
	<hr>
		<div class="board" style="padding: 60px;">
			<table>
			<tr>
				<th id="num">번호</th>
				<th></th>
				<th id="prduct">상품이름</th>
				<th id="title">제목</th>
				<th id="writer">글쓴이</th>
				<th id="date">등록일</th>
				<th id="rating">평점</th>
			</tr>	
				<c:forEach items="${reviews }" var="review">
				<tr>
					<td>${review.review_num }</td>
					<td id="product_name">
						<img src ="${review.product_thumbnail_1}">
					</td>
					<td><span id="prd_name">${review.product_name }</span> </td>
					<td id="review_content"><a href="./detail?review_num=${review.review_num}">
					${review.review_content }</a></td>
					<td id="mem_id">${review.maskingName }</td>
					<td>${review.creationReviewDate }</td>
					<c:if test="${review.review_rating eq 5 }">
						<td>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 4 }">
						<td>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 3 }">
						<td>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 2 }">
						<td>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 1 }">
						<td>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			
			<span id="comment_id" style="display: none;">${sessionScope.signIn.mem_id}</span>
			
			
			<div class="page">
				<c:if test="${pagination_start > 5 }">
					<a href="./list?page=${previous_page }"><</a>
				</c:if>
				<c:forEach begin="${pagination_start }" end="${pagination_end }" var="i">
					<a href="./list?page=${i }">${i }</a>
				</c:forEach>
				<c:if test="${pagination_end % 5 eq 0 }">
					<a href="./list?page=${next_page }"></a>
				</c:if>
			</div>
		</div>
	</div>
	
	
	
	<%@ include file="../bottom.jspf" %>

<script>
	const write = document.getElementById('write_btn');
	const id = document.getElementById('comment_id').innerText;
	
	write.addEventListener('click', (e) => {
	if (id !== "") {
		location.href='./write';
	} else {
		if(confirm('로그인이 필요한 서비스입니다 로그인 하시겠습니까?')){
			location.href= contextPath + '/login';
		}
	}
	});
</script>

</body>
</html>