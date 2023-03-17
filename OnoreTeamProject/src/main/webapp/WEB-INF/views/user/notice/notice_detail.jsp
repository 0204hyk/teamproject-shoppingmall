<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf" %>
<link rel="icon" href="<%=request.getContextPath() %>/resources/review/image/파비콘.png">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/notice/css/notice_detail.css">
</head>
<body>

	<%@ include file="../top.jspf" %>

	<div class="main" style="padding-top: 127px;  margin:50px; margin-top: 0px;">
	<hr>
		<div class="notice_div">
			<div>
				<div id="title">${notices.notice_title }</div>
				<div id="date">${notices.creationNoticeDate }</div>
			</div>
			<hr>
			<div><br>${notices.notice_content }<br></div>
			<hr>
			<br>
			<button onclick="location.href='./main'" id="golist">목록으로</button>	
		</div>
		
	</div>
	
	<hr>
	
	<%@ include file="../bottom.jspf" %>

</body>
</html>