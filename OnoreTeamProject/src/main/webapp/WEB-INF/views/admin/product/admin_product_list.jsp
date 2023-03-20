<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>상품 목록</title>
</head>
<body>
	
	<div class="product-content shadow" style="height: 835px;">
		<div class="product-title">
			<h1>상품 목록</h1>
			<select name="search_type" class="form-select search-type" style="width: 150px;">
				<option value="0">ALL</option>
				<c:forEach items="${categories}" var="category">
					<c:choose>
						<c:when test="${search_type eq category.category_num}">
							<option value="${category.category_num}" selected>${category.category_name}</option>
						</c:when>
						<c:otherwise>
							<option value="${category.category_num}">${category.category_name}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			<input type="text" class="form-control search-box" name="search_keyword" placeholder="상품명을 입력해주세요." value="${search_keyword}" autocomplete="off"/>
			<button type="submit" id="search-btn" style="color: gray;"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
		<form id="product-list-form" name="product-list-form" method="POST">
			<div class="container">
				<table class="product-board table table-hover">
					<thead class="table-secondary">
						<tr>
							<th><input type="checkbox" id="all-check"/></th>
							<th>NO</th>
							<th>이미지</th>
							<th>상품명</th>
							<th>분 류</th>
							<th>상품가격</th>
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
										<td style="width: 200px;"><img src="<%=request.getContextPath()%>/resources/admin/image/default_image.png" alt="이미지 미리보기" style="width: 100px; height: 100px; border-radius: 10px;"/></td>
									</c:when>
									<c:otherwise>							
										<td style="width: 200px;"><img src="${product.product_thumbnail_1}" alt="이미지 미리보기" style="width: 100px; height: 100px; border-radius: 10px;"/></td>
									</c:otherwise>
								</c:choose>
								<td style="vertical-align: middle;"><a href="javascript:movePageByGet('<%=request.getContextPath()%>/admin/product/modify?product_num=${product.product_num}')">${product.product_name}</a></td>
								<td style="width: 180px; vertical-align: middle;">
									<c:forEach items="${categories}" var="category">
										<c:if test="${category.category_num eq product.category_num}">${category.category_name}</c:if>
									</c:forEach>
								</td>
								<td style="width: 180px; vertical-align: middle;"><fmt:formatNumber value="${product.product_price}" pattern="#,###"/> 원</td>
								<td style="width: 180px; vertical-align: middle;">${product.creationProductDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right;">
					<ul class="pagination justify-content-center" style="margin-bottom: 0px;">
						<c:if test="${prev == true}">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/list?page=${pagination_start - 1}&search_type=${search_type}&search_keyword=${search_keyword}')">«</a>
							</li>												
						</c:if>
						
						<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
							<c:if test="${page == i}">
						    	<li class="page-item active">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/list?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
							<c:if test="${page != i}">
						    	<li class="page-item">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/list?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
						</c:forEach>
						
					    <c:if test="${next == true }">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/list?page=${pagination_end + 1}&search_type=${search_type}&search_keyword=${search_keyword}')">»</a>
							</li>				    					    
					    </c:if>
					</ul>
					<input type="button" id="product-delete-btn" class="action-btn" value="삭 제"/>
					<input type="button" onclick="movePageByGet('<%=request.getContextPath()%>/admin/product/regist')" class="action-btn" value="등 록"/>			
				</div>
			</div>
		</form>
	</div>
		
	<script src="<%=request.getContextPath()%>/resources/admin/js/product_list.js"></script>
	<script src="<%=request.getContextPath()%>/resources/admin/js/list_checkbox.js"></script>
	
</body>
</html>