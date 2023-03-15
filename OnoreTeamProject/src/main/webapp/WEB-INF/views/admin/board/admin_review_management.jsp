<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>후기글 목록</title>
</head>
<body>
	<div class="board-content shadow">
		<div class="board-title">
			<h1>후기글 목록</h1>
			<select name="search_type" class="form-select search-type">
				<c:choose>
					<c:when test="${search_type eq 'content'}">
						<option value="content" selected>내용</option>
						<option value="writer">작성자</option>
						<option value="product">상품명</option>
					</c:when>
					<c:when test="${search_type eq 'writer'}">
						<option value="content">내용</option>
						<option value="writer" selected>작성자</option>
						<option value="product">상품명</option>
					</c:when>
					<c:when test="${search_type eq 'product'}">
						<option value="content">내용</option>
						<option value="writer">작성자</option>
						<option value="product" selected>상품명</option>
					</c:when>
					<c:otherwise>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
						<option value="product">상품명</option>		
					</c:otherwise>
				</c:choose>
			</select>
			<input type="text" class="form-control search-box" name="search_keyword" placeholder="검색어를 입력해주세요." value="${search_keyword}"/>
			<button type="submit" id="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
		<form id="review-list-form" name="review-list-form" method="POST">
			<div class="container">
				<table class="review-board table table-hover">
					<thead class="table-secondary">
						<tr>
							<th><input type="checkbox" id="all-check"/></th>
							<th>NO</th>
							<th>이미지</th>
							<th>내 용</th>
							<th>상품명</th>
							<th>평 점</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reviewList}" var="review">
							<tr>
								<td style="width: 50px; vertical-align: middle;"><input type="checkbox" class="row-check" name="row_check" value="${review.review_num}"/></td>
								<td style="width: 80px; vertical-align: middle;">${review.review_num}</td>
								<c:choose>
									<c:when test="${empty review.review_img_1}">
										<td style="width: 200px;"><img src="<%=request.getContextPath()%>/resources/admin/image/default_image.png" alt="이미지 미리보기" style="width: 100px; height: 100px; border-radius: 10px;"/></td>
									</c:when>
									<c:otherwise>							
										<td style="width: 200px;"><img src="${review.review_img_path}${review.review_img_1}" alt="이미지 미리보기" style="width: 100px; height: 100px; border-radius: 10px;"/></td>
									</c:otherwise>
								</c:choose>
								<td id="review-content" style="vertical-align: middle;"><a href="">${review.review_content}</a></td>
								<td style="width: 150px; vertical-align: middle;">${review.product_name}</td>
								<td id="review-rating" style="width: 150px; vertical-align: middle">
									<c:choose>
										<c:when test="${review.review_rating eq 1}"><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></c:when>
										<c:when test="${review.review_rating eq 2}"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></c:when>
										<c:when test="${review.review_rating eq 3}"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i><i class="fa-regular fa-star"></i></c:when>
										<c:when test="${review.review_rating eq 4}"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-regular fa-star"></i></c:when>
										<c:when test="${review.review_rating eq 5}"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></c:when>
									</c:choose>
								</td>
								<td style="width: 150px; vertical-align: middle;">${review.mem_id}</td>
								<td style="width: 150px; vertical-align: middle;">${review.creationReviewDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align: right;">
					<ul class="pagination justify-content-center" style="margin-bottom: 0px;">
						<c:if test="${prev == true}">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/board/review?page=${pagination_start - 1}&search_type=${search_type}&search_keyword=${search_keyword}')">«</a>
							</li>												
						</c:if>
						
						<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
							<c:if test="${page == i}">
						    	<li class="page-item active">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/board/review?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
							<c:if test="${page != i}">
						    	<li class="page-item">
						    		<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/board/review?page=${i}&search_type=${search_type}&search_keyword=${search_keyword}')">${i}</a>
						    	</li>
							</c:if>
						</c:forEach>
						
					    <c:if test="${next == true }">
							<li class="page-item">
								<a class="page-link" href="javascript:void(0)" onclick="movePageByGet('<%=request.getContextPath()%>/admin/board/review?page=${pagination_end + 1}&search_type=${search_type}&search_keyword=${search_keyword}')">»</a>
							</li>				    					    
					    </c:if>
					</ul>
					<input type="button" id="review-delete-btn" class="submit-btn btn btn-secondary btn-lg" value="삭 제"/>
				</div>
			</div>
		</form>
	</div>
		
	<script src="<%=request.getContextPath()%>/resources/admin/js/review_list.js"></script>
	<script src="<%=request.getContextPath()%>/resources/admin/js/list_checkbox.js"></script>
	
</body>
</html>