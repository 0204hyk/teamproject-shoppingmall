<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<link
	href="<%=request.getContextPath()%>/resources/mypage/css/mypage_main.css?ver=1"
	rel="stylesheet" />
<%@include file="../header.jspf"%>
</head>
<body>
	<div style="margin: 20px auto; width: 90%; text-align: center;">
		<div class="qna_history_title">나의 문의 내역</div>
		<div class="qna_histoy_content">
			<table id="qna_table">
				<tr>
					<th id="category">분류</th>
					<th id="title">제목</th>
					<th id="date">등록일</th>
					<th id="reply">답변</th>
				</tr>
				<c:forEach items="${qnas }" var="qna">
					<input type="hidden" value="${qna.qna_num }" class="num">
					<tr>
						<td>${qna.qna_category }</td>
						<td id="qna_content">
							<button class="content" style="background-color: white; border: 0px; cursor: pointer;">
								${qna.qna_title }
							</button>
						</td>
						<td>${qna.creationQnaDate }</td>
						<c:choose>
							<c:when test="${qna.qna_status eq 0 }">
								<td style="color: gray;">답변 대기중</td>
							</c:when>
							<c:when test="${qna.qna_status eq 1 }">
								<td style="font-weight: bold;">답변 완료</td>
							</c:when>
							<c:otherwise>
								<td>${qna.qna_status }</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			<div class="page" style="margin-top: 50px;">
				<c:if test="${pagination_start > 5 }">
					<a href="./qnaPagination?page=${previous_page }" id="before"><</a>
				</c:if>
				<c:forEach begin="${pagination_start }" end="${pagination_end }"
					var="i">
					<a href="./qnaPagination?page=${i }" class="pages">${i }</a>
				</c:forEach>
				<c:if test="${pagination_end % 5 eq 0 }">
					<a href="./qnaPagination?page=${next_page }" id="next">></a>
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
	console.log('클릭');
    window.opener.location.href = contextPath + '/qna/view?qna_num=' + num ;
    window.close();
});
}
</script>
</body>
</html>