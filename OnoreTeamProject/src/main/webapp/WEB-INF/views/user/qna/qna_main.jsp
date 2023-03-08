<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 Q&A</title>
<%@include file="../header.jspf"%>
<link rel="icon" href="/project/resources/qna/images/favicon.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/project/resources/qna/css/qna_main.css" />
</head>
<body>
	<%@include file="../top.jspf"%>

	<div class="main" style="padding-top: 127px; width: auto; margin: 50px; margin-top: 0px;">
		<hr />
		<div class="board" style="padding: 60px;">
			<table>
				<tr>
					<th id="num" class="title">번호</th>
					<th id="product" class="title">분류</th>
				 	<th id="img"> </th>
					<th id="title" class="title">제목</th>
					<th id="writer" class="title">글쓴이</th>
					<th id="date" class="title">등록일</th>
					<th id="reply" class="title">답변</th>
				</tr>
				<c:forEach items="${qnas }" var="qna">
					<tr>
						<td>${qna.qna_num }</td>
						<td>${qna.qna_category }</td>
						
						<c:choose>
							<c:when test="${not empty qna.product_thumbnail_1}">
								<td><img style="width: 40px; height: 40px;" src=${qna.product_thumbnail_1 }></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
	
						<td id="qna_title"><a href="./view?qna_num=${qna.qna_num}">${qna.qna_title }</a></td>
						<td id="mem_id">${qna.maskingName }</td>
						<td>${qna.qna_date}</td>
						<c:choose>
							<c:when test="${qna.qna_status eq 0 }">
								<td>답변 대기중</td>
							</c:when>
							<c:when test="${qna.qna_status eq 1 }">
								<td>답변 완료</td>
							</c:when>
							<c:otherwise>
								<td>${qna.qna_status }</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			<button onclick="location.href='./qna_write'">글쓰기</button>
			<div class="page">
				<c:if test="${pagination_start > 5 }">
					<a href="./main?page=${previous_page }"><</a>
				</c:if>
				<c:forEach begin="${pagination_start }" end="${pagination_end }" var="i">
					<a href="./main?page=${i }">${i }</a>
				</c:forEach>
				<c:if test="${pagination_end % 5 eq 0 }">
					<a href="./main?page=${next_page }">></a>
				</c:if>
			</div>
		</div>
	</div>
	
	<hr>
	
	<%@include file="../bottom.jspf"%>
</body>
</html>