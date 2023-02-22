<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>공지사항 목록</title>
	<%@ include file="../admin_cdn.jspf" %>
</head>
<body>
	<%@ include file="../admin_header.jspf" %>
	
	<div class="notice-content shadow">
		<div class="notice-title"><h1>공지사항 목록</h1></div>
		<div class="container">
			<table class="notice-board table table-hover">
				<thead class="table-secondary">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${notices}" var="notice">
						<tr onclick="location.href='<%=request.getContextPath()%>/admin/notice/modify?notice_num=${notice.notice_num}'">
							<td>${notice.notice_num}</td>
							<td>${notice.notice_title}</td>
							<td>${notice.creationDateTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<ul class="pagination justify-content-center">
					<li><a href="#" class="pagination-btn text-secondary">◀</a></li>
					<li><a href="#" class="pagination-btn text-secondary">1</a></li>
					<li><a href="#" class="pagination-btn text-secondary">2</a></li>
					<li><a href="#" class="pagination-btn text-secondary">3</a></li>
					<li><a href="#" class="pagination-btn text-secondary">4</a></li>
					<li><a href="#" class="pagination-btn text-secondary">5</a></li>
					<li><a href="#" class="pagination-btn text-secondary">▶</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<%@ include file="../admin_footer.jspf" %>
</body>
</html>