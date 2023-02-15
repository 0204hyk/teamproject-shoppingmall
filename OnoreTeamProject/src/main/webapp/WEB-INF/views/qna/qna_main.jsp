<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 Q&A</title>
<%@include file="./header.jspf"%>
<link rel="icon" href="/project/resources/qna/images/favicon.png">
</head>
<body>
	<%@include file="./top.jspf"%>

	<div class="border"
		style="padding-top: 300px; width: auto; height: 800px;">
		<hr>
		<div style="padding-top: 100px">
		<table border="1">
			<tr>
				<th class="title">번호</th>
				<th class="title">분류</th>
				<th class="title">제목</th>
				<th class="title">글쓴이</th>
				<th class="title">등록일</th>
			</tr>
			<tr>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
				<td>test</td>
			</tr>
		</table>
		</div>
		<hr>
	</div>

	
	<a class="btn" href="./qna_write">글쓰기</a>
	<%@include file="./bottom.jspf"%>
</body>

</html>