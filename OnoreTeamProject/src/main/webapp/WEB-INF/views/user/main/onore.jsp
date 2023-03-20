<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" href="<%=request.getContextPath() %>/resources/main/images/fabicon.png">
    <title>ONÓRE</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lora&display=swap"rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="https://kit.fontawesome.com/43273b5a4f.js"crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet"href="<%=request.getContextPath() %>/resources/main/css/main.css">
</head>
<body>

<%@ include file="../top.jspf" %>
    
    <div class="main">
        <img class="background" src="<%=request.getContextPath() %>/resources/main/images/img_main.png" alt="background" style="width:100%;">
    </div>
    
<script src="<%=request.getContextPath()%>/resources/main/js/onore.js"></script>
<%@ include file="../bottom.jspf" %>
</body>
</html>