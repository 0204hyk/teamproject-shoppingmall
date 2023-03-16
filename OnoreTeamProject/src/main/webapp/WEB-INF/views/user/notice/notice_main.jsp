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
</head>
<body>

	<%@ include file="../top.jspf" %>

	<div class="main" style="padding-top: 127px;  width: auto;  margin:50px; margin-top: 0px;">
	<hr>
		<div>
			<c:forEach items="${notices }" var="notice">
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>작성자</th>
					</tr>
					<tr>
						<td>${notice.notice_num }</td>
						<td><a href="./detail?notice_num=${notice.notice_num }">${notice.notice_title }</a></td>
						<td>${notice.creationNoticeDate }</td>
						<td>ONORE</td>
					</tr>
				</table>
			</c:forEach>
		</div>
		
	</div>
	
	<hr>
	
	<%@ include file="../bottom.jspf" %>

</body>
</html>