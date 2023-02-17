<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" href="/project/resources/main/images/파비콘.png">
    <title>ONÓRE</title>
<%@include file="../member/member_header.jspf" %>
    
</head>
<body>

<%@include file="../member/member_top.jspf" %>

<h1>All Members</h1>

<ul>
	<c:forEach items = "${members }" var="member">
	<li>${members }</li>
	</c:forEach>
</ul>


<script src="/project/resources/menu/js/menu.js"></script>
<%@include file="../member/member_bottom.jspf" %>