<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>상품 수정</title>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	
	<div class="product-content shadow">
		<div class="product-title"><h1>상품 수정</h1></div>
		<div class="container">
			<form id="product-regist-form" name="product-regist-form" method="POST" enctype="multipart/form-data">
				<input type="hidden" id="input-num" name="product_num" value="${product.product_num}"/>
				<div class="label-container">
					<label for="input-category" class="input-label">분 류</label>
					<select id="input-category" class="form-select category-select" name="category_num">
						<option value="0">카테고리를 선택해주세요.</option>
						<c:forEach items="${categories}" var="category">
							<c:choose>
								<c:when test="${product.category_num == category.category_num}">
									<option value="${category.category_num}" selected>${category.category_name}</option>		
								</c:when>
								<c:otherwise>
									<option value="${category.category_num}">${category.category_name}</option>								
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<div class="label-container">
					<label for="input-name" class="input-label">상품명</label>
					<input type="text" id="input-name" class="form-control product-info" name="product_name" placeholder="상품명을 입력해주세요." value="${product.product_name}"/>
				</div>
				<div class="label-container">
					<label for="input-price" class="input-label">가 격</label>
				<input type="text" id="input-price" class="form-control product-info" name="product_price" placeholder="상품의 가격을 입력해주세요." value="${product.product_price}"/>
				</div>
				<div>
					<p class="thumbnail-title" style="font-size: 20px; margin-top: 5px;">상품 소개글</p>
					<textarea name="product_info" id="input-info" class="form-control product-info" rows="5" placeholder="상품의 소개글을 작성해주세요." style="resize: none; width: 100%;">${product.product_info}</textarea>
				</div>
				<div class="thumbnail-contaioner">
					<p class="thumbnail-title" style="font-size: 20px; margin-top: 15px;">상품 썸네일</p>
					<div class="row">
						<div class="col">
							<c:choose>
								<c:when test="${empty product.product_thumbnail_1}">
									<img src="<%=request.getContextPath()%>/resources/admin/image/default_image.png" id="preview1" class="thumbnail-preview"/>		
								</c:when>
								<c:otherwise>
									<img src="${product.product_thumbnail_1}" id="preview1" class="thumbnail-preview"/>
								</c:otherwise>
							</c:choose>
							<input class="form-control input-thumbnail" type="file" id="thumbnail1" name="product_thumbnail_1" accept="image/*">
						</div>
						<div class="col">
							<c:choose>
								<c:when test="${empty product.product_thumbnail_2}">
									<img src="<%=request.getContextPath()%>/resources/admin/image/default_image.png" id="preview2" class="thumbnail-preview"/>		
								</c:when>
								<c:otherwise>
									<img src="${product.product_thumbnail_2}" id="preview2" class="thumbnail-preview"/>
								</c:otherwise>
							</c:choose>							
							<input class="form-control input-thumbnail" type="file" id="thumbnail2" name="product_thumbnail_2" accept="image/*" disabled>
						</div>
						<div class="col">
							<c:choose>
								<c:when test="${empty product.product_thumbnail_3}">
									<img src="<%=request.getContextPath()%>/resources/admin/image/default_image.png" id="preview3" class="thumbnail-preview"/>		
								</c:when>
								<c:otherwise>
									<img src="${product.product_thumbnail_3}" id="preview3" class="thumbnail-preview"/>
								</c:otherwise>
							</c:choose>					
							<input class="form-control input-thumbnail" type="file" id="thumbnail3" name="product_thumbnail_3" accept="image/*" disabled>
						</div>
					</div>
				</div>
				<p style="font-size: 20px; margin-top: 10px;">상품 상세 정보</p>
		  		<textarea id="input-detail" class="summernote" name="product_detail">${product.product_detail}</textarea>
		  		<div class="d-grid d-md-flex justify-content-md-end" style="margin-top: 15px; margin-bottom: 10px;">
		  			<input type="button" id="modify-cancle-btn" class="submit-btn btn btn-secondary btn-lg" value="취 소" />
		  			<input type="button" onclick="productModify('<%=request.getContextPath()%>/admin/product/modify')" class="submit-btn btn btn-secondary btn-lg" value="수 정"/>
		  		</div>
		  	</form>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	<script src="/project/resources/admin/js/product_regist.js"></script>
	<script src="/project/resources/admin/js/summernote_product.js"></script>
	
</body>
</html>