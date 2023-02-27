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
		<div class="notice-title"><h1>공지사항 목록</h1></div>
		<form id="notice-list-form" name="notice-list-form" method="POST">
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
								<td><a href="javascript:movePageByGet('<%=request.getContextPath()%>/admin/notice/modify?notice_num=${notice.notice_num}')">${notice.notice_title}</a></td>
								<td style="width: 200px;">${notice.creationDateTime}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right;">
					<ul class="pagination justify-content-center" style="margin-bottom: 0px;">
						<li class="page-item"><a class="page-link" href="#">이전</a></li>						
						<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
					    <li class="page-item">
					    	<a class="page-link" href="<%=request.getContextPath()%>/admin/notice/list">${i}</a>
					    </li>
					    </c:forEach>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>				    
					</ul>
									
<!-- 				<ul class="pagination justify-content-center" style="font-size: 20px; margin-bottom: 0px;">
						<li><a href="#" class="pagination-btn text-secondary" id="prev-btn">◀</a></li>
						<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
							<li><a href="<%=request.getContextPath()%>/admin/notice/list?page=${i}" class="pagination-btn text-secondary">${i}</a></li>
						</c:forEach>
						<li><a href="#" class="pagination-btn text-secondary" id="next-btn">▶</a></li>
					</ul> -->
					<input type="button" id="notice-delete-btn" class="submit-btn btn btn-secondary btn-lg" value="삭 제"/>
					<input type="button" onclick="movePageByGet('<%=request.getContextPath()%>/admin/notice/write')" class="submit-btn btn btn-secondary btn-lg" value="등 록"/>			
				</div>
			</div>
		</form>
	</div>
	
		<script>
        	$(document).ready(function(){
        	    $('#notice-delete-btn').click(function() {
					if ($("input:checkbox[name=row_check]:checked").length == 0) {
						alert('삭제할 항목을 선택해주세요.');
					} else {
						var result = confirm('삭제하시겠습니까?');
	
						if(result) {
							var formData = $('#notice-list-form').serialize();
							
							var checked = $("input:checkbox[name=row_check]:checked").length;
							$.ajax({
								url: "<%=request.getContextPath()%>/admin/notice/delete",
								type: "POST",
								cache: false,
								data: formData,
								cache : false,
								success: function(data){
									alert(checked + "개의 글을 삭제하였습니다.");
									movePageByGet('<%=request.getContextPath()%>/admin/notice/list');
								},
								error: function (request, status, error){        
									console.log(error);
								}
							})     
						} else {
							
						}
					}
        	    });
        	});
	</script>
	<script src="/project/resources/admin/js/notice_list.js"></script>
	
</body>
</html>