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
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/notice/css/notice_main.css">
</head>
<body>

	<%@ include file="../top.jspf" %>

	<div class="main" style="padding-top: 127px;  margin:50px; margin-top: 0px;">
	<hr>
		<div class="notice_div">
			
				<table class="notice">
					<tr>
						<th>번호</th>
						<th >제목</th>
						<th>등록일</th>
						<th>작성자</th>
					</tr>
					<c:forEach items="${notices }" var="notice">
						<tr>
							<td>${notice.notice_num }</td>
							<td class="title"><a href="./detail?notice_num=${notice.notice_num }">${notice.notice_title }</a></td>
							<td>${notice.creationNoticeDate }</td>
							<td>ONORE</td>
						</tr>
					</c:forEach>
				</table>
			
		</div>
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
	
	
	
	<%@ include file="../bottom.jspf" %>

</body>
</html>