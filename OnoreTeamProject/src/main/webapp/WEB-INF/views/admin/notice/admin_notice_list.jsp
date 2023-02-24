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
		<form action="<%=request.getContextPath()%>/admin/notice/delete" method="POST">
			<div class="container">
				<table class="notice-board table table-hover">
					<thead class="table-secondary">
						<tr>
							<th><input type="checkbox" id="all-check"/></th>
							<th>NO</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${notices}" var="notice">
							<tr>
								<td style="width: 50px;"><input type="checkbox" class="row-check" name="row_check" value="${notice.notice_num}"/></td>
								<td style="width: 80px;">${notice.notice_num}</td>
								<td><a href="<%=request.getContextPath()%>/admin/notice/modify?notice_num=${notice.notice_num}">${notice.notice_title}</a></td>
								<td style="width: 200px;">${notice.creationDateTime}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right;">
					<ul class="pagination justify-content-center" style="font-size: 20px;">
						<li><a href="#" class="pagination-btn text-secondary">◀</a></li>
						<li><a href="#" class="pagination-btn text-secondary">1</a></li>
						<li><a href="#" class="pagination-btn text-secondary">2</a></li>
						<li><a href="#" class="pagination-btn text-secondary">3</a></li>
						<li><a href="#" class="pagination-btn text-secondary">4</a></li>
						<li><a href="#" class="pagination-btn text-secondary">5</a></li>
						<li><a href="#" class="pagination-btn text-secondary">▶</a></li>
					</ul>
					<input type="submit" class="submit-btn btn btn-secondary btn-lg" value="삭 제"/>
					<input type="button" onclick="location.href='<%=request.getContextPath()%>/admin/notice/write'" class="submit-btn btn btn-secondary btn-lg" value="등 록"/>			
				</div>
			</div>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/project/resources/admin/js/notice_list.js"></script>
	<%@ include file="../admin_footer.jspf" %>
</body>
</html>