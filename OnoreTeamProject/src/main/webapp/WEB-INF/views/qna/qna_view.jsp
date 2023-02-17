<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="./header.jspf"%>
<link rel="stylesheet" href="/project/resources/qna/css/file.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">
</head>
<body>
	<%@include file="./top.jspf"%>
	<div class="row justify-content-center" style="padding-top: 300px; width: auto; height: 800px;">
		<div class="col-md-8">
			<div class="row">
			제목 : ${views.qna_title }
			내용 : ${views.qna_content }<br>
			<a href="/project/resources/qna/images/${views.qna_img_1 }" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" >
				<img style="width: 150px; height: 150px;" src="/project/resources/qna/images/${views.qna_img_1 }" />
			</a>
			<a href="/project/resources/qna/images/${views.qna_img_2 }" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" >
				<img style="width: 150px; height: 150px;" src="/project/resources/qna/images/${views.qna_img_2 }" />
			</a>
			<a href="/project/resources/qna/images/${views.qna_img_3 }" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4" >
				<img style="width: 150px; height: 150px;" src="/project/resources/qna/images/${views.qna_img_3 }" />
			</a>
			</div>
		</div>
	</div>
	
	
<script>
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
<%@include file="./bottom.jspf"%>
</body>
</html>