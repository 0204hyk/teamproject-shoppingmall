<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>공지사항 수정</title>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	
	<div class="notice-content shadow">
		<div class="notice-title"><h1>공지사항 수정</h1></div>
		<div class="container">
			<form id="notice-modify-form" name="notice-modify-form" method="POST">
				<input type="hidden" name="notice_num" value="${notice.notice_num}"/>
				<input type="text" class="notice-write-title" name="notice_title" placeholder="제목을 입력해주세요." value="${notice.notice_title}"/>
		  		<textarea class="summernote" name="notice_content">${notice.notice_content}</textarea>
		  		<div class="d-grid d-md-flex justify-content-md-end" style="margin-top: 15px;">
		 			<input type="button" id="modify-cancle-btn" class="submit-btn btn btn-secondary btn-lg" value="취 소"/>
					<input type="button" onclick="modifyNotice('<%=request.getContextPath()%>/admin/notice/modify')" class="submit-btn btn btn-secondary btn-lg" value="수 정"/>
		  		</div>
		  	</form>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/admin/js/summernote_notice.js"></script>
	<script src="<%=request.getContextPath()%>/resources/admin/js/notice_write.js"></script>
	
</body>
</html>