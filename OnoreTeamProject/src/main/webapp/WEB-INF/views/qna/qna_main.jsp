<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 Q&A</title>
<%@include file="./header.jspf"%>
<link rel="icon" href="/project/resources/qna/images/favicon.png">
</head>
<body>
	<%@include file="./top.jspf"%>

	<div class="border"
		style="padding-top: 300px; width: auto; height: 800px;">
		<hr>
		<div style="padding-top: 100px">
			<table border="1">
				<tr>
					<th class="title">번호</th>
					<th class="title">분류</th>
				 	<th class="title"></th>
					<th class="title">제목</th>
					<th class="title">글쓴이</th>
					<th class="title">등록일</th>
					<th class="title">답변</th>
				</tr>
				<c:forEach items="${qnas }" var="qna">
					<tr>
						<td>${qna.qna_num }</td>
						<td>${qna.qna_category }</td>
						<td><img style="width: 50px; height: 50px;" src="/project/resources/qna/images/${qna.qna_img_1 }"></td>
						<td><a href="./view?qna_num=${qna.qna_num}">${qna.qna_title }</a></td>
						<td>${qna.mem_id }</td>
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
		</div>
		<hr>
	</div>
	<a class="btn" href="./qna_write">글쓰기</a>
	<%@include file="./bottom.jspf"%>
</body>

</html>