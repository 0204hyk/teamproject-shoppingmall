<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>문의글 목록</title>
</head>
<body>
	
	<div class="board-content shadow">
		<div class="board-title"><h1>문의글 목록</h1></div>
		<form id="qna-list-form" name="qna-list-form" method="POST">
			<div class="container">
				<table class="qna-board table table-hover">
					<thead class="table-secondary">
						<tr>
							<th><input type="checkbox" id="all-check"/></th>
							<th>NO</th>
							<th>이미지</th>
							<th>제 목</th>
							<th>상품명</th>
							<th>분 류</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qnaList}" var="qna">
							<tr>
								<td style="width: 50px; vertical-align: middle;"><input type="checkbox" class="row-check" name="row_check" value="${qna.qna_num}"/></td>
								<td style="width: 80px; vertical-align: middle;">${qna.qna_num}</td>
								<c:choose>
									<c:when test="${empty qna.qna_img_1}">
										<td style="width: 200px;"><img src="<%=request.getContextPath()%>/resources/admin/image/default_image.png" alt="이미지 미리보기" style="width: 100px; height: 100px; border-radius: 10px;"/></td>
									</c:when>
									<c:otherwise>							
										<td style="width: 200px;"><img src="${qna.qna_img_path}${qna.qna_img_1}" alt="이미지 미리보기" style="width: 100px; height: 100px; border-radius: 10px;"/></td>
									</c:otherwise>
								</c:choose>
								<td id="qna-title" style="vertical-align: middle;"><a href="">${qna.qna_title}</a></td>
								<td style="width: 150px; vertical-align: middle;">${qna.product_name}</td>
								<td style="width: 150px; vertical-align: middle;">${qna.qna_category}</td>
								<td style="width: 150px; vertical-align: middle;">${qna.mem_id}</td>
								<td style="width: 150px; vertical-align: middle;">${qna.creationQnaDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right;">
					<ul class="pagination justify-content-center" style="margin-bottom: 0px;">
						<c:if test="${prev == true}">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/board/qna?page=${pagination_start - 1}')">«</a>
							</li>												
						</c:if>
						
						<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
							<c:if test="${page == i}">
						    	<li class="page-item active">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/board/qna?page=${i}')">${i}</a>
						    	</li>
							</c:if>
							<c:if test="${page != i}">
						    	<li class="page-item">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/board/qna?page=${i}')">${i}</a>
						    	</li>
							</c:if>
						</c:forEach>
						
					    <c:if test="${next == true }">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/board/qna?page=${pagination_end + 1}')">»</a>
							</li>				    					    
					    </c:if>
					</ul>
					<input type="button" id="qna-delete-btn" class="submit-btn btn btn-secondary btn-lg" value="삭 제"/>
				</div>
			</div>
		</form>
	</div>
		
	<script>
        	$(document).ready(function(){
        		var page = <%=request.getParameter("page")%>
        		
        	    $('#qna-delete-btn').click(function() {
					if ($("input:checkbox[name=row_check]:checked").length == 0) {
						alert('삭제할 항목을 선택해주세요.');
					} else {
						var result = confirm('삭제하시겠습니까?');
						
						if(result) {
							var formData = $('#qna-list-form').serialize();
							
							var checked = $("input:checkbox[name=row_check]:checked").length;
							$.ajax({
								url: "<%=request.getContextPath()%>/admin/board/qna/delete",
								type: "POST",
								cache: false,
								data: formData,
								cache : false,
								success: function(data){
									alert(checked + "개의 문의글을 삭제하였습니다.");
									movePageByGet('<%=request.getContextPath()%>/admin/board/qna');
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
	<script src="/project/resources/admin/js/list_checkbox.js"></script>
	
</body>
</html>