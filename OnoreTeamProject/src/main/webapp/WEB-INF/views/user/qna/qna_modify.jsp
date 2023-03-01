<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 Q&A</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
<%@include file="../header.jspf"%>
<link rel="stylesheet" href="/project/resources/qna/css/qna_detail.css" />
</head>
<body>
	<%@include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; height: 1200px; margin: 50px; margin-top: 0px;">
		<hr />
		
		<form action="./qna_modify" method="POST">
		<div>
			<div style="width: 1200px; height: 600px; ">
				<input type="hidden" name="qna_num" value=${qna.qna_num } />
				<div >
		
				<input type="text" name="qna_title" value=${qna.qna_title } />
				</div>
				
					<div style="width: 1200px; height: 400px;">
						<textarea rows="10" cols="100" name="qna_content">${qna.qna_content }</textarea>
					</div>
	
			</div>
		</div>
		<input type="submit" value="글 수정">
		</form>
	</div>


	<%@include file="../bottom.jspf"%>
</body>
</html>