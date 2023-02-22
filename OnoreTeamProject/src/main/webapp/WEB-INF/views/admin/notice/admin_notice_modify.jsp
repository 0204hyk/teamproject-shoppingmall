<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>공지사항 수정</title>
	<%@ include file="../admin_cdn.jspf" %>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../admin_header.jspf" %>
	
	<div class="notice-content shadow">
		<div class="notice-title"><h1>공지사항 수정</h1></div>
		<div class="container">
			<form action="<%=request.getContextPath()%>/admin/notice/modify" method="POST">
				<input type="hidden" name="notice_num" value="${notice.notice_num}"/>
				<input type="text" class="notice-write-title" name="notice_title" placeholder="제목을 입력하세요." value="${notice.notice_title}"/>
		  		<textarea class="summernote" name="notice_content">${notice.notice_content}</textarea>
		  		<div class="d-grid gap-5 d-md-flex justify-content-md-end" style="margin-top: 10px;">
		  			<input type="submit" class="submit-btn btn btn-secondary btn-lg" value="수 정" />
		  		</div>
		  	</form>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js""></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    <script>
        $(document).ready(function() {
        	$('.summernote').summernote({
                	placeholder: '내용을 작성해주세요.',
                	height: 560,
                	lang: 'ko-KR',
                	disableResizeEditor: true,
        		  toolbar: [
        			    // [groupName, [list of button]]
        			    ['fontname', ['fontname']],
        			    ['fontsize', ['fontsize']],
        			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
        			    ['color', ['forecolor','color']],
        			    ['table', ['table']],
        			    ['para', ['ul', 'ol', 'paragraph']],
        			    ['height', ['height']],
        			    ['insert',['picture','link','video']],
        			    ['view', ['fullscreen', 'help']]
        			  ],
        			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        	});
            $('.dropdown-toggle').dropdown();
        });
    </script>
		
	<%@ include file="../admin_footer.jspf" %>
</body>
</html>