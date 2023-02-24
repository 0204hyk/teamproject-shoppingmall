<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>공지사항 등록</title>
	<%@ include file="../admin_cdn.jspf" %>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../admin_header.jspf" %>
	
	<div class="notice-content shadow">
		<div class="notice-title"><h1>공지사항 등록</h1></div>
		<div class="container">
			<form action="<%=request.getContextPath()%>/admin/notice/write" method="POST">
				<input type="text" class="notice-write-title" name="notice_title" placeholder="제목을 입력하세요." autofocus/>
		  		<textarea class="summernote" name="notice_content"></textarea>
		  		<div class="d-grid d-md-flex justify-content-md-end" style="margin-top: 15px;">
		  			<input type="button" onclick="location.href='<%=request.getContextPath()%>/admin/notice/list'" class="submit-btn btn btn-secondary btn-lg" value="취 소" />
		  			<input type="submit" class="submit-btn btn btn-secondary btn-lg" value="등 록" />
		  		</div>
		  	</form>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	<script src="/project/resources/admin/js/summernote.js"></script>
	
	<%@ include file="../admin_footer.jspf" %>
</body>
</html>