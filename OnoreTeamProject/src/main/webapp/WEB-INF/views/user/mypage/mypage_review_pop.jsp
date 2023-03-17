<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<link href="<%=request.getContextPath() %>/resources/mypage/css/mypage_main.css?ver=1" rel="stylesheet"/>
<%@include file="../header.jspf"%>
</head>
<body>
	<div style="margin: 20px auto; width: 90%; text-align: center;">
	<div class="review_history_title">나의 리뷰 내역</div>
       		<div class="review_histoy_content">
        	<table id="review_table">
        	<tr>
				<th id="product">상품이름</th>
				<th id="title">제목</th>
				<th id="date">등록일</th>
				<th id="rating">평점</th>
			</tr>	
				<c:forEach items="${reviews }" var="review">
					<input type="hidden" value="${review.review_num }" class="num">
				<tr>
					<td>${review.product_name }</td>
					<td id="review_content"><button class="content" style="background-color: white; border: 0px; cursor:pointer;">
					${review.review_content }</button></td>
					<td>${review.creationReviewDate }</td>
					<c:if test="${review.review_rating eq 5 }">
						<td class="star">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 4 }">
						<td class="star">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 3 }">
						<td class="star">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 2 }">
						<td class="star">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
							<i class="fa-regular fa-star"></i>
						</td>
					</c:if>
					<c:if test="${review.review_rating eq 1 }">
						<td class="star">
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
			<div class="page" style="margin-top: 50px;">
				<c:if test="${pagination_start > 5 }">
					<a href="./pagenation?page=${previous_page }" id="before"><</a>
				</c:if>
				<c:forEach begin="${pagination_start }" end="${pagination_end }" var="i">
					<a href="./pagenation?page=${i }" class="pages">${i }</a>
				</c:forEach>
				<c:if test="${pagination_end % 5 eq 0 }">
					<a href="./pagenation?page=${next_page }" id="next">></a>
				</c:if>
			</div>
		</div>
	</div>
<script>
const test = document.getElementsByClassName('content');

for (var i = 0; i < test.length; ++i) {
const test2 = document.getElementsByClassName('content')[i];
console.log(test2);
const num = document.getElementsByClassName('num')[i].value;
console.log(num);
test2.addEventListener('click', (e) =>{
    window.opener.location.href = contextPath + '/review/detail?review_num=' + num ;
    window.close();
});
}
</script>
</body>
</html>