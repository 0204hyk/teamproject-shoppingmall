<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>공지사항 목록</title>
</head>
<body>
	
	<div class="notice-content shadow">
		<div class="notice-title">
			<h1>공지사항 목록</h1>
			<select name="search_type" class="form-select search-type">
				<c:choose>
					<c:when test="${search_type eq 'title'}">
						<option value="title" selected>제목</option>
						<option value="content">내용</option>				
					</c:when>
					<c:when test="${search_type eq 'content'}">
						<option value="title">제목</option>
						<option value="content" selected>내용</option>
					</c:when>
					<c:otherwise>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</c:otherwise>
				</c:choose>
			</select>
			<input type="text" class="form-control search-box" name="search_keyword" placeholder="검색어를 입력해주세요." value="${search_keyword}"/>
			<button type="submit" id="search-btn" style="color: gray;"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
		<form id="notice-list-form" name="notice-list-form" method="POST">
			<div class="container">
				<table class="notice-board table table-hover">
					<thead class="table-secondary">
						<tr>
							<th><input type="checkbox" id="all-check"/></th>
							<th>NO</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeList}" var="notice">
							<tr>
								<td style="width: 50px;"><input type="checkbox" class="row-check" name="row_check" value="${notice.notice_num}"/></td>
								<td style="width: 80px;">${notice.notice_num}</td>
								<td><a href="javascript:movePageByGet('<%=request.getContextPath()%>/admin/notice/modify?notice_num=${notice.notice_num}')">${notice.notice_title}</a></td>
								<td style="width: 150px;">관리자</td>
								<td style="width: 200px;">${notice.creationNoticeDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right;">
					<ul class="pagination justify-content-center" style="margin-bottom: 0px;">
						<c:if test="${prev == true}">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/notice/list?page=${pagination_start - 1}&search_type=${search_type}&search_keyword=${search_keyword}')">«</a>
							</li>												
						</c:if>
						
						<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
							<c:if test="${page == i}">
						    	<li class="page-item active">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/notice/list?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
							<c:if test="${page != i}">
						    	<li class="page-item">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/notice/list?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
						</c:forEach>
						
					    <c:if test="${next == true }">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/notice/list?page=${pagination_end + 1}&search_type=${search_type}&search_keyword=${search_keyword}')">»</a>
							</li>				    					    
					    </c:if>
					</ul>
					<input type="button" id="notice-delete-btn" class="submit-btn btn btn-secondary btn-lg" value="삭 제"/>
					<input type="button" onclick="movePageByGet('<%=request.getContextPath()%>/admin/notice/write')" class="submit-btn btn btn-secondary btn-lg" value="등 록"/>			
				</div>
			</div>
		</form>
	</div>

	<script src="<%=request.getContextPath()%>/resources/admin/js/notice_list.js"></script>
	<script src="<%=request.getContextPath()%>/resources/admin/js/list_checkbox.js"></script>
	
</body>
</html>