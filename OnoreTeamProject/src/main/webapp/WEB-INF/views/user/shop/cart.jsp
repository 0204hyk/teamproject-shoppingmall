<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		String size = request.getParameter("size");
		String heel = request.getParameter("heel");
		String sole = request.getParameter("sole");
		String order_cnt = request.getParameter("order_cnt");
		String product_num = request.getParameter("product_num");
		HttpSession se = request.getSession();
		String name = se.getId();
	%>
	
	<%=size %>
	<%=heel %>
	<%=sole %>
	<%=order_cnt %>
	<%=product_num %>
	<%=name %>
	
	
	
</body>
</html>