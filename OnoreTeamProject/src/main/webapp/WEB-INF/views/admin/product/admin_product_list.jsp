<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>상품 목록</title>
</head>
<body>
	
	<div class="product-content shadow" style="height: 830px;">
		<div class="product-title"><h1>상품 목록</h1></div>
		<form id="product-list-form" name="product-list-form" method="POST">
			<div class="container">
				<table class="product-board table table-hover">
					<thead class="table-secondary">
						<tr>
							<th><input type="checkbox" id="all-check"/></th>
							<th>NO</th>
							<th>이미지</th>
							<th style="padding-right: 100px;">상품명</th>
							<th>조회수</th>
							<th>좋아요수</th>
							<th>상품등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList}" var="product">
							<tr>
								<td style="width: 50px; vertical-align: middle;"><input type="checkbox" class="row-check" name="row_check" value="${product.product_num}"/></td>
								<td style="width: 80px; vertical-align: middle;">${product.product_num}</td>
								<c:choose>
									<c:when test="${empty product.product_thumbnail_1}">
										<td style="width: 250px;"><img src="<%=request.getContextPath()%>/resources/admin/image/default_image.png" alt="이미지 미리보기" style="width: 100px; height: 100px;"/></td>
									</c:when>
									<c:otherwise>							
										<td style="width: 250px;"><img src="${product.product_thumbnail_1}" alt="이미지 미리보기" style="width: 100px; height: 100px;"/></td>
									</c:otherwise>
								</c:choose>
								<td style="vertical-align: middle; padding-right: 100px;"><a href="javascript:movePageByGet('<%=request.getContextPath()%>/admin/product/modify?product_num=${product.product_num}')">${product.product_name}</a></td>
								<td style="width: 80px; vertical-align: middle;">${product.product_views}</td>
								<td style="width: 80px; vertical-align: middle;">${product.product_likes}</td>
								<td style="width: 200px; vertical-align: middle;">${product.creationDateTime}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right;">
					<ul class="pagination justify-content-center" style="margin-bottom: 0px;">
						<c:if test="${prev == true}">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/list?page=${pagination_start - 1}')">«</a>
							</li>												
						</c:if>
						
						<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
							<c:if test="${page == i}">
						    	<li class="page-item active">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/list?page=${i}')">${i}</a>
						    	</li>
							</c:if>
							<c:if test="${page != i}">
						    	<li class="page-item">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/list?page=${i}')">${i}</a>
						    	</li>
							</c:if>
						</c:forEach>
						
					    <c:if test="${next == true }">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/list?page=${pagination_end + 1}')">»</a>
							</li>				    					    
					    </c:if>
					</ul>
					<input type="button" id="product-delete-btn" class="submit-btn btn btn-secondary btn-lg" value="삭 제"/>
					<input type="button" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/regist')" class="submit-btn btn btn-secondary btn-lg" value="등 록"/>			
				</div>
			</div>
		</form>
	</div>
		
	<script>
        	$(document).ready(function(){
        		var page = <%=request.getParameter("page")%>
        		
        	    $('#product-delete-btn').click(function() {
					if ($("input:checkbox[name=row_check]:checked").length == 0) {
						alert('삭제할 항목을 선택해주세요.');
					} else {
						var result = confirm('삭제하시겠습니까?');
	
						if(result) {
							var formData = $('#product-list-form').serialize();
							
							var checked = $("input:checkbox[name=row_check]:checked").length;
							$.ajax({
								url: "<%=request.getContextPath()%>/admin/product/delete",
								type: "POST",
								cache: false,
								data: formData,
								cache : false,
								success: function(data){
									alert(checked + "개의 상품을 삭제하였습니다.");
									movePageByGet('<%=request.getContextPath()%>/admin/product/list');
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