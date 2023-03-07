<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<h3>로그인</h3>
	<form action="<%=request.getContextPath()%>/shop" method="POST">
		ID : <input type="text" id="login_id" name="login_id" /> <br>
		PW : <input type="text" id="login_pw" name="login_pw" /> <br>
		<input type="submit" value="로그인"/>
	</form>

</body>
</html>